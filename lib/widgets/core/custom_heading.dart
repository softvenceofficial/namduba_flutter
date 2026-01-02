import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';

class CustomHeading extends StatelessWidget {
  const CustomHeading({
    super.key,
    required this.title,
    required this.suffixText,
    this.suffixSvg = '',
    required this.onTap,
    this.isSuffixSvg = false,
    this.fontWeight = FontWeight.w800,
  });
  final String title;
  final String suffixText;
  final String suffixSvg;
  final bool isSuffixSvg;
  final FontWeight? fontWeight;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 60.w,
          child: Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Textfontstyle.TextStyle14w400c212121poppins.copyWith(
                color: AppColors.textColor, fontWeight: FontWeight.w700),

            //  Theme.of(context)
            //     .textTheme
            //     .bodyLarge
            //     ?.copyWith(fontWeight: fontWeight),
          ),
        ),
        InkWell(
          onTap: onTap,
          child: Row(
            children: [
              isSuffixSvg
                  ? SvgPicture.asset(suffixSvg)
                  : const SizedBox.shrink(),
              Text(
                suffixText,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 10.sp,
                      color: AppColors.midDarkGrey,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.midDarkGrey,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
