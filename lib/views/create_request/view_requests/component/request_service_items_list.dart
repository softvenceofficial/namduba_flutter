import 'package:nanduba/providers/view_request_provider.dart';

import '../../../../export.dart';
import '../../../../widgets/core/my_text.dart';
import '../../compare_estimates/compare_estimates.dart';

class RequestServiceItemsList extends StatelessWidget {
  final List<Map<String, dynamic>> services;
  final int requestcategoryindex;
  final Map<String, dynamic> requests;
  const RequestServiceItemsList(
      {super.key,
      required this.services,
      required this.requestcategoryindex,
      required this.requests});

  @override
  Widget build(BuildContext context) {
    return Consumer<ViewRequestProvider>(builder: (context, provider, child) {
      return provider.isExpanded == requestcategoryindex
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // requests['estimated'] == false
                //     ? Padding(
                //         padding: EdgeInsets.only(left: 3.w, top: 1.h),
                //         child: Text("Getting Estimates",
                //             style: Theme.of(context)
                //                 .textTheme
                //                 .bodyMedium!
                //                 .copyWith(
                //                     color: AppColors.primary,
                //                     fontWeight: FontWeight.w500)),
                //       )
                //     : SizedBox.shrink(),
                // requests['estimated'] == true
                //     ? Padding(
                //         padding: EdgeInsets.symmetric(
                //             horizontal: 3.w, vertical: 2.h),
                //         child: Row(
                //           children: [
                //             Text("3 Estimates",
                //                 style: Theme.of(context)
                //                     .textTheme
                //                     .bodyMedium!
                //                     .copyWith(
                //                         color: AppColors.primary,
                //                         fontWeight: FontWeight.w500)),
                //             Spacer(),
                //             CustomButton(
                //               label: "View Details",
                //               onPressed: () {
                //                 AppCustomNavigator.push(
                //                     context, CompareEstimates());
                //               },
                //               width: 30.w,
                //               height: 4.5.h,
                //               vPadding: 0,
                //               hPadding: 0,
                //               labelFontSize: 11.sp,
                //             )
                //           ],
                //         ),
                //       )
                //     : SizedBox.shrink(),
                ListView.builder(
                    shrinkWrap: true,
                    // padding: EdgeInsets.symmetric(vertical: 1.h),
                    itemCount: services.length,
                    itemBuilder: (context, index) {
                      final data = services[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 3.w, vertical: 0.5.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 6,
                                  width: 6,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.primary,
                                  ),
                                ),
                                2.width,
                                MyText(
                                    text: requests['category'] == "Repair"
                                        ? "${data['service']} (${data['vehicle'].length})"
                                        : data['service'],
                                    color: AppColors.textColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11.sp),
                                Spacer(),
                                if (requests['category'] == "Repair")
                                  GestureDetector(
                                      onTap: () {
                                        provider.showVehicles(index);
                                      },
                                      child: Icon(
                                        provider.vehicleExapnd == index
                                            ? Icons.keyboard_arrow_down_rounded
                                            : Icons.keyboard_arrow_up_rounded,
                                        color: Colors.black,
                                        size: 30,
                                      )),
                              ],
                            ),
                            if (requests['category'] == "Repair" && provider.vehicleExapnd==index)
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: List.generate(data['vehicle'].length,
                                    (vehicleindex) => Column(
                                      children: [
                                        MyText(
                                            text: data['vehicle'][vehicleindex],
                                            color: AppColors.grey,
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w500),
                                        1.height,
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      );
                    }),
                if (requests['category'] == "Repair")
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.0.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Divider(
                          color: AppColors.border,
                        ),
                        0.5.height,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(AppSvgs.location2),
                            2.width,
                            MyText(
                              text: "HSE #16, Ennsvilla, USA",
                              fontWeight: FontWeight.w500,
                              fontSize: 10.sp,
                              color: AppColors.midDarkGrey,
                            )
                          ],
                        ),
                        1.height,
                      ],
                    ),
                  ),
                0.5.height,
              ],
            )
          : SizedBox.shrink();
    });
  }
}
