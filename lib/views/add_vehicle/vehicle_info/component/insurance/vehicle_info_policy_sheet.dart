import 'dart:io';
import 'dart:math';

import 'package:get/get.dart';
import 'package:nanduba/controllers/vehicle_profile_controller.dart';
import 'package:nanduba/views/add_vehicle/vehicle_info/widget/vehicle_type_choice_container.dart';
import 'package:nanduba/widgets/core/my_text.dart';

import '../../../../../export.dart';
import '../../widget/service_date_field_widget.dart';

class VehicleInfoPolicySheet extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85.h,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(4.w, 2.h, 4.w, 2.h),
          child: Wrap(
            children: [
              2.height,
              Row(
                children: [
                  MyText(text: "2021 Toyota Corolla",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textColor,),
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
                    bottom: MediaQuery
                        .of(context)
                        .viewInsets
                        .bottom),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      text: "Policy Details",

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
                        name: 'cover type',
                        hintText: "Cover Type",
                        suffixIcon: Transform.rotate(
                            angle: -pi / 2,
                            child: Icon(
                              Icons.arrow_back_ios_new_rounded, size: 18,
                              color: AppColors.darkGrey,))
                    ),
                    1.5.height,
                    CustomTextField(
                        style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textColor,

                        ),

                        name: 'insurer',
                        hintText: "Insurer",
                        suffixIcon: Transform.rotate(
                            angle: -pi / 2,
                            child: Icon(
                              Icons.arrow_back_ios_new_rounded, size: 18,
                              color: AppColors.darkGrey,))
                    ),

                    3.height,
                    MyText(
                      text: "Start Date",

                      fontSize: 12.sp,
                      color: AppColors.grey,
                      fontWeight: FontWeight.w400,

                    ),
                    1.height,
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ServiceDateWidget(hint: "Date", maxLength: 2,),
                        3.width,
                        ServiceDateWidget(hint: "Month", maxLength: 2),
                        3.width,
                        ServiceDateWidget(hint: "Year", maxLength: 4,),


                      ],
                    ),
                    2.height,
                    MyText(
                      text: "End Date",

                      fontSize: 12.sp,
                      color: AppColors.grey,
                      fontWeight: FontWeight.w400,

                    ),
                    1.height,
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ServiceDateWidget(hint: "Date", maxLength: 2,),
                        3.width,
                        ServiceDateWidget(hint: "Month", maxLength: 2),
                        3.width,
                        ServiceDateWidget(hint: "Year", maxLength: 4,),


                      ],
                    ),

                    2.height,
                    MyText(
                      text: "Policy Number",

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
                      name: 'policynumber',
                      hintText: "5908905095",
                    ),
                    2.height,
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
                    2.height,

                    CustomButton(
                      label: "Save",
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

