import '../../../../export.dart';
import '../../../../widgets/core/my_text.dart';

class DetailInfoRow extends StatelessWidget {
  final String title;
  final String info;
  final String errorText;
  final double? width;
  final void Function()? onTap;
  const DetailInfoRow({super.key, required this.title, required this.info, required this.errorText,  this.width, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 1.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(text: title,fontSize: 12.sp,color: AppColors.grey,fontWeight: FontWeight.w400,),
          Spacer(),
          info!=''?
          SizedBox(
              width: width??50.w,
              child: MyText(text: info,fontSize: 11.sp,color: AppColors.textColor,fontWeight: FontWeight.w500,textAlign: TextAlign.end,)):
          GestureDetector(
              onTap: onTap,
              child: MyText(text: errorText,fontSize: 11.sp,color: AppColors.primary,fontWeight: FontWeight.w500,decoration: TextDecoration.underline,))

        ],
      ),
    );
  }
}

