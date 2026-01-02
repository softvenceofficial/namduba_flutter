import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';

class CustomButton extends StatelessWidget {
  final double? height;
  final double? width;
  final double? borderRadius;
  final Color borderColor;
  final String? icon;
  final Color? iconColor;
  final String label;
  final double? labelFontSize;
  final FontWeight? labelFontWeight;
  final VoidCallback onPressed;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final double? vPadding;
  final double? hPadding;
  final bool isLoading;
  final Color? textcolor;

  const CustomButton(
      {super.key,
      this.height,
      this.textcolor,
      this.width,
      this.borderRadius,
      this.borderColor = AppColors.primary,
      this.icon,
      this.iconColor,
      required this.label,
      this.labelFontSize,
      this.foregroundColor,
      this.backgroundColor,
      required this.onPressed,
      this.isLoading = false,
      this.labelFontWeight,
      this.vPadding,
      this.hPadding});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height ?? 6.5.h,
        width: width ?? double.maxFinite,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
            vertical: vPadding ?? 1.h, horizontal: hPadding ?? 2.w),
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.primary,
          borderRadius: BorderRadius.circular(borderRadius ?? 25.sp),
          border: Border.all(color: borderColor),
        ),
        child: isLoading
            ? LoadingIndicator(
                indicatorType: Indicator.ballBeat,
                colors: [foregroundColor ?? AppColors.white],
                strokeWidth: 2.w,
              )
            : icon != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        icon!,
                        width: 15.sp,
                        height: 15.sp,
                        color: iconColor,
                      ),
                      2.width,
                      Text(
                        label,
                        // style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        //       color: foregroundColor ?? AppColors.white,
                        //       fontWeight: labelFontWeight ?? FontWeight.w700,
                        //       fontSize: labelFontSize ?? 12.sp,
                        //       fontFamily: GoogleFonts.poppins().fontFamily,
                        //     ),
                        style: Textfontstyle.TextStyle12w500c212121poppins
                            .copyWith(fontSize: 12.sp),
                      ),
                    ],
                  )
                : Text(
                    label,
                    // style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    //       color: foregroundColor ?? AppColors.white,
                    //       fontWeight: labelFontWeight ?? FontWeight.w700,
                    //       fontSize: labelFontSize ?? 14.sp,
                    //     ),
                    style: Textfontstyle.TextStyle12w500c212121poppins.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color:textcolor?? AppColors.white,
                    ),
                  ),
      ),
    );
  }
}
