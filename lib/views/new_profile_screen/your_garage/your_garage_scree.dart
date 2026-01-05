import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/new_profile_screen/your_garage/add_vehicle_popup_screen.dart';

class YourGarageScree extends StatefulWidget {
  const YourGarageScree({super.key});

  @override
  State<YourGarageScree> createState() => _YourGarageScreeState();
}

class _YourGarageScreeState extends State<YourGarageScree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppbar(
                svgIconColor: AppColors.border3,
                title: AppText.myGarage,
                svgIconNextToTitle: AppSvgs.odercard,
                badgeNumber: 2 ,
              ),
              2.1.height,
              Text(
                AppText.whatdoyoudrive,
                style: Textfontstyle.TextStyle18w600c212121poppins.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 14.sp,
                ),
              ),
              1.4.height,
              Text(AppText.telluswhatyourvehicle,
                  style: Textfontstyle.TextStyle14w400midgreyinter),
              4.5.height,
              CustomButton(
                label: AppText.addVehicle,
                onPressed: () {
                  showModalBottomSheet(
                      backgroundColor: AppColors.white,
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return const FractionallySizedBox(
                            heightFactor: 0.95, child: AddVehicleScreen());
                      });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
