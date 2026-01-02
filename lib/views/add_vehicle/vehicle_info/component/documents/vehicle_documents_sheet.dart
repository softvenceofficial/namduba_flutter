import 'package:get/get.dart';
import 'package:nanduba/controllers/vehicle_profile_controller.dart';
import 'package:nanduba/views/add_vehicle/enter_regNo/component/reg_number.dart';
import 'package:nanduba/views/add_vehicle/vehicle_info/widget/vehicle_type_choice_container.dart';
import 'package:nanduba/widgets/core/my_text.dart';
import 'package:country_picker/country_picker.dart' as cp;

import '../../../../../export.dart';

class VehicleDocumentsSheet extends StatelessWidget {
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
                MyText(text: "Documents",fontSize: 14.sp,fontWeight: FontWeight.w600,color: AppColors.textColor,),
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
                    text:   "Name",
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
                    name: 'registration',
                    hintText: "Registration Certificate",
                    prefixIcon: SvgPicture.asset(
                      AppSvgs.addNotes,
                      fit: BoxFit.scaleDown,
                      color: AppColors.primary,
                    ),

                  ),
                  3.height,
                  GetBuilder<VehicleProfileController>(builder: (controller) {
                    return GestureDetector(
                      onTap: () async {
                        controller.pickImage();
                      },
                      child: DottedBorder(
                        borderType: BorderType.RRect,
                        color: AppColors.primary,
                        radius: Radius.circular(15.sp),

                        child: ClipRRect(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12.sp),
                            ),
                            child: Container(
                              width: 100.w,
                              height: 15.h,
                              decoration: BoxDecoration(
                                  color: AppColors.secondary,

                                  image: controller.image==null?null:DecorationImage(image: FileImage(controller.image!),fit: BoxFit.cover)
                              ),
                              child:controller.image==null? Column(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  Container(
                                      height: 32,
                                      width: 38,
                                      decoration: BoxDecoration(
                                      ),
                                      child: SvgPicture.asset(
                                          AppSvgs.uploadFiles)),
                                  2.height,

                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      text: 'Drag and drop or',
                                      style: GoogleFonts.poppins(
                                          color: AppColors.grey,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 9.sp
                                      ),

                                      children: <TextSpan>[
                                        TextSpan(
                                            text: ' browse ',
                                            style: GoogleFonts.poppins(
                                                color: AppColors.primary,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 9.sp
                                            )
                                        ),
                                        TextSpan(
                                            text: 'to choose file',
                                            style: GoogleFonts.poppins(
                                                color: AppColors.grey,
                                                fontWeight: FontWeight.w300,
                                                fontSize: 9.sp
                                            )
                                        ),
                                      ],
                                    ),
                                  ),

                                ],
                              ):SizedBox.shrink(),
                            )

                        ),
                      ),
                    );
                  }),


                  3.height,
                  CustomButton(
                    label: "Save",
                    onPressed: () {
                      controller.showDocumentsDetails.value=!controller.showDocumentsDetails.value;
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
