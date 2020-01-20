import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';

class DashParts {
  // cache all Dash parts
  static final Path dashBody = _dashBody;
  static final Path dashFace = _dashFace;
  static final Path dashEyeSocketsContours = _dashEyeSocketsContours;
  static final Path dashEyeSockets = _dashEyeSockets;
  static final Path dashEyes = _dashEyes;
  static final Path dashEyeSparkle = _dashEyeSparkle;
  static final Path dashBelly = _dashBelly;
  static final Path dashWing = _dashWing;
  static final Path dashLeftWing = _dashLeftWing;
  static final Path dashRightWing = _dashRightWing;
  static final Path dashLeg = _dashLeg;
  static final Path dashLeftLeg = _dashLeftLeg;
  static final Path dashRightLeg = _dashRightLeg;
  static final Path dashHair = _dashHair;
  static final Path dashNoseBase = _dashNoseBase;
  static final Path dashNose = _dashNose;
  static final Path dashNoseLeft = _dashNoseLeft;
  static final Path dashNoseRight = _dashNoseRight;

  static Path get _dashBody {
    return Path()
      ..addOval(
        Rect.fromPoints(
          Offset(0, 0),
          Offset(970, 850),
        ),
      );
  }

  static Path get _dashFace {
    return Path()
      ..addOval(
        Rect.fromPoints(
          Offset(106.5, 123.0),
          Offset(455.0 + 106.5, 435 + 123.0),
        ),
      )
      ..addOval(
        Rect.fromPoints(
          Offset(408.5, 123.0),
          Offset(408.5 + 455.0, 123.0 + 435.0),
        ),
      );
  }

  static Path get _dashEyeSocketsContours {
    return Path()
      ..addOval(
        Rect.fromPoints(
          Offset(230.0, 215.0),
          Offset(230.0 + 155.0, 215.0 + 170.0),
        ),
      )
      ..addOval(
        Rect.fromPoints(
          Offset(585.0, 215.0),
          Offset(585.0 + 155.0, 215.0 + 170.0),
        ),
      );
  }

  static Path get _dashEyeSockets {
    return Path()
      ..addOval(
        Rect.fromPoints(
          Offset(240.0, 225.0),
          Offset(240.0 + 135.0, 225.0 + 150.0),
        ),
      )
      ..addOval(
        Rect.fromPoints(
          Offset(595.0, 225.0),
          Offset(595.0 + 135.0, 225.0 + 150.0),
        ),
      );
  }

  static Path get _dashEyes {
    return Path()
      ..addOval(
        Rect.fromPoints(
          Offset(282.5, 275.0),
          Offset(282.5 + 50.0, 275.0 + 50.0),
        ),
      )
      ..addOval(
        Rect.fromPoints(
          Offset(637.5, 275.0),
          Offset(637.5 + 50.0, 275.0 + 50.0),
        ),
      );
  }

  static Path get _dashEyeSparkle {
    return Path()
      ..addOval(
        Rect.fromPoints(
          Offset(-8.0, -8.0),
          Offset(8.0, 8.0),
        ),
      );
  }

  static Path getSparkle(Offset at, double rotatedWith) {
    Matrix4 m = Matrix4.identity()
      ..translate(at.dx, at.dy)
      ..setRotationZ(rotatedWith)
      ..translate(50.0, 0);
    List l = m.storage.toList();
    return dashEyeSparkle.transform(Float64List.fromList(l));
  }

  static Path get _dashBelly {
    Offset topLeft = Offset(160, 500);
    Offset topRight = Offset(810, 500);
    Offset midCenter = Offset((topLeft.dx + topRight.dx) / 2, topLeft.dy + 360);
    Offset bottomCenter = Offset((topLeft.dx + topRight.dx) / 2, 845);
    return Path()
      ..moveTo(topLeft.dx, topLeft.dy)
      ..quadraticBezierTo(midCenter.dx, midCenter.dy, topRight.dx, topRight.dy)
      ..quadraticBezierTo(topRight.dx + 50, topRight.dy + bottomCenter.dy * 0.4,
          bottomCenter.dx, bottomCenter.dy)
      ..quadraticBezierTo(topLeft.dx - 50, topLeft.dy + bottomCenter.dy * 0.4,
          topLeft.dx, topLeft.dy);
  }

  static Path get _dashWing {
    return Path()
      ..addOval(
        Rect.fromPoints(
          Offset(-65, 0.0),
          Offset(65.0, 290.0),
        ),
      );
  }

  static Path get _dashRightWing {
    Matrix4 m = Matrix4.identity()
      ..translate(-20.0 + 65.0, 420.0)
      ..setRotationZ(-pi / 10);
    List l = m.storage.toList();
    return dashWing.transform(Float64List.fromList(l));
  }

  static Path get _dashLeftWing {
    Matrix4 m = Matrix4.identity()
      ..translate(860.0 + 65.0, 420.0)
      ..setRotationZ(pi / 10);
    List l = m.storage.toList();
    return dashWing.transform(Float64List.fromList(l));
  }

  static Path get _dashLeg {
    return Path()
      ..addOval(
        Rect.fromPoints(
          Offset(0.0, 0.0),
          Offset(50.0, 95.0),
        ),
      )
      ..addOval(
        Rect.fromPoints(
          Offset(33.0, 0.0),
          Offset(33.0 + 50.0, 95.0),
        ),
      )
      ..addOval(
        Rect.fromPoints(
          Offset(66.0, 0.0),
          Offset(66.0 + 50.0, 95.0),
        ),
      );
  }

  static Path get _dashRightLeg {
    Matrix4 m = Matrix4.identity()..translate(230.0, 759.0);
    List l = m.storage.toList();
    return dashLeg.transform(Float64List.fromList(l));
  }

  static Path get _dashLeftLeg {
    Matrix4 m = Matrix4.identity()..translate(623.0, 759.0);
    List l = m.storage.toList();
    return dashLeg.transform(Float64List.fromList(l));
  }

  static Path get _dashHair {
    Matrix4 m = Matrix4.identity()..translate(426.5, -80.0);
    List l = m.storage.toList();
    return dashLeg.transform(Float64List.fromList(l));
  }

  static Path get _dashNoseBase {
    return Path()
      ..moveTo(-37.5, 0)
      ..quadraticBezierTo(0, -26, 37.5, 0)
      ..lineTo(0, 147)
      ..lineTo(-37.5, 0);
  }

  static Path get _dashNose {
    Matrix4 m = Matrix4.identity()..translate(447 + 37.5, 356);
    List l = m.storage.toList();
    return dashNoseBase.transform(Float64List.fromList(l));
  }

  static Path get _dashNoseLeft {
    Matrix4 m = Matrix4.identity()
      ..translate(447 + 37.5, 356)
      ..setRotationZ(-pi / 40);
    List l = m.storage.toList();
    return dashNoseBase.transform(Float64List.fromList(l));
  }

  static Path get _dashNoseRight {
    Matrix4 m = Matrix4.identity()
      ..translate(447 + 37.5, 356)
      ..setRotationZ(pi / 40);
    List l = m.storage.toList();
    return dashNoseBase.transform(Float64List.fromList(l));
  }
}
