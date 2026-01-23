import 'package:get/get.dart';
import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/controllers/vehicle_profile_controller.dart';
import 'package:nanduba/views/add_vehicle/purchase_history/purchase_history.dart';
import 'package:nanduba/views/add_vehicle/vehicle_info/vehicle_info.dart';
import 'package:nanduba/views/add_vehicle/vehicle_info/widget/compliance_popup.dart';
import 'package:nanduba/views/add_vehicle/vehicle_profile/component/upload_image_container.dart';
import 'package:nanduba/views/add_vehicle/vehicle_profile/widget/get_your_corolla_details.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../export.dart';
import '../../../../widgets/core/my_text.dart';
import '../widget/vehicle_brief_detail_container.dart';
import 'filter_text_field.dart';

class VehicleDetailComponent extends StatefulWidget {
  const VehicleDetailComponent({super.key});

  @override
  State<VehicleDetailComponent> createState() => _VehicleDetailComponentState();
}

class _VehicleDetailComponentState extends State<VehicleDetailComponent> {
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VehicleProfileController>(builder: (controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // controller.image!=null?
          Container(
            width: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Background circle
                Container(
                  height: 322,
                  width: 450,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppImages.bagroundcircule),
                    ),
                  ),
                ),

                // Top image only bottom padding
                if (controller.image != null)
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 180,
                      width: 250,
                      margin: const EdgeInsets.only(bottom: 50),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: FileImage(controller.image!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                Positioned(
                    bottom: 40,
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                      ),
                      child: SvgPicture.asset(
                        AppSvgs.leftrightcircul,
                        height: 80,
                        width: 80,
                      ),
                    ))
              ],
            ),
          ),

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
                  const MyText(
                    text: "Audi Q7 2017 40\nTFSI Premium Plus",
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textColor5,
                  ),
                  1.height,
                  const Divider(
                    color: AppColors.secondaryborder2,
                  ),
                  1.height,
                  Row(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(AppSvgs.id),
                          1.width,
                          const MyText(
                            text: "Vehicle License Plate:",
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.midDarkGrey,
                          ),
                        ],
                      ),
                      Spacer(),
                      const MyText(
                        text: "ALZ6443ZM",
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textColor,
                      ),
                    ],
                  )
                ],
              )),
          2.height,

          CustomContainer(
              hpadding: 26,
              vpadding: 4,
              blurRadius: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Compliance Health",
                        style: Textfontstyle.TextStyle16w500c212121poppins
                            .copyWith(
                                color: AppColors.textColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(AppSvgs.shieldtick),
                          Text(
                            "Monitoring Active",
                            style: Textfontstyle.TextStyle16w500c212121poppins
                                .copyWith(
                                    color: AppColors.midDarkGrey,
                                    fontSize: 8.sp),
                          ),
                        ],
                      )
                    ],
                  ),
                  1.5.height,
                  Row(
                    children: [
                      Text(
                        "80/100 ",
                        style: Textfontstyle.TextStyle16w500c212121poppins
                            .copyWith(
                                color: AppColors.textColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold),
                      ),
                      2.width,
                      SvgPicture.asset(
                        AppSvgs.information2,
                        height: 16,
                        width: 16,
                      ),
                      2.width,
                      Text(
                        "Attention Required ",
                        style: Textfontstyle.TextStyle16w500c212121poppins
                            .copyWith(
                                color: AppColors.textColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  1.4.height,
                  LinearPercentIndicator(
                    width: MediaQuery.of(context).size.width - 95,
                    lineHeight: 8.0,
                    percent: 0.8,
                    backgroundColor: AppColors.secondary,
                    progressColor: AppColors.primary,
                    barRadius: const Radius.circular(8),
                  ),
                  1.4.height,
                  Row(
                    children: [
                      Image.asset(
                        AppImages.exlamatori,
                        height: 14,
                        width: 14,
                      ),
                      2.width,
                      Text(
                        "Road tax expires in 14 days ",
                        style: Textfontstyle.TextStyle16w500c212121poppins
                            .copyWith(
                                color: AppColors.midDarkGrey, fontSize: 8.sp),
                      ),
                      3.height,
                    ],
                  ),
                ],
              )),
          2.height,
          VehicleDetailsPopup(
            ontap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return const CompliancePopup();
                },
              );
            },
            message:
                "Get the most out of roadsmart by adding your vehicle ref no or vin",
            vehicleName: 'Corolla',
            isVisible: isVisible,
            onClose: () {
              setState(() {
                isVisible = false;
              });
            },
          ),
          // 2.height,
          // SingleChildScrollView(
          //   clipBehavior: Clip.none,
          //   scrollDirection: Axis.horizontal,
          //   child: Row(
          //     children: [
          //       VehicleInfoContainer(
          //         boxColor: AppColors.boxColor,
          //         name: "Insurance",
          //         date: "Expires 30 Jun24",
          //         icon: AppSvgs.shieldtick,
          //         onTap: () async {
          //           await showModalBottomSheet(
          //               backgroundColor: AppColors.white,
          //               context: context,
          //               useSafeArea: true,
          //               isScrollControlled: true,
          //               shape: RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.vertical(
          //                     top: Radius.circular(20.sp)),
          //               ),
          //               builder: (BuildContext context) {
          //                 // return VehicleLicenseInfoSheet();
          //                 return InsuranceDetailSheet();
          //               });
          //         },
          //       ),
          //       3.width,
          //       VehicleInfoContainer(
          //         boxColor: AppColors.secondary,
          //         name: "Road Tax",
          //         date: "Expires 30 Jun24",
          //         icon: AppSvgs.information,
          //         onTap: () async {
          //           await showModalBottomSheet(
          //               backgroundColor: AppColors.white,
          //               context: context,
          //               useSafeArea: true,
          //               isScrollControlled: true,
          //               shape: RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.vertical(
          //                     top: Radius.circular(20.sp)),
          //               ),
          //               builder: (BuildContext context) {
          //                 // return VehicleLicenseInfoSheet();
          //                 return CertificateDetailSheet();
          //               });
          //         },
          //       ),
          //       3.width,
          //       VehicleInfoContainer(
          //         boxColor: AppColors.boxColor,
          //         name: "Fitness",
          //         date: "Expires 30 Jun24",
          //         icon: AppSvgs.shieldtick,
          //         onTap: () async {
          //           await showModalBottomSheet(
          //               backgroundColor: AppColors.white,
          //               context: context,
          //               useSafeArea: true,
          //               isScrollControlled: true,
          //               shape: RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.vertical(
          //                     top: Radius.circular(20.sp)),
          //               ),
          //               builder: (BuildContext context) {
          //                 // return VehicleLicenseInfoSheet();
          //                 return CertificateDetailSheet();
          //               });
          //         },
          //       ),
          //     ],
          //   ),
          // ),
          2.height,
          FilterTextField(),
          2.height,
          GestureDetector(
              onTap: () {
                AppCustomNavigator.push(context, VehicleInfoDetails());
              },
              child: const VehicleBriefDetailContainer(
                  title: "Vehicle Info",
                  disc: "Details spece, features & documents")),
          GestureDetector(
            onTap: () {
              AppCustomNavigator.push(context, PurchaseHistory());
            },
            child: const VehicleBriefDetailContainer(
                title: "Purchases & Activity",
                disc: "Orders you have made for this vehicle"),
          ),
          // GestureDetector(
          //   onTap: () {
          //     AppCustomNavigator.push(context, TransferVehicle());
          //   },
          //   child: VehicleBriefDetailContainer(
          //     title: "Transfer Vehicle",
          //     disc: "Change vehicle owner",
          //   ),
          // ),
        ],
      );
    });
  }
}
