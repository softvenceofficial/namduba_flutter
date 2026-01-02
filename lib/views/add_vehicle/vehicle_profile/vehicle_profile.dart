import 'package:get/get.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:nanduba/controllers/vehicle_profile_controller.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/add_vehicle/vehicle_profile/component/filter_text_field.dart';
import 'package:nanduba/views/add_vehicle/vehicle_profile/component/vehicle_detail_component.dart';
import 'package:nanduba/views/add_vehicle/vehicle_profile/component/vehicle_profile_pop_up_menu.dart';
import 'package:nanduba/views/add_vehicle/vehicle_profile/component/vehicle_shop_for_ride_component.dart';
import 'package:nanduba/views/add_vehicle/vehicle_profile/widget/vehicle_brief_detail_container.dart';
import 'package:nanduba/views/add_vehicle/vehicle_profile/widget/vehicle_info_container.dart';
import 'package:nanduba/widgets/core/my_text.dart';

import '../purchase_history/purchase_history.dart';
import 'component/upload_image_container.dart';

class VehicleProfile extends StatelessWidget {
  final VehicleProfileController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          controller.isOpen.value = false;
        },
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              2.height,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          height: 5.5.h,
                          width: 5.5.h,
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColors.lightGrey),
                              shape: BoxShape.circle),
                          child: const Center(
                            child: Icon(Icons.arrow_back_ios_new_rounded),
                          ),
                        ),
                      ),
                      3.width,
                      Expanded(
                        child: MyText(
                          text: "Eleanor’s Car",
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textColor5,
                        ),
                      ),
                      // GestureDetector(
                      //   onTap: () {
                      //     AppCustomNavigator.push(context, PurchaseHistory());
                      //   },
                      //   child: Badge(
                      //     position: BadgePosition.topEnd(top: 0.h, end: 0.h),
                      //     showBadge: true,
                      //     badgeStyle: const BadgeStyle(
                      //         borderSide: BorderSide(color: AppColors.white)),
                      //     child: SvgPicture.asset(
                      //       AppSvgs.cart,
                      //       // height: 3.5.h,
                      //       height: 25, width: 25,
                      //     ),
                      //   ),
                      // ),
                      2.width,
                      GestureDetector(
                        onTap: () {
                          controller.showPopUp();
                        },
                        child: Obx(() {
                          return Container(
                              height: 5.5.h,
                              width: 5.5.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColors.lightGrey),
                                  shape: BoxShape.circle),
                              child: controller.isOpen.value == false
                                  ? SvgPicture.asset(AppSvgs.mores)
                                  : Icon(
                                      Icons.close,
                                      color: AppColors.primary,
                                    ));
                        }),
                      ),
                    ]),
              ),
              2.height,
              Expanded(
                  child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Column(
                        children: [
                          VehicleDetailComponent(),
                          1.5.height,
                          VehicleShopForRideComponent(),
                        ],
                      ),
                    ),
                  ),
                  Obx(
                    () => controller.isOpen.value == true
                        ? VehicleProfilePopUpMenu(
                            listingIndex: controller.listingIndex.value,
                          )
                        : SizedBox.shrink(),
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
