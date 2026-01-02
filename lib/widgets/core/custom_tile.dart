import 'package:nanduba/export.dart';

class CustomTile extends StatelessWidget {
  const CustomTile(
      {super.key,
      required this.prefixSvgImage,
      required this.title,
      this.onPressed,
      required this.isButton,
      this.svgButton,
      this.onTap,
      this.svgBackColor,
      this.outBorderRadius,
      this.inBorderRadius,
      this.svgColor,
      this.svgHeight,
      this.svgWidth,
      this.isBorder = false});
  final String prefixSvgImage;
  final String title;
  final VoidCallback? onPressed;
  final VoidCallback? onTap;
  final bool isButton;
  final String? svgButton;
  final Color? svgBackColor;
  final double? outBorderRadius;
  final double? inBorderRadius;
  final Color? svgColor;
  final double? svgHeight;
  final double? svgWidth;
  final bool? isBorder;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomContainer(
        vMargin: 1.h,
        vpadding: isButton ? 1.h : 0.9.h,
        hpadding: 2.w,
        borderRadius: outBorderRadius ?? (isButton ? 15.sp : 18.sp),
        isBorder: isBorder,
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: isButton ? 4.5.w : 3.5.w,
                      vertical: isButton ? 2.h : 1.6.h,
                    ),
                    decoration: BoxDecoration(
                      color: svgBackColor ?? AppColors.secondary,
                      borderRadius: BorderRadius.circular(
                          inBorderRadius ?? (isButton ? 12.sp : 14.sp)),
                    ),
                    width: isButton ? 16.w : 14.w,
                    child: SvgPicture.asset(
                      prefixSvgImage,
                      height: svgHeight ?? 3.h,
                      width: svgWidth,
                      color: svgColor,
                    ),
                  ),
                  2.width,
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            isButton
                ? CustomButton(
                    height: 4.h,
                    width: 26.w,
                    vPadding: 0.5.h,
                    labelFontSize: 10.sp,
                    labelFontWeight: FontWeight.w600,
                    label: AppText.renewal,
                    onPressed: onPressed!)
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    child: SvgPicture.asset(
                      svgButton ?? AppSvgs.arrowCircleRight,
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
