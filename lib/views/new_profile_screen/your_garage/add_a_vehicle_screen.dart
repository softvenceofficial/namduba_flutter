import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/Profile/User_profile/profile_screen_new/widget/about_feedback_widget.dart';
import 'package:nanduba/views/new_profile_screen/your_garage/enter_vehicle_details.dart';
import 'package:nanduba/views/new_profile_screen/your_garage/review_details_screen.dart';

class AddAVehicleScreen extends StatefulWidget {
  const AddAVehicleScreen({super.key});

  @override
  State<AddAVehicleScreen> createState() => _AddAVehicleScreenState();
}

class _AddAVehicleScreenState extends State<AddAVehicleScreen> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
          child: Column(
            children: [
              CustomAppbar(
                title: AppText.addaVehicle,
                svgIconNextToTitle: AppSvgs.closecircle,
                onSvgIconTap: () {
                  AppCustomNavigator.pop(context);
                },
              ),
              2.height,
              CustomContainer(
                hpadding: 2.h,
                vpadding: 2.w,
                child: Column(
                  children: [
                    Text(
                      AppText.enterregnum,
                      style:
                          Textfontstyle.TextStyle18w600c212121poppins.copyWith(
                              fontSize: 16.sp),
                    ),
                    1.height,
                    Text(
                      AppText.writeyourvehiclereg,
                      style: Textfontstyle.TextStyle14w400midgreyinter,
                    ),
                    1.height,
                  ],
                ),
              ),
              3.height,
              AboutFeedbackTabBar(
                aboutText: "Reg Number  ",
                feedbackText: "VIN Number",
                separatorWidth: 8.w,
                onTabChanged: (index) {
                  setState(() {
                    selectedTab = index;
                  });
                },
              ),
              2.height,
              Expanded(
                child: selectedTab == 0
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextField(
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: SvgPicture.asset(AppSvgs.passporticon),
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: SvgPicture.asset(AppSvgs.tickcircle),
                            ),
                            hintText: "AAZ4178",
                            titleText: "Reg Number",
                          )
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextField(
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: SvgPicture.asset(AppSvgs.passporticon),
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: SvgPicture.asset(AppSvgs.tickcircle),
                            ),
                            hintText: "1HGB H41JX MN10 91867",
                            titleText: "VIN Number",
                          )
                        ],
                      ),
              ),
              4.4.height,
              CustomButton(
                label: "Let's Go",
                onPressed: () {
                  AppCustomNavigator.push(context, const ReviewDetailsScreen());
                },
              ),
              4.2.height,
              Row(
                children: [
                  const Expanded(
                    child: Divider(
                      color: AppColors.cBEBEBE,
                      thickness: 1,
                    ),
                  ),
                  6.width,
                  Text(
                    "or",
                    style: Textfontstyle.TextStyle12w500c212121poppins,
                  ),
                  6.width,
                  const Expanded(
                    child: Divider(
                      color: AppColors.cBEBEBE,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              4.2.height,
              CustomButton(
                textcolor: AppColors.primary,
                backgroundColor: AppColors.white,
                foregroundColor: AppColors.white,
                borderColor: AppColors.primary,
                label: "Enter Vehicle Details",
                onPressed: () {
                  AppCustomNavigator.push(context, const EnterVehicleDetails());
                },
              ),
              20.2.height,
            ],
          ),
        ),
      ),
    );
  }
}
