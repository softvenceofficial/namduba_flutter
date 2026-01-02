import 'dart:io';
import 'dart:math';

import 'package:get/get.dart';
import 'package:nanduba/controllers/vehicle_profile_controller.dart';
import 'package:nanduba/views/add_vehicle/vehicle_info/widget/vehicle_type_choice_container.dart';
import 'package:nanduba/widgets/core/my_text.dart';

import '../../../../../export.dart';
import '../../../enter_vehicle_details/enter_vehicle_details.dart';
import '../../widget/service_date_field_widget.dart';

class VehicleInfoCertificateSheet extends StatelessWidget {
  RxInt selectedStartChoice = (-1).obs;
  RxInt selectedExpiryChoice = (-1).obs;
  RxBool showType = false.obs;
  RxString selectedType ='Road Tax'.obs;

  final VehicleProfileController controller=Get.find();
  final TextEditingController typeController =TextEditingController();
  List<String> types = [
    "Insurance",
    "Road Tax",
    "Fitness"
  ];

  @override
  Widget build(BuildContext context) {
    print("widget ubilding");
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
                      text: "Certificate Details",

                      fontSize: 12.sp,
                      color: AppColors.grey,
                      fontWeight: FontWeight.w400,

                    ),
                    1.height,
                    CustomTextField(
                      readOnly: true,
                      controller: typeController,
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textColor
                        ),
                        name: 'type',
                        hintText: "Ex: Road Tax",
                        suffixIcon: Transform.rotate(
                            angle: -pi / 2,
                            child: Icon(
                              Icons.arrow_back_ios_new_rounded, size: 18,
                              color: AppColors.darkGrey,)),
                      onTap: (){
                        showType.value = !showType.value;
                      },
                      onChanged: (val){
                        selectedType.value = val!;

                      },
                    ),
                    ReuseDropDownContainerList(boolvalue: showType, items: types, textController: typeController),

                    1.5.height,
                      Obx(()=>selectedType.value=='Insurance'?
                      Column(
                        children: [
                          CustomTextField(
                              style: GoogleFonts.poppins(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.textColor
                              ),
                              name: 'cover',
                              hintText: "Cover Type",
                              suffixIcon: Transform.rotate(
                                  angle: -pi / 2,
                                  child: Icon(
                                    Icons.arrow_back_ios_new_rounded, size: 18,
                                    color: AppColors.darkGrey,))
                          ),
                          1.5.height,
                          
                        ],
                      ):SizedBox.shrink(),),
                    CustomTextField(
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textColor
                        ),
                        name: 'name',
                        hintText: "Name",
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

                        name: 'issuer',
                        hintText: "Issuer",
                        suffixIcon: Transform.rotate(
                            angle: -pi / 2,
                            child: Icon(
                              Icons.arrow_back_ios_new_rounded, size: 18,
                              color: AppColors.darkGrey,))
                    ),
                    2.height,
                    Obx(() {
                      return GestureDetector(
                        onTap: () {
                          // if(controller.addExpiryDate.value==false){
                          // addExpiryDate.value = true;
                          // }else{
                          //   addExpiryDate.value=false;
                          // }
                          controller.addExpiryDate.value = !controller.addExpiryDate.value;
                        },
                        child: Row(
                          children: [
                            Container(
                              height: 24,
                              width: 24,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: controller.addExpiryDate.value == true
                                          ? AppColors.primary
                                          : AppColors.border),
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              child: controller.addExpiryDate.value == true? Icon(
                                Icons.done, color: AppColors.primary,
                                size: 18,) : SizedBox.shrink(),
                            ),
                            3.width,
                            MyText(text: "Add expiry date",
                              color: AppColors.grey,
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,)
                          ],
                        ),
                      );
                    }),
                    1.5.height,
                    MyText(
                      text: "Issue Date",

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
                  Obx(()=> controller.addExpiryDate.value==true?
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        text: "Expiry Date",

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

                    ],
                  ):
                  SizedBox.shrink(),),
                    MyText(
                      text: "Certificate No",

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
                      name: 'certificateno',
                      hintText: "",
                    ),
                    2.height,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: "Suggested",

                          fontSize: 12.sp,
                          color: AppColors.grey,
                          fontWeight: FontWeight.w400,

                        ),
                        1.height,
                        MyText(
                          text: "Issue Date",

                          fontSize: 12.sp,
                          color: AppColors.grey,
                          fontWeight: FontWeight.w400,

                        ),
                        0.5.height,
                        Obx(() {
                          return GestureDetector(
                            onTap: () {
                              if(selectedStartChoice.value==-1){
                              selectedStartChoice.value = 1;
                              }else{
                                selectedStartChoice.value= -1;
                              }
                            },
                            child: Row(
                              children: [
                                Container(
                                  height: 24,
                                  width: 24,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: selectedStartChoice.value == 1
                                              ? AppColors.primary
                                              : AppColors.border),
                                      borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: selectedStartChoice.value == 1 ? Icon(
                                    Icons.done, color: AppColors.primary,
                                    size: 18,) : SizedBox.shrink(),
                                ),
                                3.width,
                                MyText(text: "01 Mar 2024",
                                  color: AppColors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,)
                              ],
                            ),
                          );
                        }),
                        1.3.height,
                        MyText(
                          text: "Expiry Date",

                          fontSize: 12.sp,
                          color: AppColors.grey,
                          fontWeight: FontWeight.w400,

                        ),
                        0.5.height,
                        Obx(() {
                          return GestureDetector(
                            onTap: () {
                              if(selectedExpiryChoice.value==-1){
                                selectedExpiryChoice.value = 1;
                              }else{
                                selectedExpiryChoice.value= -1;
                              }
                            },
                            child: Row(
                              children: [
                                Container(
                                  height: 24,
                                  width: 24,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: selectedExpiryChoice.value == 1
                                              ? AppColors.primary
                                              : AppColors.border),
                                      borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: selectedExpiryChoice.value == 1 ? Icon(
                                    Icons.done, color: AppColors.primary,
                                    size: 18,) : SizedBox.shrink(),
                                ),
                                3.width,
                                MyText(text: "30 Sep 2025",
                                  color: AppColors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,)
                              ],
                            ),
                          );
                        }),

                      ],
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

                                    image: controller.image == null
                                        ? null
                                        : DecorationImage(
                                        image: FileImage(controller.image!),
                                        fit: BoxFit.cover)
                                ),
                                child: controller.image == null ? Column(
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
                                ) : SizedBox.shrink(),
                              )

                          ),
                        ),
                      );
                    }),
                    2.height,

                    CustomButton(
                      label: "Save",
                      onPressed: () {
                        controller.showCertificatesDetails.value=!controller.showCertificatesDetails.value;
                        Navigator.pop(context);
                      },
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

