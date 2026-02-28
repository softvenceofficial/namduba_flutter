// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:nanduba/controllers/vehicle_profile_controller.dart';
import 'package:nanduba/views/add_vehicle/vehicle_info/component/name_your_vehicle_sheet.dart';
import 'package:nanduba/views/add_vehicle/vehicle_info/component/odometer_reading_sheet.dart';
import 'package:nanduba/views/add_vehicle/vehicle_info/component/vehicle_info_component.dart';
import 'package:nanduba/views/add_vehicle/vehicle_info/widget/compliance_chack_widget.dart';
import 'package:nanduba/views/add_vehicle/vehicle_info/widget/compliance_popup.dart';
import 'package:nanduba/views/add_vehicle/vehicle_info/widget/detail_info_row_widget.dart';
import 'package:nanduba/views/add_vehicle/vehicle_profile/widget/get_your_corolla_details.dart';

import '../../../export.dart';
import '../../../widgets/core/my_text.dart';

class VehicleInfoDetails extends StatefulWidget {
  const VehicleInfoDetails({super.key});

  @override
  State<VehicleInfoDetails> createState() => _VehicleInfoDetailsState();
}

class _VehicleInfoDetailsState extends State<VehicleInfoDetails> {
  bool isVisible = true;
  final VehicleProfileController controller = Get.find();

  // Use TextEditingController with pinput
  final TextEditingController odometer = TextEditingController();

  RxString carNickname = "Eleanor's Car".obs;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      odometer.text = '000000';
    });
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 25,
      height: 31,
      textStyle: GoogleFonts.poppins(
        fontSize: 10.sp,
        color: AppColors.grey,
        fontWeight: FontWeight.w400,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.border),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 1),
            color: Colors.black26,
            blurRadius: 10,
          ),
        ],
      ),
    );

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
                        shape: BoxShape.circle,
                      ),
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
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: VehicleDetailsPopup(
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
                    ),

                    // Vehicle Name Section
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
                                text: "Vehicle name",
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
                                      return NameYourVehicleSheet(
                                        carNickname: carNickname,
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  height: 5.h,
                                  width: 10.5.w,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: AppColors.secondary,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
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
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Obx(() {
                                      return MyText(
                                        text: carNickname.value,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.textColor,
                                      );
                                    }),
                                    2.width,
                                    MyText(
                                      text: "Status : Active",
                                      fontSize: 8.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.textColor5,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),

                    2.height,

                    // Odometer Section
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
                                        odoController: odometer,
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  height: 5.h,
                                  width: 10.5.w,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: AppColors.secondary,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: SvgPicture.asset(AppSvgs.edit),
                                ),
                              ),
                            ],
                          ),
                          0.8.height,
                          Divider(),
                          0.8.height,

                          // Pinput Odometer Display
                          Pinput(
                            length: 6,
                            controller: odometer,
                            // readOnly: true,
                            defaultPinTheme: defaultPinTheme,
                            focusedPinTheme: defaultPinTheme.copyWith(
                              decoration: defaultPinTheme.decoration!.copyWith(
                                border: Border.all(color: AppColors.primary),
                              ),
                            ),
                            submittedPinTheme: defaultPinTheme,
                            onCompleted: (value) {
                              debugPrint("Completed: $value");
                            },
                          ),
                        ],
                      ),
                    ),

                    1.5.height,

                    // Vehicle Details Section
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
                            ],
                          ),
                          0.8.height,
                          Divider(),
                          0.8.height,
                          DetailInfoRow(
                              title: "Plate",
                              info: "ABP1356ZM",
                              errorText: "Add Type"),
                          DetailInfoRow(
                              title: "VIN",
                              info: "1HGB H41JX MN10 91867",
                              errorText: ""),
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
                              title: "Variant",
                              info: "Petrol sedan",
                              errorText: "Add Trim"),
                          DetailInfoRow(
                            title: "Type",
                            info: "1.5 4WD",
                            errorText: "Add Engine",
                            width: 60.w,
                          ),
                          DetailInfoRow(
                            title: "Chassis ",
                            info: "AWD--E116",
                            errorText: "Add Engine",
                            width: 60.w,
                          ),
                          DetailInfoRow(
                            title: "Engine No",
                            info: "1,497CC 76kw 103hp 1NZ-FE",
                            errorText: "Add",
                          ),
                          DetailInfoRow(
                            title: "Colour ",
                            info: "Colour",
                            errorText: "Add Engine",
                            width: 60.w,
                          ),
                        ],
                      ),
                    ),

                    ComplianceChackWidget(),
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
