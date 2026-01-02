import 'dart:math';

import 'package:nanduba/export.dart';
import 'package:nanduba/providers/view_request_provider.dart';
import 'package:nanduba/views/create_request/compare_estimates/compare_estimates.dart';
import 'package:nanduba/views/create_request/gather_estimate/gathering_estimate.dart';
import 'package:nanduba/views/create_request/view_requests/component/request_service_items_list.dart';

import '../../../widgets/core/my_text.dart';
import 'component/cancel_request_pop_up.dart';
import 'component/triangle_painter.dart';

class ViewRequests extends StatelessWidget {
  // const ViewRequests({super.key});

  @override
  Widget build(BuildContext context) {
    final viewRequestProvider = context.watch<ViewRequestProvider>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            2.height,
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 4.w,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: 6.h,
                        width: 6.h,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(15.w),
                        ),
                        child: const Center(
                          child: Icon(Icons.arrow_back_ios_new_rounded),
                        ),
                      ),
                    ),
                    3.width,
                    Text(
                      "Request",
                      key: const ValueKey<int>(0),
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: 6.h,
                        width: 6.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(15.w),
                        ),
                        child: Center(
                            child: SvgPicture.asset(
                          AppSvgs.settings,
                          color: AppColors.primary,
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  context
                      .read<ViewRequestProvider>()
                      .showCancelRequestButton(-1);
                },
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: viewRequestProvider.requests.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, requestcategoryindex) {
                      final requests =
                          viewRequestProvider.requests[requestcategoryindex];
                      final services = requests['services'];
                      final isExpanded = viewRequestProvider.isExpanded ==
                          requestcategoryindex;
                      return Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 5.w, vertical: 2.h),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.shadow.withOpacity(0.1),
                                blurRadius: 10,
                                offset: Offset(0, 2)),
                          ],
                          borderRadius: BorderRadius.circular(5.w),
                        ),
                        child: Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.w),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(5.w),
                                        topLeft: Radius.circular(5.w)),
                                    color: AppColors.secondary),
                                child: Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 3.w, vertical: 1.h),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text("Request #452 ",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium!
                                                      .copyWith(
                                                          color: AppColors
                                                              .textColor,
                                                          fontWeight:
                                                              FontWeight.w600)),
                                              // Container(
                                              //   height: 4,
                                              //   width: 4,
                                              //   decoration: BoxDecoration(
                                              //     shape: BoxShape.circle,
                                              //     color: AppColors.black,
                                              //   ),
                                              // ),
                                              // MyText(
                                              //     text:
                                              //         " ${requests['category']}",
                                              //     fontSize: 13,
                                              //     color: AppColors.midDarkGrey,
                                              //     fontWeight: FontWeight.w600),
                                              Spacer(),
                                              GestureDetector(
                                                onTap: () {
                                                  context
                                                      .read<
                                                          ViewRequestProvider>()
                                                      .showCancelRequestButton(
                                                          requestcategoryindex);
                                                },
                                                child: Transform.rotate(
                                                    angle: pi / 2,
                                                    child: SvgPicture.asset(
                                                      AppSvgs.more,
                                                      color: AppColors.primary,
                                                    )),
                                              )
                                            ],
                                          ),
                                          // 0.2.height,
                                          Row(
                                            children: [
                                              Text(
                                                  "${requests['requestDate']}",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium!
                                                      .copyWith(
                                                          color: AppColors
                                                              .textColor,
                                                          fontWeight:
                                                              FontWeight.w500)),
                                              Spacer(),
                                              GestureDetector(
                                                  onTap: () {
                                                    context
                                                        .read<
                                                        ViewRequestProvider>()
                                                        .toggle(
                                                        requestcategoryindex);
                                                  },
                                                  child: Icon(
                                                    isExpanded
                                                        ? Icons
                                                        .keyboard_arrow_down_rounded
                                                        : Icons
                                                        .keyboard_arrow_up_rounded,
                                                    color: AppColors.primary,
                                                    size: 26,
                                                  )),
                                            ],
                                          ),
                                          // Row(
                                          //   children: [
                                          //     if (requests['estimated'] == false &&
                                          //         viewRequestProvider.isExpanded !=
                                          //             requestcategoryindex)
                                          //       Text("Getting Estimates",
                                          //           style: Theme.of(context)
                                          //               .textTheme
                                          //               .bodyMedium!
                                          //               .copyWith(
                                          //               color:
                                          //               AppColors.primary,
                                          //               fontWeight:
                                          //               FontWeight.w500)),
                                          //     if (requests['estimated'] == true &&
                                          //         viewRequestProvider.isExpanded !=
                                          //             requestcategoryindex)
                                          //       Text("3 Estimates",
                                          //           style: Theme.of(context)
                                          //               .textTheme
                                          //               .bodyMedium!
                                          //               .copyWith(
                                          //               color: AppColors.primary,
                                          //               fontWeight: FontWeight.w500)),
                                          //     Spacer(),
                                          //     GestureDetector(
                                          //         onTap: () {
                                          //           context
                                          //               .read<
                                          //               ViewRequestProvider>()
                                          //               .toggle(
                                          //               requestcategoryindex);
                                          //         },
                                          //         child: Icon(
                                          //           isExpanded
                                          //               ? Icons
                                          //               .keyboard_arrow_down_rounded
                                          //               : Icons
                                          //               .keyboard_arrow_up_rounded,
                                          //           color: AppColors.primary,
                                          //           size: 26,
                                          //         )),
                                          //   ],
                                          // ),

                                          // 1.height,
                                        ],
                                      ),
                                    ),
                                    CancelRequestPopUp(
                                      viewRequestProvider: viewRequestProvider,
                                      requestcategoryindex:
                                          requestcategoryindex,
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                                child: Column(
                                  children: [
                                    if (requests['estimated'] == false)
                                      Text("Getting Estimates",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                              color:
                                              AppColors.primary,
                                              fontWeight:
                                              FontWeight.w500)),
                                    if (requests['estimated'] == true)
                                      Row(
                                        children: [
                                          Text("3 Estimates",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                  color: AppColors.primary,
                                                  fontWeight: FontWeight.w500)),
                                          Spacer(),
                                          CustomButton(
                                            label: "View Details",
                                            onPressed: () {
                                              AppCustomNavigator.push(
                                                  context, CompareEstimates());
                                            },
                                            width: 30.w,
                                            height: 4.5.h,
                                            vPadding: 0,
                                            hPadding: 0,
                                            labelFontSize: 11.sp,
                                          )
                                        ],
                                      ),
                                  ],
                                ),
                              ),
                              RequestServiceItemsList(
                                requestcategoryindex: requestcategoryindex,
                                requests: requests,
                                services: services,
                              )
                              // Consumer<ViewRequestProvider>(
                              //     builder: (context, provider, child) {
                              //   return provider.isExpanded == requestcategoryindex
                              //       ? Column(
                              //     crossAxisAlignment: CrossAxisAlignment.start,
                              //           children: [
                              //             requests['estimated'] == false?
                              //             Padding(
                              //               padding: EdgeInsets.only(left: 3.w,
                              //                   top: 1.h),
                              //               child: Text("Getting Estimates",
                              //                   style: Theme.of(context)
                              //                       .textTheme
                              //                       .bodyMedium!
                              //                       .copyWith(
                              //                       color: AppColors.primary,
                              //                       fontWeight:
                              //                       FontWeight.w500)),
                              //             ):SizedBox.shrink(),
                              //             requests['estimated'] == false
                              //                 ? ListView.builder(
                              //                     shrinkWrap: true,
                              //                     // padding: EdgeInsets.symmetric(vertical: 1.h),
                              //                     itemCount: services.length,
                              //                     itemBuilder: (context, index) {
                              //                       final data = services[index];
                              //                       return Padding(
                              //                         padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 0.5.h),
                              //                         child: Column(
                              //                           crossAxisAlignment: CrossAxisAlignment.start,
                              //                           children: [
                              //                             Row(
                              //                               children: [
                              //                                 Container(
                              //                                   height: 6,
                              //                                   width: 6,
                              //                                   decoration: BoxDecoration(
                              //                                     shape: BoxShape.circle,
                              //                                     color: AppColors.primary,
                              //                                   ),
                              //                                 ),
                              //                                 2.width,
                              //                                 MyText(text: data['service'],
                              //                                     color: AppColors.textColor,
                              //                                     fontWeight: FontWeight.w500,
                              //                                     fontSize: 12.sp
                              //                                 ),
                              //
                              //                               ],
                              //                             ),
                              //                           ],
                              //                         ),
                              //                       );
                              //                     })
                              //                 : Padding(
                              //                     padding: EdgeInsets.symmetric(
                              //                         horizontal: 3.w,
                              //                         vertical: 2.h),
                              //                     child: Row(
                              //                       children: [
                              //                         Text("3 Estimates",
                              //                             style: Theme.of(
                              //                                     context)
                              //                                 .textTheme
                              //                                 .bodyMedium!
                              //                                 .copyWith(
                              //                                     color: AppColors
                              //                                         .primary,
                              //                                     fontWeight:
                              //                                         FontWeight
                              //                                             .w500)),
                              //                         Spacer(),
                              //                         CustomButton(
                              //                           label: "View Details",
                              //                           onPressed: () {
                              //                             AppCustomNavigator.push(
                              //                                 context,
                              //                                 CompareEstimates());
                              //                           },
                              //                           width: 30.w,
                              //                           height: 4.5.h,
                              //                           vPadding: 0,
                              //                           hPadding: 0,
                              //                           labelFontSize: 11.sp,
                              //                         )
                              //                       ],
                              //                     ),
                              //                   ),
                              //           ],
                              //         )
                              //       : SizedBox.shrink();
                              // }),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
