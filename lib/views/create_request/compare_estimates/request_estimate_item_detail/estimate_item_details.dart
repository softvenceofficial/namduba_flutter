import 'package:get/get.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/providers/estimate_provider.dart';
import 'package:nanduba/views/create_request/compare_estimates/estimate_details/component/view_request_sheet.dart';
import 'package:nanduba/views/create_request/compare_estimates/request_estimate_item_detail/component/estimated_service_detail_list.dart';
import 'package:nanduba/widgets/core/my_text.dart';

import '../../../../providers/view_request_provider.dart';
import '../../../../widgets/core/custom_report_container.dart';

class EstimateServiceItemDetails extends StatelessWidget {
  final String estimateDetail;

  const EstimateServiceItemDetails({
    super.key,
    required this.estimateDetail,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            2.height,
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 4.w,
              ),
              child: CustomAppbar(
                title: estimateDetail,
                isPop: true,
                isSearch: false,
                isRequestAdd: false,
              ),
            ),
            1.height,
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Column(
                    children: [
                    EstimatedServiceDetailList(),
                      0.2.height,
                      1.height,
                      CustomContainer(
                        hpadding: 3.w,
                        vpadding: 1.5.h,
                        borderRadius: 12.sp,
                        child: Row(
                          children: [
                            Text(
                              "Items (2)",
                              style: Theme.of(context)!
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontSize: 16,
                                      color: AppColors.textColor,
                                      fontWeight: FontWeight.w500),
                            ),
                            Spacer(),
                            Text(
                              "\$${1200.00}",
                              style: Theme.of(context)!
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.primary),
                            )
                          ],
                        ),
                      ),
                      2.height,
                      Row(
                        children: [
                          // Text("Reports",style: Theme.of(context)!.textTheme.bodyLarge!.copyWith(
                          //   color: AppColors.textColor,
                          //   fontWeight: FontWeight.w600
                          // ),),
                          MyText(
                            text: "Reports",
                            fontWeight: FontWeight.w600,
                            color: AppColors.textColor,
                            fontSize: 18,
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_drop_down_circle_outlined,
                            size: 20,
                          )
                        ],
                      ),
                      1.height,
                      CustomReportContanier(text: 'Vehicle Mainenance Report'),
                      2.height,
                      CustomReportContanier(text: 'Vehicle Service Report'),
                      1.height,
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
