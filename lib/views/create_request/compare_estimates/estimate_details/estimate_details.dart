import 'package:get/get.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/providers/estimate_provider.dart';
import 'package:nanduba/views/create_request/compare_estimates/estimate_details/component/view_request_sheet.dart';
import 'package:nanduba/views/create_request/compare_estimates/request_estimate_item_detail/estimate_item_details.dart';
import 'package:nanduba/views/create_request/payment_methods/choose_payment_methods.dart';
import 'package:nanduba/views/inbox/chat_screen/chat_screen.dart';
import 'package:nanduba/views/shop/seller_shop_info.dart';
import 'package:nanduba/widgets/core/my_text.dart';

import '../../../../controllers/vehicle_profile_controller.dart';
import 'component/estimate_details_pop_up.dart';

class EstimateDetails extends StatelessWidget {
  final VehicleProfileController controller = Get.find();
  RxBool isAccepted = false.obs;
  RxBool isRejected = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          controller.isOpen.value = false;
        },
        child: SafeArea(
          child: Column(
            children: [
              2.height,
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 4.w,
                ),
                child: CustomAppbar(
                  title: "Estimates Details",
                  isPop: true,
                  isSearch: false,
                  isRequestAdd: false,
                  toggleIcon: AppImages.toggle,
                  // Replace with your toggle image path
                  onTogglePressed: () {
                    controller.showPopUp();
                  },
                ),
              ),
              1.height,
              Expanded(
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(SellerShopInfo());
                            },
                            child: CustomContainer(
                              borderRadius: 5.w,
                              vMargin: 1.h,
                              hMargin: 5.w,
                              hpadding: 3.w,
                              vpadding: 1.5.h,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 10.h,
                                    width: 21.w,
                                    clipBehavior: Clip.hardEdge,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: AppColors.midLightGrey,
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    child: Image.asset(
                                      AppImages.bmw,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  2.width,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // SizedBox(
                                      //   width: 50.w,
                                      //   child: Text("Toyato Zambia LTD",
                                      //       style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      //           color: AppColors.textColor,
                                      //           fontSize: 12.sp,
                                      //           fontWeight: FontWeight.w600,height: 1)),
                                      // ),
                                      SizedBox(
                                        width: 60.w, // Or any specific width
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: MyText(
                                                text: "Toyota Zambia LTD",
                                                color: AppColors.textColor,
                                                fontSize: 16,
                                                maxLines: 1,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Obx(() => Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 2.w),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.sp),
                                                    color: (isAccepted.value &&
                                                            !isRejected.value)
                                                        ? AppColors.yellow
                                                        : (!isAccepted.value &&
                                                                isRejected
                                                                    .value)
                                                            ? AppColors.red
                                                            : AppColors.green,
                                                  ),
                                                  child: Text(
                                                    (isAccepted.value &&
                                                            !isRejected.value)
                                                        ? 'Accepted'
                                                        : (!isAccepted.value &&
                                                                isRejected
                                                                    .value)
                                                            ? 'Rejected'
                                                            : 'Open',
                                                  ),
                                                )),
                                          ],
                                        ),
                                      ),

                                      0.8.height,
                                      // Text("February 13, 2024 at 5:36 pm",style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                      //     color: AppColors.midDarkGrey,
                                      //     fontWeight: FontWeight.w500,
                                      //     fontSize: 11.sp
                                      //
                                      // )),
                                      MyText(
                                        text: "February 13, 2024 at 5:36 pm",
                                        color: AppColors.grey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      0.8.height,

                                      GestureDetector(
                                        onTap: () async {
                                          await _showModalBottomSheet(context);
                                        },
                                        child: Text("View Request",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .copyWith(
                                                    color: AppColors.primary,
                                                    fontSize: 10.sp,
                                                    fontWeight: FontWeight.w600,
                                                    decoration: TextDecoration
                                                        .underline,
                                                    decorationColor:
                                                        AppColors.primary)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          0.2.height,
                          Consumer<EstimateProvider>(
                            builder: (context, provider, child) {
                              return CustomContainer(
                                borderRadius: 5.w,
                                vMargin: 1.h,
                                hMargin: 5.w,
                                hpadding: 2.w,
                                vpadding: 0.4.h,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: provider.services.length,
                                    physics: NeverScrollableScrollPhysics(),
                                    padding: EdgeInsets.zero,
                                    itemBuilder: (context, index) {
                                      final service = provider.services[index];
                                      return Column(
                                        children: [
                                          1.height,
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 7.h,
                                                width: 15.w,
                                                // height: 54,
                                                // width: 54,
                                                clipBehavior: Clip.hardEdge,
                                                decoration: BoxDecoration(
                                                    color:
                                                        AppColors.midLightGrey,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12)),
                                                child: Image.asset(
                                                  AppImages.owner,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              3.width,
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  0.2.height,
                                                  SizedBox(
                                                    width: 68.w,
                                                    child: Text(
                                                        service['service'],
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyLarge!
                                                            .copyWith(
                                                                color: AppColors
                                                                    .textColor,
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                height: 1)),
                                                  ),
                                                  1.height,
                                                  Text("Qty: 2",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium!
                                                          .copyWith(
                                                              color: AppColors
                                                                  .textColor2,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 10.sp)),
                                                  0.5.height,
                                                  Text("\$${service['price']}",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyLarge!
                                                          .copyWith(
                                                              color: AppColors
                                                                  .primary,
                                                              fontSize: 12.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800)),
                                                  0.3.height,
                                                  Row(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          AppCustomNavigator.push(
                                                              context,
                                                              EstimateServiceItemDetails(
                                                                estimateDetail:
                                                                    service[
                                                                        'service'],
                                                              ));
                                                        },
                                                        child: Text(
                                                            "View Details",
                                                            style: Theme
                                                                    .of(context)
                                                                .textTheme
                                                                .bodyLarge!
                                                                .copyWith(
                                                                    color: AppColors
                                                                        .primary,
                                                                    fontSize:
                                                                        10.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    decoration:
                                                                        TextDecoration
                                                                            .underline,
                                                                    decorationColor:
                                                                        AppColors
                                                                            .primary)),
                                                      ),
                                                      4.width,
                                                      GestureDetector(
                                                        onTap: () {
                                                          provider
                                                              .removeService(
                                                                  service);
                                                        },
                                                        child: Text("Remove",
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyLarge!
                                                                .copyWith(
                                                                    color: AppColors
                                                                        .primary,
                                                                    fontSize:
                                                                        10.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    decoration:
                                                                        TextDecoration
                                                                            .underline,
                                                                    decorationColor:
                                                                        AppColors
                                                                            .primary)),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          1.5.height,
                                        ],
                                      );
                                    }),
                              );
                            },
                          ),
                          Consumer<EstimateProvider>(
                            builder: (context, provider, child) {
                              return CustomContainer(
                                  borderRadius: 5.w,
                                  vMargin: 1.h,
                                  hMargin: 5.w,
                                  hpadding: 4.w,
                                  vpadding: 2.h,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          MyText(
                                            text: "Items (2)",
                                            color: AppColors.midDarkGrey,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12.sp,
                                          ),
                                          Spacer(),
                                          Text(
                                            "\$${provider.total}.00",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .copyWith(
                                                  color: AppColors.textColor,
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        color: AppColors.border,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Taxes",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .copyWith(
                                                  color: AppColors.textColor,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12.sp,
                                                ),
                                          ),
                                          Spacer(),
                                          Text(
                                            "\$0.00",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .copyWith(
                                                  color: AppColors.textColor,
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        color: AppColors.border,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Total",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .copyWith(
                                                  color: AppColors.textColor,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12.sp,
                                                ),
                                          ),
                                          const Spacer(),
                                          // Text("\$${provider.total}",style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                          //   color: AppColors.primary,
                                          //   fontSize: 12.sp,
                                          //   fontWeight: FontWeight.w800,
                                          // ),),
                                          MyText(
                                            text: "\$${provider.total}.00",
                                            color: AppColors.primary,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        color: AppColors.border,
                                      ),
                                      Text(
                                        "Taxes may be estimates until order is created.",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                              color: AppColors.midDarkGrey,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 9.sp,
                                            ),
                                      ),
                                    ],
                                  ));
                            },
                          ),
                          2.height,
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: Obx(() {
                              return CustomButton(
                                label: isRejected.value == true
                                    ? "Rejected"
                                    : isAccepted.value == false
                                        ? "Accept Estimate"
                                        : "Choose Payment Method",
                                onPressed: () {
                                  if (isAccepted.value == false) {
                                    isAccepted.value = true;
                                  }
                                  if (isAccepted.value == true) {
                                    AppCustomNavigator.push(
                                        context, ChoosePaymentMethods());
                                  }
                                },
                              );
                            }),
                          ),
                          2.height,
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: CustomButton(
                              icon: AppSvgs.sms,
                              iconColor: AppColors.primary,
                              label: "Contact Seller",
                              onPressed: () {
                                AppCustomNavigator.push(
                                    context, ChatScreenMain());
                              },
                              labelFontSize: 13.sp,
                              backgroundColor: Colors.transparent,
                              foregroundColor: AppColors.primary,
                            ),
                          ),
                          4.height,
                        ],
                      ),
                    ),
                    Obx(
                      () => controller.isOpen.value == true
                          ? EstimateDetailPopUp(
                              onTap: () {
                                isRejected.value = true;
                                isAccepted.value = false;
                              },
                            )
                          : SizedBox.shrink(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showModalBottomSheet(
    BuildContext context,
  ) async {
    await showModalBottomSheet(
      backgroundColor: AppColors.white,
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.sp)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Padding(
              padding: EdgeInsets.fromLTRB(4.w, 2.h, 4.w, 2.h),
              child: Wrap(
                children: [
                  2.height,
                  Row(
                    children: [
                      CustomHeading(
                        title: "Request Details",
                        suffixText: '',
                        isSuffixSvg: false,
                        suffixSvg: AppSvgs.addNotes,
                        onTap: () {},
                        fontWeight: FontWeight.w600,
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset(
                          AppSvgs.closeCircle,
                          color: AppColors.primary,
                          height: 2.5.h,
                        ),
                      ),
                    ],
                  ),
                  6.height,
                  ViewRequestSheetDetail()
                ],
              ),
            );
          },
        );
      },
    );
  }
}
