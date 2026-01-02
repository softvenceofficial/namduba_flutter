import 'package:nanduba/export.dart';
import 'dart:ui' as ui;

class CommonBackgroundPaint extends CustomPainter {
  @override
  //Gredient paint
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = ui.Gradient.linear(
        Offset(90, 0.h),
        Offset(90, 10.h),
        [const Color(0xFFFFF5F5), AppColors.white],
      );
    canvas.drawPaint(paint);

    // Draw the circle in the center-right
    var rightMidCirclePaint = Paint()
      ..color = const Color(0xFFFFF7F7)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(90.w, 45.h), 18.w, rightMidCirclePaint);

    var leftCirclePaint = Paint()
      ..color = const Color(0xFFFFF7F7)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(10.w, 95.h), 20.w, leftCirclePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
