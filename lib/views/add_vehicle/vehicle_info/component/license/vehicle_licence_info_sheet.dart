import 'package:get/get.dart';
import 'package:nanduba/views/add_vehicle/vehicle_info/widget/vehicle_type_choice_container.dart';
import 'package:nanduba/widgets/core/my_text.dart';

import '../../../../../export.dart';
import '../../widget/service_date_field_widget.dart';

class VehicleLicenseInfoSheet extends StatefulWidget {
  @override
  State<VehicleLicenseInfoSheet> createState() =>
      _VehicleLicenseInfoSheetState();
}

class _VehicleLicenseInfoSheetState extends State<VehicleLicenseInfoSheet> {
  RxInt selectedChoice = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(4.w, 2.h, 4.w, 2.h),
      child: Wrap(
        children: [
          2.height,
          Row(
            children: [
              MyText(text: "2023 Toyota Corolla",
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
                  text: "License Details",

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
                  name: 'license',
                  hintText: "Enter Name",
                ),
                1.height,
                Row(
                  children: [
                    MyText(text: "Examples: ",
                      color: AppColors.primary,
                      fontWeight: FontWeight.w400,
                      fontSize: 9.sp,),
                    MyText(text: "Road Tax, Fitness, Road Service",
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 9.sp,),
                  ],
                ),
                3.height,
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
                    ServiceDateWidget(hint: "Day",maxLength:2 ,),
                    3.width,
                    ServiceDateWidget(hint: "Month",maxLength: 2,),
                    3.width,
                    ServiceDateWidget(hint: "Year",maxLength: 4,),


                  ],
                ),
                2.height,
                MyText(
                  text: "Suggested Date",

                  fontSize: 12.sp,
                  color: AppColors.grey,
                  fontWeight: FontWeight.w400,

                ),
                1.height,
                Obx(() {
                  return VehicleTypeChoiceContainer(
                    choice: "30 mar 2024",
                    selectedChoice: selectedChoice.value,
                    selection: 1,
                    onTap: () {
                      selectedChoice.value = 1;
                    },
                  );
                }),


                3.height,

                CustomButton(
                  label: "Save",
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

