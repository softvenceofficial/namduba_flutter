import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanduba/export.dart';

import '../../../constants/colors.dart';
import '../../../controllers/inspection_report_controller.dart';
import '../../../widgets/core/my_text.dart';

class BasicReport extends StatefulWidget {
  const BasicReport({super.key});

  @override
  State<BasicReport> createState() => _BasicReportState();
}

class _BasicReportState extends State<BasicReport> {

  final InspectionReportController inspectionVM =
  Get.find<InspectionReportController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              children: [
                myAppBar(title: "Vehicle Inspection Report", icon: null, columnText: "Basic", textColumn: true,),
                2.height,
                CustomContainer(
                  hpadding: 4.w,
                  vpadding: 2.h,
                  borderRadius: 20,
                  child: Column(
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
                                  text: "2023 Mercedes-Benz S-Class",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.sp,
                                ),
                                1.height,
                                MyText(
                                  text: "Created on Jan 18, 2024",
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText(
                                text: "ODO",
                                fontWeight: FontWeight.w400,
                                fontSize: 9.5.sp,
                                color: AppColors.midDarkGrey,
                              ),
                              0.6.height,
                              MyText(
                                text: "13,200 KM",
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                                color: AppColors.black,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                2.height,
                Align(
                  alignment: Alignment.centerLeft,
                  child: MyText(
                    text: "Results",
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),
                2.height,
                Obx(
                      () => ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: inspectionVM.basicResult.length,
                    itemBuilder: (context, index) {
                      // Determine the correct check list based on the current index
                      RxList<Map<String, dynamic>> currentCheckList;

                      if (index == 0) {
                        currentCheckList = inspectionVM.interiorCheck;
                      } else if (index == 1) {
                        currentCheckList = inspectionVM.exteriorCheck;
                      } else if (index == 2) {
                        currentCheckList = inspectionVM.engineCheck;
                      } else {
                        currentCheckList = inspectionVM.roadworthinessCheck;
                      }

                      return Container(
                        margin: EdgeInsets.only(top: index == 0 ? 0 : 2.h),
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(28, 28, 28, 0.1),
                              offset: Offset(0, 2),
                              blurRadius: 20,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 5.h,
                                  width: 5.h,
                                  decoration: BoxDecoration(
                                    color: AppColors.secondary,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SvgPicture.asset(
                                      inspectionVM.basicResultIcons[index],
                                      color: AppColors.primary,
                                      height: 1.h,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              inspectionVM.basicResult[index],
                                              style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromRGBO(31, 31, 31, 1),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 8.0),
                                  child: InkWell(
                                    onTap: () {
                                      // Handle toggle logic for each index
                                    //  inspectionVM.toggleExpanded(index);
                                    },
                                    child: Obx(() {
                                      // Determine the icon based on expanded state
                                      // final isExpanded = inspectionVM.expandedStates[index] ?? false;
                                      final isExpanded = inspectionVM.expandedStates[index] ?? false;
                                      return SvgPicture.asset(
                                         AppSvgs.arrow_circle_down,
                                        color:  AppColors.arrowGrey,
                                        height: 2.2.h,
                                      );
                                    }),
                                  ),
                                ),
                              ],
                            ),
                            // Obx(
                            //       () => (inspectionVM.expandedStates[index] ?? false)
                            //       ? Padding(
                            //     padding: EdgeInsets.only(top: 2.0.h),
                            //     child: ListView.builder(
                            //       shrinkWrap: true,
                            //       padding: EdgeInsets.zero,
                            //       itemCount: currentCheckList.length,
                            //       itemBuilder: (context, subIndex) {
                            //         return Padding(
                            //           padding: EdgeInsets.symmetric(horizontal: 8),
                            //           child: Column(
                            //             children: [
                            //               if (subIndex != 0)
                            //                 Padding(
                            //                   padding: EdgeInsets.only(bottom: 2.h),
                            //                   child: Divider(
                            //                     thickness: 0.5,
                            //                     color: AppColors.border,
                            //                     height: 0.5,
                            //                   ),
                            //                 ),
                            //               Row(
                            //                 crossAxisAlignment: CrossAxisAlignment.center,
                            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //                 children: [
                            //                   SizedBox(
                            //                     child: Row(
                            //                       children: [
                            //                         CircleAvatar(
                            //                           radius: 1.h,
                            //                           backgroundColor: currentCheckList[subIndex]["working"]
                            //                               ? AppColors.greenicon
                            //                               : Colors.red, // Use red color if not working
                            //                           child: Icon(
                            //                             currentCheckList[subIndex]["working"]
                            //                                 ? Icons.check
                            //                                 : Icons.close,
                            //                             color: Colors.white,
                            //                             size: 10,
                            //                           ),
                            //                         ),
                            //                         SizedBox(width: 8),
                            //                         Text(
                            //                           currentCheckList[subIndex]["property"],
                            //                           style: TextStyle(
                            //                             fontSize: 10.sp,
                            //                             fontWeight: FontWeight.w500,
                            //                             color: AppColors.textColor,
                            //                           ),
                            //                         ),
                            //                       ],
                            //                     ),
                            //                   ),
                            //                   SvgPicture.asset(
                            //                     AppSvgs.arrowCircleRight,
                            //                     color: AppColors.arrowGrey,
                            //                     height: 2.2.h,
                            //                   ),
                            //                 ],
                            //               ),
                            //               if (subIndex != currentCheckList.length - 1)
                            //                 Padding(
                            //                   padding: EdgeInsets.only(top: 2.h),
                            //                   child: Divider(
                            //                     thickness: 0.5,
                            //                     color: AppColors.border,
                            //                     height: 0.5,
                            //                   ),
                            //                 ),
                            //             ],
                            //           ),
                            //         );
                            //       },
                            //     ),
                            //   )
                            //       : SizedBox.shrink(),
                            // ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                2.height,
                Align(
                  alignment: Alignment.centerLeft,
                  child: MyText(
                    text: "Additional Info",
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),
                2.height,
                CustomContainer(
                  hpadding: 4.w,
                  vpadding: 2.h,
                  borderRadius: 20,
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyText(
                              text: "Next Services",
                              fontWeight: FontWeight.w600,
                              fontSize: 12.sp,
                              color: AppColors.textColor,
                            ),
                            MyText(
                              text: "16,000 KM",
                              fontWeight: FontWeight.w600,
                              fontSize: 12.sp,
                              color: AppColors.primary,
                            ),
                          ],
                        ),
                        2.4.height,
                        Divider(
                          thickness: 0.5,
                          color: AppColors.border,
                          height: 0.5,
                        ),
                        2.height,
                        Align(
                          alignment: Alignment.centerLeft,
                          child: MyText(
                            text: "Notes",
                            fontWeight: FontWeight.w600,
                            fontSize: 12.sp,
                          ),
                        ),
                        1.5.height,
                        MyText(
                          text: "Lorem ipsum is a placeholder text use to demonstrate the visual form of a document or a typeface without relying on meaningful content.",
                          fontWeight: FontWeight.w400,
                          fontSize: 10.sp,
                          color: AppColors.midGrey,
                        ),
                      ],
                    )
                ),
                2.height
              ],
            ),
          ),
        ),
      ),
    );
  }
}
