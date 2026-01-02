import 'package:nanduba/export.dart';

class SignInSignUpBackgroundPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // final paint = Paint()
    //   ..color = AppColors.secondary
    //   ..style = PaintingStyle.fill;

    // // Draw the background
    // canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);

    //Draw the arc
    Paint arcpaint = Paint()
      ..color = AppColors.secondary
      ..style = PaintingStyle.fill;

    Path path = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height * 0.25)
      ..quadraticBezierTo(
          size.width / 2, size.height * 0.4, size.width, size.height * 0.25)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(path, arcpaint);

    // Draw the large circle in the top-left
    var circlePaint = Paint()
      ..color = const Color(0xFFF8E7E9)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(100.w, 3.h), 10.w, circlePaint);

    // Draw the single dot in the bottom-left
    var dotPaintBottom = Paint()
      ..color = const Color(0xFFF5E1E3)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(90.w, 7.5.h), 2.w, dotPaintBottom);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
