import 'package:get/get.dart';
import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';

class CustomServiceContainer extends StatefulWidget {
  const CustomServiceContainer({
    super.key,
    required this.serviceType,
    required this.assetPath,
    this.isSvg = false,
    this.selected = false,
    required this.onTap,
  });

  final String serviceType;
  final String assetPath;
  final bool isSvg;
  final bool selected;
  final VoidCallback onTap;

  @override
  State<CustomServiceContainer> createState() => _CustomServiceContainerState();
}

class _CustomServiceContainerState extends State<CustomServiceContainer> {
  @override
  Widget build(BuildContext context) {
    bool isSelected = false;
    return GestureDetector(
        onTap: widget.onTap,
        child: CustomContainer(
          width: 29.w,
          vMargin: 0.5.h,
          hpadding: 2.w,
          vpadding: 1.h,
          isBorder: widget.selected,
          child: Wrap(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: widget.isSvg ? 1.h : 0,
                          horizontal: widget.isSvg ? 10.w : 0),
                      width: !widget.isSvg ? 24.w : null,
                      height: !widget.isSvg ? 4.h : null,
                      decoration: BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.circular(2.w),
                      ),
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(!widget.isSvg ? 2.w : 0),
                        child: widget.isSvg
                            ? SvgPicture.asset(
                                height: 2.h,
                                color: AppColors.primary,
                                widget.assetPath,
                                fit: BoxFit.contain,
                              )
                            : Image.asset(
                                widget.assetPath,
                                height: 3.8.h,
                                fit: BoxFit.fill,
                              ),
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Text(
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      widget.serviceType,
                      style:
                          Textfontstyle.TextStyle12w500c212121poppins.copyWith(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class CustomServices extends StatefulWidget {
  const CustomServices({
    super.key,
    required this.serviceType,
    required this.assetPath,
    this.isSvg = false,
    this.selected = false,
    this.h,
    this.w,
    required this.onTap,
    this.svgHeight,
    this.svgWidth,
    this.hpadding,
    this.vpadding,
  });

  final String serviceType;
  final String assetPath;
  final double? h;
  final double? w;
  final double? hpadding;
  final double? vpadding;
  final bool isSvg;
  final bool selected;
  final Function() onTap;
  final double? svgHeight;
  final double? svgWidth;

  @override
  State<CustomServices> createState() => _CustomServicesState();
}

class _CustomServicesState extends State<CustomServices> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: CustomContainer(
        width: 29.w,
        vMargin: 0.5.h,
        hpadding: 2.w,
        vpadding: 1.h,
        isBorder: widget.selected,
        child: Wrap(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: widget.vpadding ?? 0.5.h,
                        horizontal: widget.hpadding ?? 8.w),
                    width: !widget.isSvg ? 24.w : null,
                    height: !widget.isSvg ? 3.h : null,
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.circular(2.w),
                    ),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(!widget.isSvg ? 2.w : 0),
                      child: widget.isSvg
                          ? SvgPicture.asset(
                              height: widget.h ?? 3.h,
                              color: AppColors.primary,
                              widget.assetPath,
                              fit: BoxFit.contain,
                            )
                          : Image.asset(
                              widget.assetPath,
                              height: 3.8.h,
                              fit: BoxFit.fill,
                            ),
                    ),
                  ),
                  SizedBox(height: 1.h),
                  Text(
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    widget.serviceType,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
