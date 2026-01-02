import '../../../../../export.dart';
import '../../../../../widgets/core/my_text.dart';

class ReuseClaimDetailRow extends StatelessWidget {
  final String icon;
  final String title;
  final String description;
  final String buttonText;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? height;
  const ReuseClaimDetailRow(
      {super.key,
      required this.icon,
      required this.title,
      required this.description,
      required this.buttonText,
      this.fontWeight,
      this.fontSize,
      this.height});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          // height: 58,
          // width: 58,
          alignment: Alignment.center,
          // // margin: EdgeInsets.only(right: 15),
          padding: EdgeInsets.all(13),
          decoration: BoxDecoration(
            color: AppColors.secondary,
            borderRadius: BorderRadius.circular(16),
          ),
          child: SvgPicture.asset(
            icon,
            color: AppColors.primary,
            height: 3.8.h,
          ),
        ),
        3.width,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                text: title,
                fontWeight: FontWeight.w600,
                fontSize: 12.sp,
              ),
              0.5.height,
              MyText(
                text: description,
                fontWeight: fontWeight ?? FontWeight.w500,
                fontSize: fontSize ?? 10.sp,
                color: AppColors.midDarkGrey,
              ),
              height?.height ?? 1.5.height,
              if (buttonText != '')
                CustomButton(
                  width: 25.w,
                  height: 4.5.h,
                  hPadding: 0,
                  vPadding: 0,
                  borderColor: AppColors.transparent,
                  label: buttonText,
                  labelFontSize: 10.sp,
                  onPressed: () {},
                ),
            ],
          ),
        ),
      ],
    );
  }
}
