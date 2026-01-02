import 'dart:math';

import 'package:get/get.dart';
import 'package:nanduba/controllers/vehicle_profile_controller.dart';
import 'package:nanduba/views/add_vehicle/enter_regNo/component/reg_number.dart';
import 'package:nanduba/views/add_vehicle/vehicle_info/widget/vehicle_type_choice_container.dart';
import 'package:nanduba/widgets/core/my_text.dart';
import 'package:country_picker/country_picker.dart' as cp;

import '../../../../../export.dart';

class VehicleEstimatedValueSheet extends StatelessWidget {
  final VehicleProfileController controller=Get.find();

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
                MyText(text: "Estimated value for your corolla",fontSize: 14.sp,fontWeight: FontWeight.w600,color: AppColors.textColor,),
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
            4.height,
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  MyText(
                    text:   "Estimated value",
                    fontSize: 12.sp,
                    color: AppColors.grey,
                    fontWeight: FontWeight.w400,

                  ),
                  1.height,
                  CustomTextField(
                    style: GoogleFonts.poppins(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textColor
                    ),
                    name: 'estimatevalue',
                    hintText: "5000",
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            color: AppColors.border,
                            height: 34,
                            width: 1,
                          ),
                          2.width,
                          SvgPicture.asset(AppSvgs.dollar),
                          2.width,

                          Transform.rotate(
                              angle: -pi/2,
                              child: Icon(Icons.arrow_back_ios_new_rounded,size: 18,color: AppColors.darkGrey,)),
                          3.width,

                        ],
                      )
                  ),


                  3.height,
                  CustomButton(
                    label: "Save",
                    onPressed: () {
                      controller.showEstimatedDetails.value=!controller.showEstimatedDetails.value;
                      Navigator.pop(context);

                    },
                  ),
                  1.height,


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
