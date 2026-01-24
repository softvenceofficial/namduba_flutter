// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, prefer_const_constructors

import 'package:get/get.dart';
import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/providers/estimate_provider.dart';
import 'package:nanduba/views/create_request/compare_estimates/estimate_details/component/view_request_sheet.dart';
import 'package:nanduba/views/create_request/compare_estimates/request_estimate_item_detail/marin_insuranse_screen.dart';
import 'package:nanduba/views/create_request/compare_estimates/request_estimate_item_detail/motor_insurance_screen.dart';
import 'package:nanduba/views/create_request/compare_estimates/request_estimate_item_detail/plant_insurance_screen.dart';
import 'package:nanduba/views/create_request/compare_estimates/request_estimate_item_detail/road_tax_screen.dart';
import 'package:nanduba/views/create_request/payment_methods/choose_payment_methods.dart';
import 'package:nanduba/views/inbox/chat_screen/chat_screen.dart';
import 'package:nanduba/widgets/core/my_text.dart';
import '../../../../controllers/vehicle_profile_controller.dart';
import 'component/estimate_details_pop_up.dart';

// ignore: must_be_immutable
class EstimateDetails extends StatelessWidget {
  final VehicleProfileController controller = Get.find();
  RxBool isAccepted = false.obs;
  RxBool isRejected = false.obs;

