import 'package:get/get.dart';
import 'package:nanduba/controllers/vehicle_profile_controller.dart';
import 'package:nanduba/views/add_vehicle/enter_regNo/component/reg_number.dart';
import 'package:nanduba/views/add_vehicle/vehicle_info/component/certificate/vehicle_info_certificate_sheet.dart';
import 'package:nanduba/views/add_vehicle/vehicle_info/widget/vehicle_type_choice_container.dart';
import 'package:nanduba/widgets/core/my_text.dart';
import 'package:country_picker/country_picker.dart' as cp;

import '../../../../../export.dart';

class CertificateDetailSheet extends StatefulWidget {
  @override
  State<CertificateDetailSheet> createState() => _CertificateDetailSheetState();
}

class _CertificateDetailSheetState extends State<CertificateDetailSheet> {


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context)!.unfocus();
      },
      child: Padding(
        padding: EdgeInsets.fromLTRB(4.w, 2.h, 4.w, 2.h),
        child: Wrap(
          children: [
            2.height,
            Row(
              children: [
                Icon(Icons.check_circle_outline_rounded,color: AppColors.green3,size: 20,),
                1.width,
                MyText(text: "Your road tax is valid",fontSize: 14.sp,fontWeight: FontWeight.w600,color: AppColors.textColor,),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(
                    AppSvgs.closeCircle,
                    color: AppColors.primary,
                    height: 2.5.h,
                  ),
                ),

              ],
            ),
            1.height,
            Divider(color: AppColors.border,),
            3.height,
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    text: "Certificate No",
                    fontSize: 12.sp,
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w500,

                  ),
                  MyText(
                    text: "80/2784",
                    fontSize: 11.sp,
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w400,

                  ),
                  1.height,

                  MyText(
                    text: "Issue Date",
                    fontSize: 12.sp,
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w500,

                  ),
                  MyText(
                    text: "31 March 2024",
                    fontSize: 11.sp,
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w400,

                  ),
                  1.height,
                  MyText(
                    text: "Expiry Date",
                    fontSize: 12.sp,
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w500,

                  ),
                  MyText(
                    text: "31 March 2025",
                    fontSize: 11.sp,
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w400,

                  ),
                  1.height,
                  MyText(
                    text: "Issued By",
                    fontSize: 12.sp,
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w500,

                  ),
                  MyText(
                    text: "12TSA",
                    fontSize: 11.sp,
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w400,

                  ),
                  2.height,
                  CustomButton(
                    label: "View Certificate",
                    onPressed: () async {
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
                    backgroundColor: Colors.transparent,
                    foregroundColor: AppColors.primary,
                  ),
                  2.height,

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
