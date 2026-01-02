import 'package:get/get.dart';
import 'package:nanduba/controllers/vehicle_profile_controller.dart';
import 'package:nanduba/views/add_vehicle/vehicle_info/component/license/vehicle_licence_info_sheet.dart';
import 'package:nanduba/widgets/core/my_text.dart';

import '../../../../../export.dart';
import '../certificate/vehicle_info_certificate_sheet.dart';

class VehicleInfoLicenseData extends StatelessWidget {
List<dynamic> licences=[
  {
    "name":"Road Tax",
    "expiryDate":"24 Dec 2024",
    "isExpired":false,
  },
  {
    "name":"Fitness",
    "expiryDate":"18 Feb 2024",
    "isExpired":true,
  },
];
final VehicleProfileController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
        hpadding: 4.w,
        hMargin: 4.w,
        vpadding: 1.h,
        vMargin: 1.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                MyText(
                  text:"Certificates",
                  fontSize: 13.sp,
                  color: AppColors.textColor5,
                  fontWeight: FontWeight.w600,
                ),
                Spacer(),
                GestureDetector(
                  onTap: () async {
                    print("tappped");
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

                  child: Container(
                    height: 5.h,
                    width: 10.5.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.circular(10)),
                    child: SvgPicture.asset(AppSvgs.edit),
                  ),
                ),
              ],
            ),
            1.height,
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: licences.length,
                itemBuilder: (context,index) {
                  return GestureDetector(
                    onTap: () async {
                      print("tappped");
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
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Divider(color: AppColors.border,),
                          1.height,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              MyText(text: licences[index]['name'],fontSize: 11.sp,color: AppColors.textColor,fontWeight: FontWeight.w500,),
                              Spacer(),
                              CircleAvatar(
                                radius: 0.5.h,
                                backgroundColor: licences[index]['isExpired']==false? AppColors.green2:AppColors.primary,
                              ),
                              1.width,
                              MyText(text: licences[index]['isExpired']==false ? "Active" :"Expired",fontSize: 10.sp,color: AppColors.textColor,fontWeight: FontWeight.w500,),

                            ],
                          ),
                          1.height,
                          Obx(()=>controller.addExpiryDate.value==true?
                          Row(
                            children: [
                              MyText(text: "Expires: ",fontSize: 10.sp,color: AppColors.grey,fontWeight: FontWeight.w500,),
                              MyText(text:licences[index]['expiryDate'],fontSize: 10.sp,color: AppColors.textColor,fontWeight: FontWeight.w500,),
                              Spacer(),
                              SvgPicture.asset(AppSvgs.arrowCircleRight)
                            ],
                          ):SizedBox.shrink(),),
                          1.height,



                        ],
                      ),
                    ),
                  );
                }
            ),
            1.height,
            GestureDetector(
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
                    fontSize: 11.sp,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}