  EstimateDetails({super.key});

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
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 4.w,
                ),
                child: CustomAppbar(title: 'Estimates Details', isPop: true),
              ),
              // 2.height,
              // Padding(
              //   padding: EdgeInsets.symmetric(
              //     horizontal: 4.w,
              //   ),
              //   child: CustomAppbar(
              //     title: "Estimates Details",
              //     isPop: true,
              //     isSearch: false,
              //     isRequestAdd: false,
              //     toggleIcon: AppImages.toggle,
              //     // Replace with your toggle image path
              //     onTogglePressed: () {
              //       controller.showPopUp();
              //     },
              //   ),
              // ),
              1.height,
              Expanded(
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.0,
                              vertical: 5.0,
                            ),
                            child: CustomContainer(
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          AppImages.carImage,
                                          height: 24,
                                          width: 24,
                                        ),
                                        1.width,
                                        Text(
                                          'Multive Insurance',
                                          style: Textfontstyle
                                                  .TextStyle14w400c212121poppins
                                              .copyWith(
                                            color: AppColors.black,
                                            fontSize: 10.sp,
                                          ),
                                        )
                                      ],
                                    ),
                                    Text(
                                      '4.5 Insurer',
                                      style: Textfontstyle
                                              .TextStyle14w400c212121poppins
                                          .copyWith(
                                        color: AppColors.black,
                                        fontSize: 6.sp,
                                      ),
                                    ),
                                    Divider(
                                      color: AppColors.border,
                                    ),
                                    Text(
                                      'Total',
                                      style: Textfontstyle
                                              .TextStyle14w400c212121poppins
                                          .copyWith(
                                        color: AppColors.black,
                                        fontSize: 6.sp,
                                      ),
                                    ),
                                    Text(
                                      'ZMW 18,000',
                                      style: Textfontstyle
                                              .TextStyle14w400c212121poppins
                                          .copyWith(
                                        color: AppColors.black,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'February 20, 2024 at 5:35 pm',
                                      style: Textfontstyle
                                              .TextStyle14w400c212121poppins
                                          .copyWith(
                                        color: AppColors.black,
                                        fontSize: 6.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          0.2.height,
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.0,
                              vertical: 5.0,
                            ),
                            child: CustomContainer(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20.0,
                                  vertical: 15.0,
                                ),
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      behavior: HitTestBehavior.translucent,
                                      onTap: () {
                                        AppCustomNavigator.push(
                                            context,
                                            EstimateServiceItemDetails(
                                              estimateDetail: '',
                                            ));
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: Image.asset(
                                                  AppImages.owner,
                                                  height: 54,
                                                  width: 54,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              3.width,
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Motor Insurance ',
                                                    style: Textfontstyle
                                                            .TextStyle14w400c212121poppins
                                                        .copyWith(
                                                      color: AppColors.black,
                                                      fontSize: 8.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    '2 vehicles covered',
                                                    style: Textfontstyle
                                                            .TextStyle14w400c212121poppins
                                                        .copyWith(
                                                      color:
                                                          AppColors.arrowGrey,
                                                      fontSize: 8.sp,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                '\$800',
                                                style: Textfontstyle
                                                        .TextStyle14w400c212121poppins
                                                    .copyWith(
                                                  color: AppColors.black,
                                                  fontSize: 8.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Icon(
                                                Icons.arrow_forward_ios,
                                                color: AppColors.black,
                                                size: 10.sp,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(),
                                    GestureDetector(
                                      behavior: HitTestBehavior.translucent,
                                      onTap: () {
                                        AppCustomNavigator.push(
                                            context, PlantInsuranceScreen());
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: Image.asset(
                                                  AppImages.owner,
                                                  height: 54,
                                                  width: 54,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              3.width,
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Plant Insurance ',
                                                    style: Textfontstyle
                                                            .TextStyle14w400c212121poppins
                                                        .copyWith(
                                                      color: AppColors.black,
                                                      fontSize: 8.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    '3 vehicles covered',
                                                    style: Textfontstyle
                                                            .TextStyle14w400c212121poppins
                                                        .copyWith(
                                                      color:
                                                          AppColors.arrowGrey,
                                                      fontSize: 8.sp,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                '\$800',
                                                style: Textfontstyle
                                                        .TextStyle14w400c212121poppins
                                                    .copyWith(
                                                  color: AppColors.black,
                                                  fontSize: 8.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Icon(
                                                Icons.arrow_forward_ios,
                                                color: AppColors.black,
                                                size: 10.sp,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(),
                                    GestureDetector(
                                      behavior: HitTestBehavior.translucent,
                                      onTap: () {
                                        AppCustomNavigator.push(
                                            context, MarinInsuranseScreen());
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: Image.asset(
                                                  AppImages.owner,
                                                  height: 54,
                                                  width: 54,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              3.width,
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Marine Insurance ',
                                                    style: Textfontstyle
                                                            .TextStyle14w400c212121poppins
                                                        .copyWith(
                                                      color: AppColors.black,
                                                      fontSize: 8.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    '1 consignment ',
                                                    style: Textfontstyle
                                                            .TextStyle14w400c212121poppins
                                                        .copyWith(
                                                      color:
                                                          AppColors.arrowGrey,
                                                      fontSize: 8.sp,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                '\$800',
                                                style: Textfontstyle
                                                        .TextStyle14w400c212121poppins
                                                    .copyWith(
                                                  color: AppColors.black,
                                                  fontSize: 8.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Icon(
                                                Icons.arrow_forward_ios,
                                                color: AppColors.black,
                                                size: 10.sp,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(),
                                    GestureDetector(
                                      behavior: HitTestBehavior.translucent,
                                      onTap: () {
                                        AppCustomNavigator.push(
                                            context, RoadTaxScreen());
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: Image.asset(
                                                  AppImages.owner,
                                                  height: 54,
                                                  width: 54,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              3.width,
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Road Tax',
                                                    style: Textfontstyle
                                                            .TextStyle14w400c212121poppins
                                                        .copyWith(
                                                      color: AppColors.black,
                                                      fontSize: 8.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    '3 vehicles  ',
                                                    style: Textfontstyle
                                                            .TextStyle14w400c212121poppins
                                                        .copyWith(
                                                      color:
                                                          AppColors.arrowGrey,
                                                      fontSize: 8.sp,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                '\$800',
                                                style: Textfontstyle
                                                        .TextStyle14w400c212121poppins
                                                    .copyWith(
                                                  color: AppColors.black,
                                                  fontSize: 8.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Icon(
                                                Icons.arrow_forward_ios,
                                                color: AppColors.black,
                                                size: 10.sp,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
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
                                          const Spacer(),
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
                                      const Divider(
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
                                          const Spacer(),
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
                                      const Divider(
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
                                      const Divider(
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
                          : const SizedBox.shrink(),
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
                      const Spacer(),
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
                  const ViewRequestSheetDetail()
                ],
              ),
            );
          },
        );
      },
    );
  }
}
