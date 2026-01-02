import '../../../../export.dart';
import '../../../../widgets/core/my_text.dart';

class VehicleBriefDetailContainer extends StatelessWidget {
  final String title;
  final String disc;
  const VehicleBriefDetailContainer({super.key, required this.title, required this.disc});

  @override
  Widget build(BuildContext context) {
    return  CustomContainer(
      borderRadius: 5.w,
      vMargin: 0.8.h,
      // hMargin: 5.w,
      hpadding: 4.w,
      vpadding: 1.1.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(text: title,fontSize: 12.sp,fontWeight: FontWeight.w500,color: AppColors.textColor,),
              0.5.height,
              MyText(text: disc,fontSize: 10.sp,fontWeight: FontWeight.w400,color: AppColors.midDarkGrey,),

            ],
          ),
          Spacer(),
          SvgPicture.asset(AppSvgs.arrowCircleRight)

        ],
      ),);
  }
}
