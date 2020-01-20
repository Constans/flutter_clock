// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:flutter_clock_helper/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:intl/intl.dart';
import 'package:vector_math/vector_math_64.dart' show radians;

import 'dash/dash_static.dart';
import 'dash/dash_animated.dart';

/// Total distance traveled by a second or a minute hand, each second or minute,
/// respectively.
final radiansPerTick = radians(360 / 60);

/// Total distance traveled by an hour hand, each hour, in radians.
final radiansPerHour = radians(360 / 12);

/// A basic analog clock.
///
/// You can do better than this!
class DashClock extends StatefulWidget {
  const DashClock(this.model);

  //this is left here for future hooks to the model
  final ClockModel model;

  @override
  _DashClockState createState() => _DashClockState();
}

class _DashClockState extends State<DashClock> {
  var _now = DateTime.now();
  Timer _timer;
  Matrix4 m4 = Matrix4.identity();

  @override
  void initState() {
    super.initState();
    // Set the initial values.
    m4.translate(-85.0, -100.0);
    _updateTime();
  }

  @override
  void didUpdateWidget(DashClock oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _updateTime() {
    setState(() {
      _now = DateTime.now();
      // Update once per second. Make sure to do it at the beginning of each
      // new second, so that the clock is accurate.
      _timer = Timer(
        Duration(seconds: 1) - Duration(milliseconds: _now.millisecond),
        _updateTime,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final time = DateFormat.Hms().format(DateTime.now());

    final secondsAngle = _now.second * radiansPerTick;
    final minutesAngle =
        _now.minute * radiansPerTick + (_now.second / 60) * radiansPerTick;
    final hoursAngle =
        _now.hour * radiansPerHour + (_now.minute / 60) * radiansPerHour;

    return Semantics.fromProperties(
      properties: SemanticsProperties(
        label: 'Dash clock showing time to be $time',
        value: time,
      ),
      child: Container(
        child: Stack(
          children: [
            AspectRatio(
              aspectRatio: 5 / 3,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Transform(
                  transform: m4,
                  child: CustomPaint(
                    size: Size(800, 480),
                    painter: DashStatic(),
                  ),
                ),
              ),
            ),
            AspectRatio(
              aspectRatio: 5 / 3,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Transform(
                  transform: m4,
                  child: CustomPaint(
                    size: Size(800, 480),
                    painter: DashAnimated(
                      seconds: _now.second,
                      secondsAngle: secondsAngle,
                      minutesAngle: minutesAngle,
                      hoursAngle: hoursAngle,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
