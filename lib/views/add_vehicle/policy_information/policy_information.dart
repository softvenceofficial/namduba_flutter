import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/add_vehicle/policy_information/component/policy_pop_up_menu.dart';
import 'package:nanduba/views/add_vehicle/policy_information/coverages/coverages.dart';
import 'package:nanduba/views/add_vehicle/policy_information/policy_details.dart';
import 'package:nanduba/views/add_vehicle/policy_information/transactions/transactions.dart';
import 'package:nanduba/views/add_vehicle/purchase_history/basic_report.dart';
import '../../../widgets/core/my_text.dart';

class PolicyInformation extends StatelessWidget {
  RxBool showPopUp = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: GestureDetector(
              onTap: () {
                if (showPopUp.value == true) {
                  showPopUp.value = false;
                }
              },
              child: Stack(
                children: [
                  Column(
                    children: [
                      1.height,
                      CustomAppbar(
                        title: "Policy Information",
                        isRequestAdd: true,
                        onAddButtonTap: () {
                          showPopUp.value = !showPopUp.value;
                        },
                      ),
                      2.height,
                      GestureDetector(
                        onTap: () {},
                        child: CustomContainer(
                          hpadding: 4.w,
                          vpadding: 2.h,
                          borderRadius: 20,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        MyText(
                                          text: "Hollard Insurance",
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12.sp,
                                        ),
                                        1.height,
                                        MyText(
                                          text: "Insurer",
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10.sp,
                                          color: AppColors.grey,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              2.height,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyText(
                                    text: "Policy Number",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10.sp,
                                    color: AppColors.midDarkGrey,
                                  ),
                                  0.6.height,
                                  MyText(
                                    text: "PLN 2316170 / CUSG / 2024",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.sp,
                                    color: AppColors.black,
                                  ),
                                  1.5.height,
                                  Row(
                                    children: [
                                      PolicyInfoRow(
                                          title: "PLan",
                                          detail: "Motor Insurance"),
                                      Spacer(),
                                      PolicyInfoRow(
                                          title: "Premium",
                                          detail: "\$268/ Annual")
                                    ],
                                  ),
                                  1.5.height,
                                  Row(
                                    children: [
                                      PolicyInfoRow(
                                          title: "Start Date",
                                          detail: "30 Sep 2023"),
                                      Spacer(),
                                      PolicyInfoRow(
                                          title: "Expiry",
                                          detail: "30 Sep 2024")
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      2.height,
                      Align(
                        alignment: Alignment.centerLeft,
                        child: MyText(
                          text: "Further information",
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                        ),
                      ),
                      2.height,
                      PolicyFurtherInfoContainer(
                        text: "Coverage",
                        icon: AppSvgs.sheild,
                        onTap: () {
                          AppCustomNavigator.push(context, Coverages());
                        },
                      ),
                      // PolicyFurtherInfoContainer(text: "Insured Vehicles",icon: AppSvgs.carIcon,),
                      PolicyFurtherInfoContainer(
                        text: "Transactions",
                        icon: AppSvgs.transaction,
                        onTap: () {
                          AppCustomNavigator.push(context, Transactions());
                        },
                      ),
                      PolicyFurtherInfoContainer(
                        text: "Policy Details",
                        icon: AppSvgs.addNotes,
                        onTap: () {
                          AppCustomNavigator.push(context, PolicyDetails());
                        },
                      ),
                      PolicyFurtherInfoContainer(
                        text: "Policy Documents",
                        icon: AppSvgs.addNotes,
                        onTap: () {
                          AppCustomNavigator.push(context, PolicyDetails());
                        },
                      ),
                      // PolicyFurtherInfoContainer(text: "File a Claim",icon: AppSvgs.fileclaim,),

                      4.height
                    ],
                  ),
                  Obx(() {
                    return PolicyPopUpMenu(
                      isOpen: showPopUp.value,
                    );
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PolicyFurtherInfoContainer extends StatelessWidget {
  final String text;
  final String icon;
  final void Function()? onTap;

  const PolicyFurtherInfoContainer(
      {super.key, required this.text, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomContainer(
        borderRadius: 5.w,
        vMargin: 1.h,
        hpadding: 3.w,
        vpadding: 1.1.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // height: 5.5.h,
              // width: 10.5.w,
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(12)),
              child: Center(
                  child: SvgPicture.asset(
                icon,
                color: AppColors.primary,
              )),
            ),
            3.width,
            MyText(
              text: text,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.textColor,
            ),
            Spacer(),
            SvgPicture.asset(AppSvgs.arrowCircleRight)
          ],
        ),
      ),
    );
  }
}

class PolicyInfoRow extends StatelessWidget {
  final String title;
  final String detail;

  const PolicyInfoRow({super.key, required this.title, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          text: title,
          fontWeight: FontWeight.w400,
          fontSize: 10.sp,
          color: AppColors.midDarkGrey,
        ),
        0.6.height,
        MyText(
          text: detail,
          fontWeight: FontWeight.w500,
          fontSize: 12.sp,
          color: AppColors.black,
        ),
      ],
    );
  }
}
