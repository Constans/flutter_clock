import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math' as Math;

import 'dash_paint_bucket.dart';
import 'dash_parts.dart';

class DashAnimated extends CustomPainter {
  DashAnimated({
    @required this.seconds,
    @required this.secondsAngle,
    @required this.minutesAngle,
    @required this.hoursAngle,
  })  : assert(seconds != null),
        assert(secondsAngle != null),
        assert(minutesAngle != null),
        assert(hoursAngle != null),
        assert(seconds >= 0),
        assert(seconds <= 60);

  double secondsAngle;
  double minutesAngle;
  double hoursAngle;
  int seconds;

  static final Offset viewportOffset = Offset(85.0, 100.0);
  static final Offset referenceSize = Offset(970.0, 855.0);
  static final Offset hoursSparklePosition = Offset(307.0, 297.0);
  static final Offset minutesSparklePosition = Offset(662.0, 297.0);

  @override
  void paint(Canvas canvas, Size size) {
    // viewport clipping
    //Path clipPath = Path();
    //clipPath.addRect(Rect.fromPoints(Offset(85.0,100.0), Offset(800.0+85.0,480.0+100.0)));
    //canvas.clipPath(clipPath);

    Path dashNose = DashParts.dashNose;
    if (seconds != 0) {
      dashNose =
          (seconds % 2 == 0) ? DashParts.dashNoseLeft : DashParts.dashNoseRight;
    }
    canvas.drawPath(dashNose, DashPaintBucket.brownPaint);
    canvas.drawPath(
        DashParts.getSparkle(
            hoursSparklePosition, hoursAngle + (1.5 * Math.pi)),
        DashPaintBucket.whitePaint);
    canvas.drawPath(
        DashParts.getSparkle(
            minutesSparklePosition, minutesAngle + (1.5 * Math.pi)),
        DashPaintBucket.whitePaint);
  }

  @override
  bool shouldRepaint(DashAnimated oldDelegate) {
    return oldDelegate.seconds != seconds ||
        oldDelegate.seconds != secondsAngle ||
        oldDelegate.minutesAngle != minutesAngle ||
        oldDelegate.hoursAngle != hoursAngle;
  }
}
