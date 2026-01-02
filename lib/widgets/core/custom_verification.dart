import 'package:nanduba/export.dart';

class CustomVerificationContainer extends StatelessWidget {
  final String icon;
  final double? height;
  final double? width;
  final double? borderRadius;
  final double? svgHeight;
  final double? svgWidth;
  final double? vMargin;
  final double? hMargin;
  final double? vpadding;
  final double? hpadding;

  const CustomVerificationContainer(
      {super.key,
      required this.icon,
      this.height,
      this.width,
      this.vMargin,
      this.hMargin,
      this.vpadding,
      this.hpadding,
      this.svgHeight,
      this.svgWidth,
      this.borderRadius});

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
      decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(borderRadius ?? 10.w)),
      child: SvgPicture.asset(
        icon,
        fit: BoxFit.scaleDown,
        width: svgWidth,
        height: svgHeight,
      ),
    );
  }
}
