import '../../export.dart';

class CustomReportContanier extends StatelessWidget {
  final String text;
  const CustomReportContanier({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return                       CustomContainer(
      hpadding: 3.w,
      vpadding: 0.1.h,
      borderRadius: 14.sp,
      child: Row(
        children: [
          Container(
            // height: 5.5.h,
            // width: 10.5.w,
            height: 40,
            width: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.circular(12)
            ),
            child: SvgPicture.asset(AppSvgs.addNotes),

          ),
          2.width,
          Text(text,style: Theme.of(context)!.textTheme.bodyLarge!.copyWith(
              fontSize: 11.sp,
              color: AppColors.textColor,
              fontWeight: FontWeight.w500
          ),),
          Spacer(),
          Container(
            height: 7.h,
            width: 7.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle
            ),
            child: Icon(Icons.keyboard_arrow_right_rounded,color: Colors.white,),
          )


        ],
      ),

    );

  }
}
