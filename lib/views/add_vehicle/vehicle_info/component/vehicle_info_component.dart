import 'package:get/get.dart';
import 'package:nanduba/views/add_vehicle/vehicle_info/component/documents/vehicle_documents_sheet.dart';
import 'package:nanduba/views/add_vehicle/vehicle_info/component/estimated_value/vehicle_estimated_value_sheet.dart';
import 'package:nanduba/views/add_vehicle/vehicle_info/component/estimated_value/vehicle_info_estimated_data.dart';
import 'package:nanduba/views/add_vehicle/vehicle_info/component/license/vehicle_info_license_data_container.dart';
import 'package:nanduba/views/add_vehicle/vehicle_info/component/maintenance/vehicle_info_maintenance_data.dart';
import 'package:nanduba/views/add_vehicle/vehicle_info/component/maintenance/vehicle_info_maintenance_sheet.dart';
import 'package:nanduba/views/add_vehicle/vehicle_info/component/insurance/vehicle_info_policy_sheet.dart';
import 'package:nanduba/views/add_vehicle/vehicle_info/component/tire_size/vehicle_info_tire_size_data.dart';
import 'package:nanduba/views/add_vehicle/vehicle_info/component/tire_size/vehicle_info_tire_size_sheet.dart';
import 'package:nanduba/views/add_vehicle/vehicle_info/component/license/vehicle_licence_info_sheet.dart';
import 'package:nanduba/views/add_vehicle/vehicle_info/widget/vehicle_other_info_noData_container.dart';

import '../../../../controllers/vehicle_profile_controller.dart';
import '../../../../export.dart';
import '../../../../widgets/core/my_text.dart';
import 'certificate/vehicle_info_certificate_sheet.dart';
import 'documents/vehicle_info_documents_data.dart';
import 'insurance/vehicle_info_insurance_data_container.dart';


class VehicleInfoComponent extends StatelessWidget {
  // const VehicleInfoComponent({super.key});
  final VehicleProfileController controller=Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(

        children: [
          //if no data of tires
            controller.showSavedTiresDetails.value==false?
            CustomContainer(
                hpadding: 4.w,
                hMargin: 4.w,
                vpadding: 1.5.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      text: "Saved tire sizes",
                      fontSize: 14.sp,
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w600,
                    ),
                    1.height,
                    MyText(
                      text: "No sizes saved yet",
                      fontSize: 12.sp,
                      color: AppColors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                    1.height,
                    Divider(
                      color: AppColors.border,
                    ),
                    1.height,
                    GestureDetector(
                      onTap: () async {
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
                              return VehicleInfoTireSizeSheet();
                            });
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.add,
                            size: 18,
                            color: AppColors.primary,
                          ),
                          MyText(
                            text: "Add Tire Size",
                            fontSize: 12.sp,
                            color: AppColors.primary,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                          ),
                        ],
                      ),
                    ),
                    1.height,
                  ],
                )):
          // tires size data
          VehicleInfoTireSizeData(),

          2.height,


          //license  certificate with no data
          controller.showCertificatesDetails.value==false?
          CustomContainer(
              hpadding: 4.w,
              hMargin: 4.w,
              vpadding: 1.5.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    text: "Certificates",
                    fontSize: 14.sp,
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w600,
                  ),
                  1.height,
                  MyText(
                    text: "No Certificate added yet",
                    fontSize: 12.sp,
                    color: AppColors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                  1.height,
                  Divider(
                    color: AppColors.border,
                  ),
                  1.height,
                  GestureDetector(
                    onTap: () async {
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
                            return VehicleInfoCertificateSheet();
                          });
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          size: 18,
                          color: AppColors.primary,
                        ),
                        MyText(
                          text: "Add Certificate",
                          fontSize: 12.sp,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ],
                    ),
                  ),
                  1.height,
                ],
              )):
          //license  certificate with data
          VehicleInfoLicenseData(),


          // // Insurance if No Data
          // VehicleOtherInfoNoDataContainer(
          //   title: "Insurance",
          //   errorText: "Add Policy",
          //   onTap: () async {
          //     await showModalBottomSheet(
          //         backgroundColor: AppColors.white,
          //         context: context,
          //         useSafeArea: true,
          //         isScrollControlled: true,
          //         shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.vertical(
          //               top: Radius.circular(20.sp)),
          //         ),
          //         builder: (BuildContext context) {
          //           return VehicleInfoPolicySheet();
          //         });
          //   },
          // ),


          //  Insurance with Data
          //  VehicleInfoInsuranceData(errorText: "Add Policy",),


          //    reminder with no data
          controller.showRemindersDetails.value==false?
          VehicleOtherInfoNodataContainer1(text: "Reminders", noDataText: "No Reminders saved yet", errorText: "Add Reminder",

            onTap: () async {
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
                    return VehicleInfoMaintenanceSheet();
                  });
            },

          ):
          //reminder with data
          VehicleInfoMaintenanceData(),

          //estimated with no data
          controller.showEstimatedDetails.value==false?
          VehicleOtherInfoNodataContainer1(
            text: "Estimated Value",
            noDataText: "No Estimate value added yet",
            errorText: "Add Value",
            // showMore: false,
            onTap: () async {
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
                    return VehicleEstimatedValueSheet();
                  });
            },
          ):
          //estimated with data
          VehicleInfoEstimatedData(),


          //documents with no data
          controller.showDocumentsDetails.value==false?
          VehicleOtherInfoNodataContainer1(
            text: "Documents",
            errorText: "No Document added yet",
            noDataText: "Add Documents",
            // showMore: false,
            onTap: () async {
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
                    return VehicleDocumentsSheet();
                  });
            },
          ):
          //documents with data
          VehicleInfoDocumentsData()
        ],
      );
    });
  }
}
