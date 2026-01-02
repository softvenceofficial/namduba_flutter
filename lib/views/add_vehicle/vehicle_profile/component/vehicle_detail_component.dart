import 'package:get/get.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:nanduba/controllers/vehicle_profile_controller.dart';
import 'package:nanduba/views/add_vehicle/policy_information/policy_information.dart';
import 'package:nanduba/views/add_vehicle/purchase_history/purchase_history.dart';
import 'package:nanduba/views/add_vehicle/purchase_history/transfer_vehicle.dart';
import 'package:nanduba/views/add_vehicle/vehicle_info/component/certificate/certificate_detail_sheet.dart';
import 'package:nanduba/views/add_vehicle/vehicle_info/component/certificate/insurance_details_sheet.dart';
import 'package:nanduba/views/add_vehicle/vehicle_info/vehicle_info.dart';
import 'package:nanduba/views/add_vehicle/vehicle_profile/component/upload_image_container.dart';

import '../../../../export.dart';
import '../../../../widgets/core/my_text.dart';
import '../widget/vehicle_brief_detail_container.dart';
import '../widget/vehicle_info_container.dart';
import 'filter_text_field.dart';

class VehicleDetailComponent extends StatelessWidget {
  const VehicleDetailComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VehicleProfileController>(builder: (controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // controller.image!=null?
          Container(
            height: 25.h,
            decoration: BoxDecoration(
                color: AppColors.midLightGrey,
                borderRadius: BorderRadius.circular(20),
                // image: DecorationImage(image: FileImage(controller.image!),fit: BoxFit.cover),
                image: DecorationImage(image: controller.image==null? AssetImage(AppImages.vehicle) as ImageProvider: FileImage(controller.image!) as ImageProvider,fit: BoxFit.cover),
                boxShadow: [
                  BoxShadow(
                      color: AppColors.shadow.withOpacity(0.1),
                      blurRadius: 20,
                      offset: Offset(0,2)
                  )
                ]
            ),
          ),
          // Container(
          //   height: 28.h,
          //   child: Stack(
          //     alignment: Alignment.center,
          //     children: [
          //       Image.asset(AppImages.platform,),
          //       ModelViewer(
          //         src: 'assets/3dCar.glb',
          //         ar: false,
          //         cameraControls: true,
          //
          //         cameraTarget: "0m 0.1m 0m",
          //         // Move the model up on the Y-axis
          //         disableZoom: true,
          //         disablePan: true,
          //         fieldOfView: "45deg",
          //         autoRotate: false,
          //         autoPlay: false,
          //         cameraOrbit: "40deg 75deg 0",
          //         minCameraOrbit: "auto 75deg 0",
          //         maxCameraOrbit: "40deg 75deg 0", // Fix Y-axis rotation
          //         backgroundColor: Colors.transparent,
          //
          //       ),
          //
          //     ],
          //   ),
          // ),


          2.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              UploadImageContainer(),
              UploadImageContainer(),
              UploadImageContainer(),
              UploadImageContainer(),
            ],
          ),
          2.height,
          CustomContainer(
              vpadding: 2.h,
              hpadding: 3.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(text: "Audi Q7 2017 40\nTFSI Premium Plus",
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textColor5,),
                  1.height,
                  Divider(color: AppColors.secondaryborder2,),
                  1.height,
                  Row(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(AppSvgs.id),
                          1.width,
                          MyText(text: "Vehicle License Plate:",
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.midDarkGrey,),
                        ],
                      ),
                      Spacer(),
                      MyText(text: "ALZ6443ZM",
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textColor,),

                    ],
                  )
                ],
              )),
          2.height,
          SingleChildScrollView(
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                VehicleInfoContainer(boxColor: AppColors.boxColor,
                  name: "Insurance",
                  date: "Expires 30 Jun24",
                  icon: AppSvgs.shieldtick,onTap: ()async{
                    await showModalBottomSheet(
                    backgroundColor: AppColors.white,
                    context: context,
                    useSafeArea: true,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20.sp)),
                    ),
                    builder: (BuildContext context) {
                      // return VehicleLicenseInfoSheet();
                      return InsuranceDetailSheet();
                    });
                  },),
                3.width,
                VehicleInfoContainer(boxColor: AppColors.secondary,
                    name: "Road Tax",
                    date: "Expires 30 Jun24",
                    icon: AppSvgs.information,
                  onTap: ()async{
                    await showModalBottomSheet(
                        backgroundColor: AppColors.white,
                        context: context,
                        useSafeArea: true,
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20.sp)),
                        ),
                        builder: (BuildContext context) {
                          // return VehicleLicenseInfoSheet();
                          return CertificateDetailSheet();
                        });
                  },),
                3.width,
                VehicleInfoContainer(boxColor: AppColors.boxColor,
                    name: "Fitness",
                    date: "Expires 30 Jun24",
                    icon: AppSvgs.shieldtick,
                  onTap: ()async{
                    await showModalBottomSheet(
                        backgroundColor: AppColors.white,
                        context: context,
                        useSafeArea: true,
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20.sp)),
                        ),
                        builder: (BuildContext context) {
                          // return VehicleLicenseInfoSheet();
                          return CertificateDetailSheet();
                        });
                  },),
              ],
            ),
          ),
          2.height,
          FilterTextField(),
          2.height,
          GestureDetector(
              onTap: () {
                AppCustomNavigator.push(context, VehicleInfoDetails());
              },
              child: VehicleBriefDetailContainer(title: "Vehicle Info",
                  disc: "Details spece, features & documents")),
          GestureDetector(
            onTap: () {
              AppCustomNavigator.push(context, PurchaseHistory());
            },
            child: VehicleBriefDetailContainer(title: "Purchases & Reports",
                disc: "Orders you have made for this vehicle"),
          ),
          GestureDetector(
            onTap: (){
              AppCustomNavigator.push(context, TransferVehicle());
            },
            child: VehicleBriefDetailContainer(
                title: "Transfer Vehicle", disc: "Change vehicle owner",),
          ),


        ],
      );
    });
  }
}
