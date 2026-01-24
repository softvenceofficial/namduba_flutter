import 'package:get/get.dart';
import 'package:nanduba/views/add_vehicle/purchase_history/component/job_details_widget.dart';
import 'package:nanduba/widgets/core/my_text.dart';

import '../../../../export.dart';

class ReportHistory extends StatelessWidget {
  const ReportHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Get.to(InspectionReport());
                Get.to(const JobDetailsWidget());
              },
              child: CustomContainer(
                borderRadius: 5.w,
                vMargin: 1.h,
                hMargin: 5.w,
                hpadding: 3.w,
                vpadding: 1.1.h,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // height: 5.5.h,
                      // width: 10.5.w,
                      height: 58,
                      width: 58,

                      decoration: BoxDecoration(
                          color: AppColors.secondary,
                          borderRadius: BorderRadius.circular(16)),
                      child: Center(child: SvgPicture.asset(AppSvgs.report)),
                    ),
                    3.width,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: "Vehicle Inspection Report",
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColor,
                        ),
                        1.height,
                        MyText(
                          text: "Created on Jan 18, 2024 ",
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.midDarkGrey,
                        ),
                      ],
                    ),
                    const Spacer(),
                    SvgPicture.asset(AppSvgs.arrowCircleRight)
                  ],
                ),
              ),
            );
          }),
    );
  }
}
