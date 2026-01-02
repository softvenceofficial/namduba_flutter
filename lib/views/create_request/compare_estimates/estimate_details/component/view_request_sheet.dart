import 'package:flutter/material.dart';
import 'package:nanduba/widgets/core/my_text.dart';

import '../../../../../export.dart';
import '../../../../../providers/estimate_provider.dart';

class ViewRequestSheetDetail extends StatelessWidget {
  const ViewRequestSheetDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // MyText(
              //   text: "Request #505",
              //         color: AppColors
              //             .textColor,
              //         fontSize: 14.sp,
              //         fontWeight:
              //         FontWeight.w600
              //
              // ),
              MyText(
                  text: "Request number",
                  color: AppColors.grey,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400),
              MyText(
                  text: "562",
                  color: AppColors.textColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500),
              MyText(
                  text: "Request date",
                  color: AppColors.grey,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400),
              MyText(
                  text: "March 12, 2024",
                  color: AppColors.textColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500),
              // 1.height,
            ],
          ),
        ),
        Consumer<EstimateProvider>(builder: (context, provider, child) {
          return ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              // padding: EdgeInsets.symmetric(vertical: 1.h),
              itemCount: provider.services.length,
              itemBuilder: (context, index) {
                final data = provider.services[index];
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 3.w,
                  ),
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
                              text:
                                  "${data['service']} (${data['vehicles'].length})",
                              color: AppColors.textColor3,
                              fontWeight: FontWeight.w500,
                              fontSize: 10.sp),
                          Spacer(),
                          GestureDetector(
                              onTap: () {
                                provider.toggle(index);
                              },
                              child: Icon(
                                provider.isExpanded == index
                                    ? Icons.keyboard_arrow_down_rounded
                                    : Icons.keyboard_arrow_up_rounded,
                                color: Colors.black,
                                size: 30,
                              )),
                        ],
                      ),
                      if (provider.isExpanded == index)
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(
                              data['vehicles'].length,
                              (vehicleindex) => Column(
                                children: [
                                  MyText(
                                      text: data['vehicles'][vehicleindex],
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
              });
        }),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Column(
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
        )
      ],
    );
  }
}
