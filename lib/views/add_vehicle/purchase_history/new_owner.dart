import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/add_vehicle/purchase_history/confirm_vehicle_transfer.dart';

import '../../../widgets/core/my_text.dart';

class NewOwner extends StatefulWidget {
  const NewOwner({super.key});

  @override
  State<NewOwner> createState() => _NewOwnerState();
}

class _NewOwnerState extends State<NewOwner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.0.w),
        child: Column(
          children: [
            CustomAppbar(title: "New Owner"),
            2.height,
            Align(
              alignment: Alignment.centerLeft,
              child: MyText(
                text: 'Enter the new owner’s email address:',
                color: AppColors.black,
                fontWeight: FontWeight.w500,
                fontSize: 12.sp,
                textAlign: TextAlign.center,
              ),
            ),
            3.height,
            Align(
              alignment: Alignment.centerLeft,
              child: MyText(
                text: 'Email',
                color: AppColors.grey,
                fontWeight: FontWeight.w400,
                fontSize: 10.sp,
                textAlign: TextAlign.center,
              ),
            ),
            2.height,
            CustomTextField(
              name: "Email",
              hintText: "inongesn@gmail.com",
              hintStyle: GoogleFonts.poppins(
                  textStyle: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.textColor,
              )),
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.textColor,
              )),
              keyboardType: TextInputType.emailAddress,
              prefixIcon: SvgPicture.asset(
                AppSvgs.emailIcon,
                fit: BoxFit.scaleDown,
              ),
            ),
            Spacer(),
            CustomButton(
                label: "Next",
                onPressed: () {
                  Get.to(ConfirmVehicleTransfer());
                }),
            2.height,
            CustomButton(
              label: "Cancel",
              onPressed: () {
                Get.back();
              },
              borderColor: AppColors.primary,
              textcolor: AppColors.red,
              foregroundColor: AppColors.primary,
              backgroundColor: Colors.white,
            ),
            2.height,
          ],
        ),
      )),
    );
  }
}
