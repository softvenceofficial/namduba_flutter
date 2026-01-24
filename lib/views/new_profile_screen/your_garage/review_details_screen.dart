import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/add_vehicle/vehicle_profile/vehicle_profile.dart';
import 'package:nanduba/views/new_profile_screen/your_garage/widget/add_vehicle_details_widget.dart';

class ReviewDetailsScreen extends StatefulWidget {
  const ReviewDetailsScreen({super.key});

  @override
  State<ReviewDetailsScreen> createState() => _ReviewDetailsScreenState();
}

class _ReviewDetailsScreenState extends State<ReviewDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
                child: CustomAppbar(
                  title: AppText.reviewdetails,
                  svgIconNextToTitle: AppSvgs.closeCircle,
                  onSvgIconTap: () {
                    AppCustomNavigator.pop(context);
                  },
                ),
              ),
              2.9.height,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CustomContainer(
                  hpadding: 2.h,
                  vpadding: 2.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        AppText.nicevehicle,
                        style: Textfontstyle.TextStyle18w600c212121poppins
                            .copyWith(fontSize: 16.sp),
                      ),
                      1.height,
                      Text(
                        AppText.hareswhatwehave,
                        style: Textfontstyle.TextStyle14w400midgreyinter,
                      ),
                      2.8.height,
                      MakeItemWidget(
                        title: "Make",
                        value: "Toyota",
                        onTap: () {
                          // current account navigation
                        },
                      ),
                      3.1.height,
                      MakeItemWidget(
                        title: "Model",
                        value: "Corolla",
                        onTap: () {
                          // current account navigation
                        },
                      ),
                      1.6.height,
                      const Divider(
                        color: AppColors.cBEBEBE,
                        thickness: 1,
                      ),
                      1.6.height,
                      MakeItemWidget(
                        title: "Year",
                        value: "2016",
                        onTap: () {
                          // current account navigation
                        },
                      ),
                      1.6.height,
                      const Divider(
                        color: AppColors.cBEBEBE,
                        thickness: 1,
                      ),
                      1.6.height,
                      MakeItemWidget(
                        title: "Variant",
                        value: "Petrol Saloon ",
                        onTap: () {
                          // current account navigation
                        },
                      ),
                      1.6.height,
                      const Divider(
                        color: AppColors.cBEBEBE,
                        thickness: 1,
                      ),
                      MakeItemWidget(
                        title: "Type",
                        value: "1.5 4WD",
                        onTap: () {
                          // current account navigation
                        },
                      ),
                      3.8.height,
                      MakeItemWidget(
                        title: "Chassis",
                        value: "AWD--E16_",
                        onTap: () {
                          // current account navigation
                        },
                      ),
                      3.1.height,
                      const Divider(
                        color: AppColors.cBEBEBE,
                        thickness: 1,
                      ),
                      1.6.height,
                      MakeItemWidget(
                        title: "Engine",
                        value: "1.497cc 76KW 103HP 1NZ-FE",
                        onTap: () {
                          // current account navigation
                        },
                      ),
                      1.height,
                    ],
                  ),
                ),
              ),
              4.3.height,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: CustomButton(
                  label: AppText.confirm,
                  onPressed: () {
                    AppCustomNavigator.push(context, VehicleProfile());
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
