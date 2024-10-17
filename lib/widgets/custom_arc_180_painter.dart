import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart';

import '../common/color_extension.dart';

class ArcValueModel {
  final Color color;
  final double value;

  ArcValueModel({required this.value, required this.color});
}

class CustomArc180Painter extends CustomPainter {
  final double start;
  final double end;
  final double width;
  final double bgWidth;
  final double blurWidth;
  final double space;
  final List<ArcValueModel> drawArcs;

  CustomArc180Painter(
      {required this.drawArcs,
      this.start = 0,
      this.end = 180,
      this.space = 3,
      this.bgWidth = 10,
      this.width = 15,
      this.blurWidth = 6});

  @override
  void paint(Canvas canvas, Size size) {
    var rect = Rect.fromCircle(
        center: Offset(size.width / 2, size.height), radius: size.width / 2);

    Paint backgroundPaint = Paint();
    backgroundPaint.color = TColor.gray70.withOpacity(0.5);
    backgroundPaint.style = PaintingStyle.stroke;
    backgroundPaint.strokeWidth = bgWidth;
    backgroundPaint.strokeCap = StrokeCap.round;

    var startVal = 180 + start;
    var drawStart = startVal;
    canvas.drawArc(
        rect, radians(startVal), radians(180), false, backgroundPaint);

    for (var arcObj in drawArcs) {
      Paint activePaint = Paint();
      activePaint.color = arcObj.color;
      activePaint.style = PaintingStyle.stroke;
      activePaint.strokeWidth = width;
      activePaint.strokeCap = StrokeCap.round;

      Paint shadowPaint = Paint()
        ..color = arcObj.color.withOpacity(0.3)
        ..style = PaintingStyle.stroke
        ..strokeWidth = width + blurWidth
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5);

// Draw shadow arc
      Path path = Path();
      path.addArc(rect, radians(drawStart), radians(arcObj.value - space));
      canvas.drawPath(path, shadowPaint);

      canvas.drawArc(
          rect, radians(drawStart), radians(arcObj.value - space), false, activePaint);

      drawStart = drawStart + arcObj.value + space;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
  @override
  bool shouldRebuildSemantics(covariant CustomPainter oldDelegate) => false;
}
