import '../../../../export.dart';
import '../../../../widgets/core/my_text.dart';

class VehicleInfoContainer extends StatelessWidget {
  final Color boxColor;
  final String icon;
  final String name;
  final String date;
  final void Function()? onTap;
  const VehicleInfoContainer({super.key, required this.boxColor, required this.name, required this.date, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomContainer(

          vpadding: 1.h,
          hpadding: 3.w,
          child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 40,
                width: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color:boxColor,
                ),
                child: SvgPicture.asset(icon),
              ),
              1.height,
              MyText(text: name,fontWeight: FontWeight.w500,fontSize: 16,color: AppColors.textColor,),
              MyText(text: date,fontWeight: FontWeight.w400,fontSize: 12,color: AppColors.midDarkGrey,),

            ],
          )),
    );
  }
}
