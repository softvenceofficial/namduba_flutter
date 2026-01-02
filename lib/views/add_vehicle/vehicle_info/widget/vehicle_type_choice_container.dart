import '../../../../export.dart';
import '../../../../widgets/core/my_text.dart';

class VehicleTypeChoiceContainer extends StatelessWidget {
  final String choice;
  final int selection;
  final int selectedChoice;
  final void Function()? onTap;
  const VehicleTypeChoiceContainer({super.key, required this.choice, required this.selection, required this.selectedChoice, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            height: 24,
              width: 24,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(color: selectedChoice==selection?AppColors.primary:AppColors.border),
                  borderRadius: BorderRadius.circular(8)
              ),
            child: selectedChoice==selection?Icon(Icons.done,color: AppColors.primary,size: 18,):SizedBox.shrink(),
          ),
          3.width,
          MyText(text: choice,color: AppColors.grey,fontWeight: FontWeight.w400,fontSize: 12.sp,)
        ],
      ),
    );
  }
}
