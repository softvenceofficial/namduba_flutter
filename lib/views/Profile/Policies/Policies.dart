import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/Profile/Policies/track_plans.dart';
import 'package:nanduba/views/Profile/Policies/your_plans.dart';
import 'package:nanduba/widgets/core/my_text.dart';
import 'package:nanduba/widgets/core/custom_button.dart';

class Policies extends StatefulWidget {
  const Policies({super.key});

  @override
  State<Policies> createState() => _PoliciesState();
}

class _PoliciesState extends State<Policies> {
  RxInt selectedButtonIndex = 1.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 2.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Row(
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
                  SizedBox(width: 3.w),
                  Expanded(
                    child: MyText(
                      text: "Policies",
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textColor5,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(3.w),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.lightGrey),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: SvgPicture.asset(
                      AppSvgs.settings,
                      color: AppColors.border3,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 2.h),
            Obx(() {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Row(
                  children: [
                    CustomButton(
                      width: 32.w,
                      height: 4.h,
                      hPadding: 0,
                      vPadding: 0,
                      borderColor: AppColors.transparent,
                      label: "Your Plans",
                      labelFontSize: 10.sp,
                      onPressed: () {
                        selectedButtonIndex.value = 1;
                      },
                      textcolor: selectedButtonIndex.value == 1
                          ? AppColors.white
                          : AppColors.cBEBEBE,
                      backgroundColor: selectedButtonIndex.value == 1
                          ? AppColors.primary
                          : Colors.transparent,
                      foregroundColor: selectedButtonIndex.value == 1
                          ? AppColors.white
                          : AppColors.grey,
                    ),
                    SizedBox(width: 16),
                    CustomButton(
                      width: 32.w,
                      height: 4.h,
                      hPadding: 0,
                      vPadding: 0,
                      borderColor: AppColors.transparent,
                      label: "Track Claims",
                      labelFontSize: 10.sp,
                      onPressed: () {
                        selectedButtonIndex.value = 2;
                      },
                      textcolor: selectedButtonIndex.value == 2
                          ? AppColors.white
                          : AppColors.cBEBEBE,
                      backgroundColor: selectedButtonIndex.value == 2
                          ? AppColors.primary
                          : Colors.transparent,
                      foregroundColor: selectedButtonIndex.value == 2
                          ? AppColors.white
                          : AppColors.grey,
                    ),
                    SizedBox(width: 16),
                  ],
                ),
              );
            }),
            SizedBox(height: 1.h),
            SizedBox(height: 0.5.h),
            Obx(() {
              return selectedButtonIndex.value == 1
                  ? YourPlans(progress1: 0.65, progress2: 0.95)
                  : TrackPlans();
            }),
          ],
        ),
      ),
    );
  }
}
