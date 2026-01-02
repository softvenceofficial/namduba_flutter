import '../../../../../export.dart';
import '../../../../../widgets/core/my_text.dart';

class CoverageTitleRow extends StatelessWidget {
  final String icon;
  final String title;
  final void Function(bool)? onChanged;
  final bool switchValue;
  final bool showSwitch;
  const CoverageTitleRow({super.key, required this.icon, required this.title, this.onChanged, required this.switchValue,  this.showSwitch=true});

  @override
  Widget build(BuildContext context) {
    return   Row(
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        Container(
          margin: EdgeInsets.only(right: 15),
          padding: EdgeInsets.all(13),
          decoration: BoxDecoration(
            color: AppColors.secondary,
            borderRadius: BorderRadius.circular(16),
          ),
          child: SvgPicture.asset(
          icon,
            color: AppColors.primary,
            height: 3.7.h,
          ),
        ),
       Expanded(
         child: Row(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             MyText(
               text: title.toString(),
               fontWeight: FontWeight.w600,
               fontSize: 12.sp,
             ),
             Spacer(),
             if(showSwitch==true)
               Transform.scale(
                 scale: 0.9,
                 child: Switch(
                   value:switchValue,
                   onChanged: onChanged,
                   activeTrackColor: AppColors.primary,
                 ),
               ),
             if(showSwitch==false)
               SvgPicture.asset(AppSvgs.arrow_circle_up,color: AppColors.arrowGrey,),
           ],
         ),
       )
      ],
    );
  }
}
