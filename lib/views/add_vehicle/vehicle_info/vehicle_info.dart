import 'package:get/get.dart';
import 'package:nanduba/controllers/vehicle_profile_controller.dart';
import 'package:nanduba/views/add_vehicle/vehicle_info/component/specs/get_my_specs_sheet.dart';
import 'package:nanduba/views/add_vehicle/vehicle_info/component/name_your_vehicle_sheet.dart';
import 'package:nanduba/views/add_vehicle/vehicle_info/component/odometer_reading_sheet.dart';
import 'package:nanduba/views/add_vehicle/vehicle_info/component/documents/vehicle_documents_sheet.dart';
import 'package:nanduba/views/add_vehicle/vehicle_info/component/estimated_value/vehicle_estimated_value_sheet.dart';
import 'package:nanduba/views/add_vehicle/vehicle_info/component/vehicle_info_component.dart';
import 'package:nanduba/views/add_vehicle/vehicle_info/component/maintenance/vehicle_info_maintenance_sheet.dart';
import 'package:nanduba/views/add_vehicle/vehicle_info/component/specs/vehicle_info_specs_component.dart';
import 'package:nanduba/views/add_vehicle/vehicle_info/component/tire_size/vehicle_info_tire_size_sheet.dart';
import 'package:nanduba/views/add_vehicle/vehicle_info/component/license/vehicle_licence_info_sheet.dart';
import 'package:nanduba/views/add_vehicle/vehicle_info/widget/detail_info_row_widget.dart';
import 'package:nanduba/views/add_vehicle/vehicle_info/widget/vehicle_other_info_noData_container.dart';

import '../../../export.dart';
import '../../../widgets/core/my_text.dart';
import 'component/insurance/vehicle_info_policy_sheet.dart';
import 'package:pin_code_fields/pin_code_fields.dart' as pininput;
import 'package:pin_code_fields/pin_code_fields.dart';

