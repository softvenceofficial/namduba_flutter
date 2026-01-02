import 'dart:math';

import 'package:get/get.dart';
import 'package:nanduba/views/add_vehicle/policy_information/coverages/widget/coverage_points_list.dart';
import 'package:nanduba/views/add_vehicle/policy_information/coverages/widget/coverage_title_row.dart';

import '../../../../../export.dart';
import '../../../../../widgets/core/my_text.dart';

class ComprehensiveCoverage extends StatelessWidget {
  // const ComprehensiveCoverage({super.key});
  List<String> points = [
    "Whether",
    "Theft And Vandalism",
    "If You Hit An Animal",
    "Falling Objects (Like Trees...)",
    "Fire"

  ];
  RxBool showCom = false.obs;

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
            return CoverageTitleRow(icon: AppSvgs.sheild,
              title: "Comprehensive\nCoverage",
              switchValue: showCom.value,
              onChanged: (val) {
                showCom.value = val;
              },);
          }),
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
