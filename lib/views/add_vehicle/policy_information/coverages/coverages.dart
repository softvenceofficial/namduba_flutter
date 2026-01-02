import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/add_vehicle/policy_information/coverages/component/collision_coverage.dart';
import 'package:nanduba/views/add_vehicle/policy_information/coverages/component/comprehensive_coverage.dart';
import 'package:nanduba/views/add_vehicle/policy_information/coverages/vehicle_coverage.dart';
import 'package:nanduba/views/add_vehicle/purchase_history/basic_report.dart';
import '../../../../widgets/core/my_text.dart';

class Coverages extends StatefulWidget {

  @override
  State<Coverages> createState() => _CoveragesState();
}

class _CoveragesState extends State<Coverages> {
  int selectedButtonIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(

          children: [
            1.height,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: CustomAppbar(title: "Coverages",toggleIcon: AppImages.toggle,),
            ),
            2.height,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Row(
                children: [
                  CustomButton(
                    width: 30.w,
                    height: 4.5.h,
                    hPadding: 0,
                    vPadding: 0,
                    borderColor: AppColors.transparent,
                    label: "Overview",
                    labelFontSize: 10.sp,
                    onPressed: () {
                      setState(() {
                        selectedButtonIndex = 1;
                      });
                    },

                    backgroundColor: selectedButtonIndex == 1
                        ? AppColors.primary
                        : Colors.transparent,
                    foregroundColor: selectedButtonIndex == 1
                        ? AppColors.white
                        : AppColors.grey,
                  ),
                  Spacer(),
                  CustomButton(

                    width: 30.w,
                    height: 4.5.h,
                    hPadding: 0,
                    vPadding: 0,
                    borderColor: AppColors.transparent,
                    label: "Vehicles",
                    labelFontSize: 10.sp,
                    onPressed: () {
                      setState(() {
                        selectedButtonIndex = 2;
                      });
                    },

                    backgroundColor: selectedButtonIndex == 2
                        ? AppColors.primary
                        : Colors.transparent,
                    foregroundColor: selectedButtonIndex == 2
                        ? AppColors.white
                        : AppColors.grey,

                  ),
                  Spacer(flex: 2,),

                ],
              ),
            ),
            2.height,
            selectedButtonIndex==1?
            Expanded(
              child:SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Column(
                    children: [
                      1.height,
                      ComprehensiveCoverage(),
                      2.height,
                      CollisionCoverage(),
                      0.5.height,

                    ],
                  ),
                ),
              ),
            ):VehicleCoverage(),

          ],
        ),
      ),

    );
  }
}
