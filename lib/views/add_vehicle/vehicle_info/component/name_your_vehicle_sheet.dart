import 'package:get/get.dart';
import 'package:nanduba/controllers/vehicle_profile_controller.dart';
import 'package:nanduba/views/add_vehicle/vehicle_info/widget/vehicle_type_choice_container.dart';
import 'package:nanduba/widgets/core/my_text.dart';

import '../../../../export.dart';

class NameYourVehicleSheet extends StatefulWidget {
  final RxString carNickname;
   const NameYourVehicleSheet({super.key, required this.carNickname});
  @override
  State<NameYourVehicleSheet> createState() => _NameYourVehicleSheetState();
}

class _NameYourVehicleSheetState extends State<NameYourVehicleSheet> {
 int selectedChoice=-1;
 final VehicleProfileController controller = Get.find();
 final TextEditingController nickname = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(4.w, 2.h, 4.w, 2.h),
      child: Wrap(
        children: [
          2.height,
          Row(
            children: [
              MyText(text: "Name Your Vehicle",fontSize: 14.sp,fontWeight: FontWeight.w600,color: AppColors.textColor,),
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
                text:   "Vehicle Nickname",

                    fontSize: 12.sp,
                    color: AppColors.grey,
                    fontWeight: FontWeight.w400,

                ),
                1.height,
                CustomTextField(
                  controller: nickname,
                  style: GoogleFonts.poppins(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textColor
                  ),
                  name: 'carname',
                  hintText: "",
                  // prefixIcon: SvgPicture.asset(
                  //   AppSvgs.carIcon,
                  //   fit: BoxFit.scaleDown,
                  //   color: AppColors.primary,
                  // ),

                ),
                // 2.height,
                // MyText(text: "What Type Of Vehicle Is This?",color: AppColors.textColor,fontSize: 14.sp,fontWeight: FontWeight.w600,),
                // 1.height,
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //
                //       children: [
                //         VehicleTypeChoiceContainer(choice: "Boat",selectedChoice: selectedChoice,selection: 1,
                //           onTap: (){
                //           setState(() {
                //             selectedChoice=1;
                //           });
                //
                //         },),
                //         2.height,
                //         VehicleTypeChoiceContainer(choice: "Motorbike",selectedChoice: selectedChoice,selection: 2,   onTap: (){
                //           setState(() {
                //             selectedChoice=2;
                //           });
                //
                //         },),
                //
                //       ],
                //     ),
                //     Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         VehicleTypeChoiceContainer(choice: "Car",selectedChoice: selectedChoice,selection: 4,  onTap: (){
                //           setState(() {
                //             selectedChoice=4;
                //           });
                //
                //
                //         },),
                //         2.height,
                //
                //         VehicleTypeChoiceContainer(choice: "Trailer",selectedChoice: selectedChoice,selection: 5,
                //           onTap: (){
                //             setState(() {
                //               selectedChoice=5;
                //             });
                //
                //           },),
                //
                //       ],
                //     ),
                //     VehicleTypeChoiceContainer(choice: "Equipment",selectedChoice: selectedChoice,selection: 3,
                //       onTap: (){
                //         setState(() {
                //           selectedChoice=3;
                //         });
                //
                //       },
                //
                //     ),
                //   ],
                // ),

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
