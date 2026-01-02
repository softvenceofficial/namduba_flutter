import 'package:get/get.dart';
import 'package:nanduba/controllers/vehicle_profile_controller.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/add_vehicle/enter_regNo/add_vehicle.dart';
import 'package:nanduba/views/add_vehicle/vehicle_profile/vehicle_profile.dart';
import 'package:nanduba/views/inbox/chat_list/component/no_message_box.dart';
import 'package:nanduba/views/inbox/chat_screen/chat_screen.dart';
import 'package:nanduba/widgets/core/my_text.dart';


class VehicleListings extends StatelessWidget {
  // const VehicleListings({super.key});
  final VehicleProfileController vehicleProfileController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              2.height,
              CustomAppbar(title: "Vehicles", showCart: true,),
              2.height,
              CustomTextField(
                name: 'searchvehcile',
                enableBorder: AppColors.kEnableBorderGrey,
                prefixIcon: SvgPicture.asset(
                  AppSvgs.searchIcon,
                  fit: BoxFit.scaleDown,
                ),
                hintText: "Search for vehicle",
                showShadow: true,
                onEditComplete: () {},

              ),
              2.height,
              Obx(() {
                return Expanded(
                  child: ListView.builder(
                      itemCount: vehicleProfileController.listings.length,
                      clipBehavior: Clip.none,
                      itemBuilder: (context, index) {
                        final data = vehicleProfileController.listings[index];
                        return GestureDetector(
                          onTap: () {
                            vehicleProfileController.listingIndex.value=index;
                            AppCustomNavigator.push(context, VehicleProfile());
                          },
                          child: CustomContainer(
                            borderRadius: 5.w,
                            vMargin: 1.h,
                            // hMargin: 5.w,
                            hpadding: 3.w,
                            vpadding: 1.1.h,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  // height: 7.5.h,
                                  // width: 15.w,
                                  height: 64,
                                  width: 64,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: AppColors.midLightGrey,
                                      borderRadius: BorderRadius.circular(16)
                                  ),
                                  child: Image.asset(AppImages.bmw,),),
                                2.width,
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      1.height,
                                      Row(
                                        children: [
                                          SizedBox(
                                              width: 50.w,
                                              child: MyText(
                                                text: data['name'],
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.textColor,)
                                          ),
                                          Spacer(),
                                          SvgPicture.asset(
                                              AppSvgs.arrowCircleRight)

                                        ],
                                      ),
                                      1.height,
                                      Row(
                                        children: [
                                          Container(
                                            height: 6,
                                            width: 6,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColors.primary,
                                            ),
                                          ),
                                          1.width,

                                          MyText(text: data['year'].toString(),
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.midDarkGrey,),
                                          3.width,

                                          Container(
                                            height: 6,
                                            width: 6,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColors.primary,
                                            ),
                                          ),
                                          1.width,

                                          MyText(
                                            text: data['model'],
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.midDarkGrey,),

                                        ],
                                      ),

                                    ],
                                  ),
                                ),
                              ],
                            ),),
                        );
                      }
                  ),
                );
              }),
              CustomButton(
                label: "Add Vehicle",
                onPressed: () {
                  AppCustomNavigator.push(context, AddVehicle());
                  // AppCustomNavigator.push(context,VehicleListings());
                },
              ),
              3.height,

            ],
          ),
        ),
      ),
    );
  }
}