class VehicleInfoDetails extends StatelessWidget {
  // const VehicleInfoDetails({super.key});
  final VehicleProfileController controller = Get.find();
  final TextEditingController odometer = TextEditingController(text: '000000');
  RxString carNickname = "Eleanor's Car".obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: 5.5.h,
                        width: 5.5.h,
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.lightGrey),
                            shape: BoxShape.circle),
                        child: const Center(
                          child: Icon(Icons.arrow_back_ios_new_rounded),
                        ),
                      ),
                    ),
                    3.width,
                    Expanded(
                      child: MyText(
                        text: "Vehicle Info",
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textColor5,
                      ),
                    ),
                    MyText(
                      text: "Vehicle Active",
                      fontWeight: FontWeight.w400,
                      fontSize: 10.sp,
                      color: AppColors.grey,
                    ),
                    1.width,
                    Obx(() {
                      return Transform.scale(
                        scale: 0.9,
                        child: Switch(
                          value: controller.vehicleActive.value,
                          onChanged: (val) {
                            controller.vehicleActive.value = val;
                          },
                          activeTrackColor: AppColors.primary,
                        ),
                      );
                    })
                  ]),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    1.height,
                    CustomContainer(
                        hpadding: 4.w,
                        hMargin: 4.w,
                        vpadding: 1.5.h,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MyText(
                                  text: "Nick name",
                                  fontSize: 14.sp,
                                  color: AppColors.textColor5,
                                  fontWeight: FontWeight.w600,
                                ),
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
                                          return NameYourVehicleSheet(carNickname: carNickname,);
                                        });
                                  },
                                  child: Container(
                                    height: 5.h,
                                    width: 10.5.w,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: AppColors.secondary,
                                        borderRadius:
                                        BorderRadius.circular(10)),
                                    child: SvgPicture.asset(AppSvgs.edit),
                                  ),
                                ),
                              ],
                            ),
                            0.8.height,
                            Divider(),
                            0.8.height,
                            Row(
                              children: [
                                Icon(
                                  Icons.check_circle,
                                  color: AppColors.greenicon,
                                ),
                                3.5.width,
                                Expanded(
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Obx(() {
                                            return MyText(
                                              text: carNickname.value,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.textColor,
                                            );
                                          }),
                                          // 0.5.height,
                                          // MyText(
                                          //   text: "Plate: ALZ6443ZM",
                                          //   fontSize: 10.sp,
                                          //   fontWeight: FontWeight.w500,
                                          //   color: AppColors.grey,
                                          // )
                                        ],
                                      ),
                                      Spacer(),
                                      // SvgPicture.asset(AppSvgs.arrowCircleRight)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )),
                    2.height,
                    CustomContainer(
                        hpadding: 4.w,
                        hMargin: 4.w,
                        vpadding: 1.5.h,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MyText(
                                  text: "Odometer",
                                  fontSize: 14.sp,
                                  color: AppColors.textColor5,
                                  fontWeight: FontWeight.w600,
                                ),
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
                                          return OdometerReadingSheet(
                                            odoController: odometer,);
                                        });
                                  },
                                  child: Container(
                                    height: 5.h,
                                    width: 10.5.w,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: AppColors.secondary,
                                        borderRadius:
                                        BorderRadius.circular(10)),
                                    child: SvgPicture.asset(AppSvgs.edit),
                                  ),
                                ),
                              ],
                            ),
                            0.8.height,
                            Divider(),
                            0.8.height,
                            // Row(
                            //   children: List.generate(
                            //       6,
                            //       (index) => Container(
                            //           padding: EdgeInsets.symmetric(
                            //               horizontal: 11, vertical: 6),
                            //           margin: EdgeInsets.only(right: 6),
                            //           decoration: BoxDecoration(
                            //               border: Border.all(
                            //                   color: AppColors.border),
                            //               borderRadius:
                            //                   BorderRadius.circular(8)),
                            //           child: MyText(
                            //             text: "0",
                            //             fontSize: 10.sp,
                            //             color: AppColors.grey,
                            //             fontWeight: FontWeight.w400,
                            //           ))),
                            // ),
                            pininput.PinCodeTextField(
                              controller: odometer,
                              readOnly: true,
                              appContext: context,
                              length: 6,
                              onChanged: (value) {},
                              mainAxisAlignment: MainAxisAlignment.start,
                              textStyle: GoogleFonts.poppins(
                                  fontSize: 10.sp,
                                  color: AppColors.grey,
                                  fontWeight: FontWeight.w400
                              ),


                              pinTheme: pininput.PinTheme(
                                fieldOuterPadding: EdgeInsets.only(right: 6),
                                shape: PinCodeFieldShape.box,

                                borderRadius: BorderRadius.circular(8),
                                fieldHeight: 31,
                                fieldWidth: 31,

                                //
                                //
                                activeFillColor: Colors.white,
                                inactiveFillColor: Colors.white,
                                selectedFillColor: Colors.white,
                                activeColor: odometer.text == '000000'
                                    ? AppColors.border
                                    : AppColors.primary,
                                inactiveColor: AppColors.border,
                                selectedColor: AppColors.border,
                                borderWidth: 1,
                                activeBorderWidth: 1,
                                inactiveBorderWidth: 1,

                              ),
                              keyboardType: TextInputType.number,
                              boxShadows: [
                                BoxShadow(
                                  offset: Offset(0, 1),
                                  color: Colors.black26,
                                  blurRadius: 10,
                                )
                              ],
                              onCompleted: (value) {
                                print("Completed: $value");
                              },
                            ),
                          ],
                        )),
                    1.5.height,
                    CustomContainer(
                        hpadding: 4.w,
                        hMargin: 4.w,
                        vpadding: 1.5.h,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MyText(
                                  text: "Details",
                                  fontSize: 14.sp,
                                  color: AppColors.textColor5,
                                  fontWeight: FontWeight.w600,
                                ),
                                // Container(
                                //   height: 5.h,
                                //   width: 10.5.w,
                                //   alignment: Alignment.center,
                                //   decoration: BoxDecoration(
                                //       color: AppColors.secondary,
                                //       borderRadius: BorderRadius.circular(10)),
                                //   child: SvgPicture.asset(AppSvgs.edit),
                                // ),
                              ],
                            ),
                            0.8.height,
                            Divider(),
                            0.8.height,
                            DetailInfoRow(
                                title: "Type",
                                info: "Car",
                                errorText: "Add Type"),
                            DetailInfoRow(
                                title: "Registration No",
                                info: "1234",
                                errorText: ""),
                            DetailInfoRow(
                              title: "VIN",
                              info: "",
                              errorText: "Add",
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
                                      return GetMySpecsSheet();
                                    });
                              },),
                            DetailInfoRow(
                                title: "Year",
                                info: "2023",
                                errorText: "Add Year"),
                            DetailInfoRow(
                                title: "Make",
                                info: "Toyota",
                                errorText: "Add Make"),
                            DetailInfoRow(
                                title: "Model",
                                info: "Corolla",
                                errorText: "Add Model"),
                            DetailInfoRow(
                                title: "Trim",
                                info: "S Sedan 4-Door",
                                errorText: "Add Trim"),
                            DetailInfoRow(
                              title: "Engine",
                              info:
                              "1.8L 1798CC 110Cu. In. l4 GAS DOHC Naturally Aspirated",
                              errorText: "Add Engine", width: 60.w,),
                            DetailInfoRow(
                              title: "Engine No",
                              info:
                              "",
                              errorText: "Add", onTap: () async {
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
                                    return GetMySpecsSheet();
                                  });
                            },),
                          ],
                        )),
                    2.height,
                    Obx(() =>

                    controller.showSpecsDetails.value == false ?
                    // if not data in specs
                    VehicleInfoSpecsComponent() :
                    // if  data in specs
                    SpecsDataContainer(),
                    ),


                    2.height,
                    VehicleInfoComponent(),
                    2.height,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
