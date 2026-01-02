import 'package:nanduba/export.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  final double? vMargin;
  final double? hMargin;
  final double? vpadding;
  final double? hpadding;
  final double? spreadRadius;
  final double? blurRadius;
  final double? borderRadius;
  final Color? color;
  final bool? isBorder;
  final Clip clipBehavior;

  const CustomContainer({
    super.key,
    required this.child,
    this.borderRadius,
    this.height,
    this.width,
    this.vMargin,
    this.hMargin,
    this.vpadding,
    this.hpadding,
    this.spreadRadius,
    this.blurRadius,
    this.color,
    this.isBorder = false,
    this.clipBehavior = Clip.none,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.symmetric(
        vertical: vMargin ?? 0.h,
        horizontal: hMargin ?? 0.w,
      ),
      padding: EdgeInsets.symmetric(
        vertical: vpadding ?? 0.h,
        horizontal: hpadding ?? 0.w,
      ),
      clipBehavior: clipBehavior,
      decoration: BoxDecoration(
          color: color ?? AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.shadow,
              spreadRadius: spreadRadius ?? 2,
              blurRadius: blurRadius ?? 10,
            ),
          ],
          borderRadius: BorderRadius.circular(borderRadius ?? 3.5.w),
          border:
              isBorder == true ? Border.all(color: AppColors.midPink) : null),
      child: child,
    );
  }
}
