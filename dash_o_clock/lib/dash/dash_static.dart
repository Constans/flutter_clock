import 'dart:ui';

import 'package:flutter/material.dart';

import 'dash_paint_bucket.dart';
import 'dash_parts.dart';

class DashStatic extends CustomPainter {
  static final Offset viewportOffset = Offset(85.0, 100.0);
  static final Offset referenceSize = Offset(970.0, 855.0);

  @override
  void paint(Canvas canvas, Size size) {
    // viewport clipping
    //Path clipPath = Path();
    //clipPath.addRect(Rect.fromPoints(Offset(85.0,100.0), Offset(800.0+85.0,480.0+100.0)));
    //canvas.clipPath(clipPath);

    canvas.drawPath(DashParts.dashBody, DashPaintBucket.lightBluePaint);
    canvas.drawPath(DashParts.dashFace, DashPaintBucket.darkBluePaint);
    canvas.drawPath(
        DashParts.dashEyeSocketsContours, DashPaintBucket.greenPaint);
    canvas.drawPath(DashParts.dashEyeSockets, DashPaintBucket.blackPaint);
    canvas.drawPath(DashParts.dashEyes, DashPaintBucket.whitePaint);
    canvas.drawPath(DashParts.dashBelly, DashPaintBucket.whitePaint);
    canvas.drawPath(DashParts.dashRightWing, DashPaintBucket.darkBluePaint);
    canvas.drawPath(DashParts.dashLeftWing, DashPaintBucket.darkBluePaint);
    canvas.drawPath(DashParts.dashRightLeg, DashPaintBucket.brownPaint);
    canvas.drawPath(DashParts.dashLeftLeg, DashPaintBucket.brownPaint);
    canvas.drawPath(DashParts.dashHair, DashPaintBucket.lightBluePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
