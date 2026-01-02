import 'dart:math';

import 'package:get/get.dart';
import 'package:nanduba/views/add_vehicle/policy_information/coverages/widget/coverage_points_list.dart';
import 'package:nanduba/views/add_vehicle/policy_information/coverages/widget/coverage_title_row.dart';

import '../../../../../export.dart';
import '../../../../../widgets/core/my_text.dart';

class CollisionCoverage extends StatelessWidget {
  // const ComprehensiveCoverage({super.key});
  List<String> points = [
    "If you hit another vehicle or object",
    "If another vehicle hits you",
    "If You Hit An Animal",
    "If your car rolls over",

  ];
  RxBool showColli = false.obs;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      hpadding: 4.w,
      vpadding: 2.h,
      borderRadius: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() {
            return CoverageTitleRow(icon: AppSvgs.collision,
              title: "Collision\nCoverage",
              switchValue: showColli.value,
              onChanged: (val) {
                showColli.value = val;
              },);
          }),
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
