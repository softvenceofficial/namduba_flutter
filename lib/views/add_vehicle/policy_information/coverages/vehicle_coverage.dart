import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/add_vehicle/policy_information/coverages/component/comprehensive_coverage.dart';
import 'package:nanduba/views/add_vehicle/policy_information/coverages/widget/coverage_points_list.dart';
import 'package:nanduba/views/add_vehicle/policy_information/coverages/widget/coverage_title_row.dart';

import '../../../../widgets/core/my_text.dart';
import 'component/collision_coverage.dart';

class VehicleCoverage extends StatefulWidget {

  @override
  State<VehicleCoverage> createState() => _VehicleCoverageState();
}

class _VehicleCoverageState extends State<VehicleCoverage> {
  RxInt selectedIndex = (-1).obs;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: 2,
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 5.w),

          itemBuilder: (context, index) {
            return Obx(() {
              return Column(
                children: [
                  0.2.height,
                  GestureDetector(
                    onTap: () {
                      if(selectedIndex.value!=index){
                      selectedIndex.value = index;
                      }else{
                        selectedIndex.value=-1;
                      }
                    },
                    child: CustomContainer(
      
                      hpadding: 4.w,
                      vpadding: 2.h,
                      borderRadius: 20,
                      isBorder:  selectedIndex.value == index?true:false,

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 15),
                                padding: EdgeInsets.all(13),
                                decoration: BoxDecoration(
                                  color: AppColors.secondary,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: SvgPicture.asset(
                                  AppSvgs.carIcon,
                                  color: AppColors.primary,
                                  height: 3.7.h,
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MyText(
                                      text: "2004 Acura MDX",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.sp,
                                    ),
                                    1.height,
                                    MyText(
                                      text: "Commercial Use",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10.sp,
                                      color: AppColors.grey,
                                    ),
      
                                  ],
                                ),
                              ),
                              Transform.rotate(
                                  angle:selectedIndex.value == index?pi/2: -pi / 2,
                                  child: Icon(
                                    Icons.arrow_back_ios_new_rounded, size: 16,
                                    color: AppColors.darkGrey,))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  if(selectedIndex.value != index)
                    2.height,
                  if(selectedIndex.value == index)
                    1.height,
                  if(selectedIndex.value==index)
                    Column(
                      children: [
                        VehicleCoverageComprehensive(),
                        2.height,
                        VehicleCollisionCoverage(),
                        2.height,
                        CustomContainer(
                          hpadding: 4.w,
                          vpadding: 2.h,
                          borderRadius: 20,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 2.h),
                            decoration: BoxDecoration(
                              color: AppColors.secondary,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MyText(
                                      text: "limit and indefinite",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 11.sp,
                                      color: AppColors.textColor,
                                    ),
                                    MyText(
                                      text: "\$15,000",
                                      color: Colors.red,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 11.sp,
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MyText(
                                      text: "Premium",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 11.sp,
                                      color: AppColors.textColor,
                                    ),
                                    MyText(
                                      text: "\$500",
                                      color: Colors.red,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 11.sp,
                                    ),
                                  ],
                                ),

                              ],

                            )
                          ),
                        ),

                      ],
                    ),
                  0.6.height,

      
                ],
              );
            });
          }
      ),
    );
  }
}



class VehicleCoverageComprehensive extends StatelessWidget {
  // const VehicleCoverageComprehensive({super.key});
  List<String> points = [
    "Whether",
    "Theft And Vandalism",
    "If You Hit An Animal",
    "Falling Objects (Like Trees...)",
    "Fire"

  ];
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      hpadding: 5.w,
      vpadding: 2.h,
      borderRadius: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         CoverageTitleRow(icon: AppSvgs.sheild,
              title: "Comprehensive\nCoverage",
            showSwitch: false, switchValue: false,
            ),
          2.height,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                text: "Coverage for damages caused by things you can’t control:",
                fontWeight: FontWeight.w500,
                fontSize: 10.sp,
                color: AppColors.midDarkGrey,
              ),
              0.6.height,
              CoveragePointsList(points: points),

            ],
          ),
          1.height,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyText(
                text: "\$1,000 deductible",
                fontWeight: FontWeight.w500,
                fontSize: 11.sp,
                color: AppColors.primary,
              ),
              2.width,
              Transform.rotate(
                  angle: -pi / 2,
                  child: Icon(Icons.arrow_back_ios_new_rounded, size: 16,
                    color: AppColors.darkGrey,))
            ],
          ),
          0.5.height,


        ],
      ),
    );
  }
}
class VehicleCollisionCoverage extends StatelessWidget {
  // const VehicleCollisionCoverage({super.key});
  List<String> points = [
    "If you hit another vehicle or object",
    "If another vehicle hits you",
    "If You Hit An Animal",
    "If your car rolls over",

  ];
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      hpadding: 5.w,
      vpadding: 2.h,
      borderRadius: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CoverageTitleRow(icon: AppSvgs.collision,
              title: "Collision\nCoverage",
              switchValue: false,
            showSwitch: false,),
          2.height,
          MyText(
            text: "You need to add comprehensive coverage to include this on your policy.",
            fontWeight: FontWeight.w500,
            fontSize: 10.sp,
            color: AppColors.black,
          ),
          1.height,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                text: "Covers you for damage to your vehicle",
                fontWeight: FontWeight.w500,
                fontSize: 10.sp,
                color: AppColors.midDarkGrey,
              ),
              0.5.height,
              CoveragePointsList(points: points),
              1.height,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyText(
                    text: "\$1,000 deductible",
                    fontWeight: FontWeight.w500,
                    fontSize: 11.sp,
                    color: AppColors.primary,
                  ),
                  2.width,
                  Transform.rotate(
                      angle: -pi / 2,
                      child: Icon(Icons.arrow_back_ios_new_rounded, size: 16,
                        color: AppColors.darkGrey,))
                ],
              ),
              0.5.height,


            ],
          ),
        ],
      ),
    );
  }
}

