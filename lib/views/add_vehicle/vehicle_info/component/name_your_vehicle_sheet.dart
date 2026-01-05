import 'package:get/get.dart';
import 'package:nanduba/controllers/vehicle_profile_controller.dart';
import 'package:nanduba/widgets/core/my_text.dart';

import '../../../../export.dart';

class NameYourVehicleSheet extends StatefulWidget {
  final RxString carNickname;
  const NameYourVehicleSheet({super.key, required this.carNickname});
  @override
  State<NameYourVehicleSheet> createState() => _NameYourVehicleSheetState();
}

class _NameYourVehicleSheetState extends State<NameYourVehicleSheet> {
  int selectedChoice = -1;
  final VehicleProfileController controller = Get.find();
  final TextEditingController nickname = TextEditingController();
  int selectedStatusIndex = -1;

  Widget _buildStatusCheckbox(int index, String label) {
    bool isChecked = selectedStatusIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedStatusIndex = index;
        });
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: isChecked ? AppColors.primary : AppColors.cBEBEBE,
                width: 1.5,
              ),
            ),
            child: isChecked
                ? const Icon(
                    Icons.check,
                    color: AppColors.primary,
                    size: 16,
                  )
                : null,
          ),
          4.width,  
          MyText(
            text: label,
            fontSize: 10.sp,
            color: AppColors.textColor,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(4.w, 2.h, 4.w, 2.h),
      child: Wrap(
        children: [
          2.height,
          Row(
            children: [
              MyText(
                text: "Name Your Vehicle",
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.textColor,
              ),
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
          Divider(
            color: AppColors.border,
          ),
          4.height,
          Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  text: "Vehicle Nickname",
                  fontSize: 12.sp,
                  color: AppColors.grey,
                  fontWeight: FontWeight.w400,
                ),
                1.height,
                CustomTextField(
                  controller: nickname,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(
                      AppSvgs.carIcon,
                      color: AppColors.primary,
                    ),
                  ),
                  style: GoogleFonts.poppins(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textColor),
                  name: 'carname',
                  hintText: "",
                  // prefixIcon: SvgPicture.asset(
                  //   AppSvgs.carIcon,
                  //   fit: BoxFit.scaleDown,
                  //   color: AppColors.primary,
                  // ),
                ),
                1.height,
                MyText(
                  text: "What is the Status of this Vehicle",
                  fontSize: 12.sp,
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                ),
                1.height,
                Wrap(
                  spacing: 2.w,
                  runSpacing: 2.h,
                  children: [
                    _buildStatusCheckbox(0, "Active"),
                    _buildStatusCheckbox(1, "Written-off"),
                    _buildStatusCheckbox(2, "De-registered"),
                    _buildStatusCheckbox(3, "Sold"),
                    1.width,
                    _buildStatusCheckbox(4, "Out of Service"),
                  ],
                ),
                3.height,
                CustomButton(
                  label: "Save",
                  onPressed: () {
                    widget.carNickname.value = nickname.text.trim();
                    Get.back();
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
