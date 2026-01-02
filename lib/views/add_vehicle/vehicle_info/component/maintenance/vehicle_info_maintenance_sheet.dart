import 'dart:math';

import 'package:get/get.dart';
import 'package:nanduba/views/add_vehicle/vehicle_info/widget/vehicle_type_choice_container.dart';
import 'package:nanduba/widgets/core/my_text.dart';

import '../../../../../controllers/vehicle_profile_controller.dart';
import '../../../../../export.dart';
import '../../widget/service_date_field_widget.dart';

class VehicleInfoMaintenanceSheet extends StatefulWidget {
  @override
  State<VehicleInfoMaintenanceSheet> createState() => _VehicleInfoMaintenanceSheetState();
}

class _VehicleInfoMaintenanceSheetState extends State<VehicleInfoMaintenanceSheet> {
  final TextEditingController typeController=TextEditingController();

  RxBool showType=false.obs;

  List<String> vehicleTypes=[
    "Car",
    "SUV",
    "Van",
  ];
  final VehicleProfileController controller=Get.find();


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(4.w, 2.h, 4.w, 2.h),
      child: Wrap(
        children: [
          2.height,
          Row(
            children: [
              MyText(text: "2020 Acura ILX",fontSize: 14.sp,fontWeight: FontWeight.w600,color: AppColors.textColor,),
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
                MyText(text: "Type",fontSize: 12.sp,fontWeight: FontWeight.w400,color: AppColors.grey,),
                1.height,
                CustomTextField(
                  style: GoogleFonts.poppins(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textColor
                  ),
                  name: 'type',
                  hintText: 'Car',
                  readOnly: true,
                  controller: typeController,
                  prefixIcon: SvgPicture.asset(
                    AppSvgs.carIcon,
                    fit: BoxFit.scaleDown,
                    color: AppColors.primary,
                  ),
                  onTap: (){
                    showType.value=!showType.value;
                  },
                  suffixIcon: Icon(Icons.keyboard_arrow_down_rounded,color: AppColors.darkGrey,),
                ),
                Obx(()=>
                showType.value==true?
                Container(
                  padding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 4.w),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.border),
                      borderRadius: BorderRadius.circular(16)
                  ),
                  child: ListView.builder(
                      itemCount: vehicleTypes.length,
                      shrinkWrap: true,
                      itemBuilder: (context,index) {
                        return GestureDetector(
                          onTap: (){
                            setState(() {
                              typeController.text=vehicleTypes[index];
                            });

                          },
                          child: ListTile(
                            minVerticalPadding: 0.0,
                            contentPadding: EdgeInsets.zero,
                            minTileHeight: 0.0,

                            title: Column(
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(AppSvgs.carIcon),
                                    2.width,
                                    MyText(text: vehicleTypes[index],fontSize: 10.sp,fontWeight: FontWeight.w400,color: AppColors.textColor,),
                                    Spacer(),
                                    Container(
                                      height: 20,
                                      width: 20,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          border: Border.all(color:typeController.text==vehicleTypes[index]? AppColors.primary:AppColors.border),
                                          shape: BoxShape.circle
                                      ),
                                      child: Container(
                                        height: 10,
                                        width: 10,
                                        decoration: BoxDecoration(
                                            color: typeController.text==vehicleTypes[index]?AppColors.primary:Colors.transparent,
                                            shape: BoxShape.circle
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                1.height,
                                if(index!=vehicleTypes.length-1)
                                  Divider(color: AppColors.border,)
                              ],
                            ),
                          ),
                        );
                      }
                  ),
                ):SizedBox.shrink()),
                MyText(
                  text:   "Service Reminder",

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
                  name: 'entername',
                  hintText: "Enter Name",
                ),
                1.height,
                Row(
                  children: [
                    MyText(text: "Examples: ",color: AppColors.primary,fontWeight:FontWeight.w400 ,fontSize:9.sp,),
                    MyText(text: "Routine Service, Brake Service, Aircon Repairs",color: AppColors.textColor,fontWeight:FontWeight.w400 ,fontSize:9.sp,),
                  ],
                ),
                2.height,
                MyText(
                  text:   "Service Date",

                  fontSize: 12.sp,
                  color: AppColors.grey,
                  fontWeight: FontWeight.w400,

                ),
                1.height,
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ServiceDateWidget(hint: "Date",maxLength: 2,),
                    3.width,
                    ServiceDateWidget(hint: "Month",maxLength:2),
                    3.width,
                    ServiceDateWidget(hint: "Year",maxLength: 4,),


                  ],
                ),

                2.height,
                MyText(
                  text:   "Mileage when service is required",

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
                  name: 'odometers',
                  hintText: "Odometers",
                ),
                2.height,
                MyText(
                  text:   "Repairs",

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
                  name: 'repairs',
                  hintText: "Loream Ipsum",
                ),
                2.height,

                3.height,

                CustomButton(
                  label: "Save",
                  onPressed: () {
                    controller.showRemindersDetails.value=!controller.showRemindersDetails.value;
                    Navigator.pop(context);

                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

