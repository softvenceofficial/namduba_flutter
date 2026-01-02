import 'package:nanduba/export.dart';

class SubServiceCustomTile extends StatelessWidget {
  const SubServiceCustomTile({
    super.key,
    required this.title,
    required this.onTap,
    required this.addOnTap,
    required this.minusOnTap,
    this.isBorder = false,
  });

  final String title;
  final VoidCallback onTap;
  final VoidCallback addOnTap;
  final VoidCallback minusOnTap;
  final bool? isBorder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final textStyle = Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.w600);
          final textSpan = TextSpan(text: title, style: textStyle);
          final textPainter = TextPainter(
            text: textSpan,
            maxLines: 2,
            textAlign: TextAlign.center,
            textDirection: TextDirection.ltr,
          );

          textPainter.layout(maxWidth: constraints.maxWidth * 0.70);
          final numLines = textPainter.computeLineMetrics().length;
          final isMultiLine = numLines > 1;

          return CustomContainer(
            vMargin: 1.h,
            vpadding: isMultiLine ? 1.h : 2.5.h,
            hpadding: 2.w,
            borderRadius: 15.sp,
            isBorder: isBorder,
            child: Row(
              children: [
                InkWell(
                  onTap: minusOnTap,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    child: SvgPicture.asset(
                      AppSvgs.minusCirlce,
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 65.w,
                        child: Text(
                          title,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: textStyle,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: addOnTap,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    child: SvgPicture.asset(
                      AppSvgs.addCircle,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
