import 'package:nanduba/export.dart';
import 'package:nanduba/widgets/core/custom_svg_widget.dart';

class MyProductContainer extends StatelessWidget {
  const MyProductContainer({
    super.key,
    required this.serviceType,
    required this.assetPath,
    this.isSvg = false,
    this.selected = false,
    required this.onTap, required this.assetHeight, required this.assetWidth,
  });

  final String serviceType;
  final String assetPath;
  final double assetHeight;
  final double assetWidth;
  final bool isSvg;
  final bool selected;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: CustomContainer(
          width: 29.w,
          vMargin: 0.5.h,
          hpadding: 2.w,
          vpadding: 1.h,
          isBorder: selected,
          child: Wrap(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: isSvg ? 1.h : 0,
                          horizontal: isSvg ? 10.w : 0),
                      width: !isSvg ? 24.w : null,
                      height: !isSvg ? 4.h : null,
                      decoration: BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.circular(2.w),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(!isSvg ? 2.w : 0),
                        child: isSvg
                            ? MySvg(
                          assetName: assetPath,
                          color: AppColors.primary,
                          height: assetHeight,
                          width: assetWidth,)
                            : Image.asset(
                          assetPath,
                          height: 3.8.h,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(height: 1.h),
                    SizedBox(
                      width: 20.w,
                      child: Text(
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        serviceType,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
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
