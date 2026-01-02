import 'package:nanduba/export.dart';

class SplashBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.secondary
      ..style = PaintingStyle.fill;

    // Draw the background
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);

    // Draw the large circle in the top-left
    var circlePaint = Paint()
      ..color = const Color(0xFFF8E7E9)
      ..style = PaintingStyle.fill;
    // Draw the large circle inside in the top-left
    var circlePaintOver = Paint()
      ..color = AppColors.secondary
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(-2.w, 20.h), 15.w, circlePaint);
    canvas.drawCircle(Offset(-2.w, 20.h), 10.w, circlePaintOver);

    // Draw the small dots in the top-right
    var dotPaint = Paint()
      ..color = const Color(0xFFF7D2D6)
      ..style = PaintingStyle.fill;

    for (int i = 0; i < 7; i++) {
      canvas.drawCircle(Offset(95.w, 2.h + i * 2.h), 0.5.w, dotPaint);
      canvas.drawCircle(Offset(90.w, 2.h + i * 2.h), 0.5.w, dotPaint);
      canvas.drawCircle(Offset(85.w, 2.h + i * 2.h), 0.5.w, dotPaint);
    }

    // Draw the small circle in the right
    var smallcircle = Paint()
      ..color = const Color(0xFFF5E1E3)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(100.w, 30.h), 5.w, smallcircle);

    // Draw the single dot in the bottom-left
    var dotPaintBottom = Paint()
      ..color = const Color(0xFFF5E1E3)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(10.w, 75.h), 2.w, dotPaintBottom);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
