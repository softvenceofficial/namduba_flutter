// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/add_vehicle/purchase_history/inspection_report.dart';

class JobDetailsWidget extends StatefulWidget {
  const JobDetailsWidget({super.key});

  @override
  State<JobDetailsWidget> createState() => _JobDetailsWidgetState();
}

class _JobDetailsWidgetState extends State<JobDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              children: [
                const CustomAppbar(
                  title: "Job Details",
                  centerTitle: true,
                ),
                2.height,
                CustomContainer(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "JOB-2003",
                              style: Textfontstyle.TextStyle14w400c212121poppins
                                  .copyWith(
                                      color: AppColors.textColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.sp),
                            ),
                            2.width,
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.green,
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(AppSvgs.minivan),
                                  1.width,
                                  Text(
                                    "Completed",
                                    style: Textfontstyle
                                            .TextStyle12w500c212121poppins
                                        .copyWith(color: AppColors.boxColor),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        .5.height,
                        Row(
                          children: [
                            Text("Created December 13, 2025 from ",
                                style: Textfontstyle
                                    .TextStyle12w500c212121poppins.copyWith(
                                  color: AppColors.midDarkGrey,
                                  fontSize: 10.sp,
                                )),
                            Text("ORD-12956",
                                style: Textfontstyle
                                    .TextStyle12w500c212121poppins.copyWith(
                                  color: AppColors.red,
                                  fontSize: 10.sp,
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                1.height,
                CustomContainer(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Suspension Repair",
                                  style: Textfontstyle
                                      .TextStyle14w400c212121poppins.copyWith(
                                    color: AppColors.textColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.sp,
                                  ),
                                ),
                                Text(
                                  "Marcedes Benz E300",
                                  style: Textfontstyle
                                      .TextStyle14w400c212121poppins.copyWith(
                                    color: AppColors.textColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 8.sp,
                                  ),
                                ),
                                Text(
                                  "ABH1235ZM",
                                  style: Textfontstyle
                                      .TextStyle14w400c212121poppins.copyWith(
                                    color: AppColors.arrowGrey,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 8.sp,
                                  ),
                                ),
                                1.height,
                                Text(
                                  "ODO",
                                  style: Textfontstyle
                                      .TextStyle14w400c212121poppins.copyWith(
                                    color: AppColors.arrowGrey,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 8.sp,
                                  ),
                                ),
                              ],
                            ),
                            SvgPicture.asset(
                              AppSvgs.carIcon,
                              height: 4.h,
                              width: 4.w,
                              color: AppColors.cCA2626,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "13,200 KM",
                              style: Textfontstyle.TextStyle14w400c212121poppins
                                  .copyWith(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 10.sp,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(const InspectionReport());
                              },
                              child: CustomContainer(
                                color: AppColors.cCA2626,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 2.0),
                                  child: Text(
                                    'view Inspection',
                                    style: Textfontstyle
                                        .TextStyle14w400c212121poppins.copyWith(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 8.sp,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                3.height,
                CustomContainer(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: AppColors.cCA2626.withAlpha(30),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: SvgPicture.asset(
                                AppSvgs.searchIcon,
                                height: 2.9.h,
                                width: 2.9.w,
                              ),
                            ),
                            2.width,
                            Text(
                              'Scope',
                              style: Textfontstyle.TextStyle14w400c212121poppins
                                  .copyWith(
                                color: AppColors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 11.sp,
                              ),
                            ),
                          ],
                        ),
                        SvgPicture.asset(AppSvgs.arrow_circle_down),
                      ],
                    ),
                  ),
                ),
                3.height,
                Row(
                  children: [
                    SvgPicture.asset(
                      AppSvgs.add,
                      color: AppColors.arrowGrey,
                    ),
                    0.5.width,
                    Text(
                      'Check noise from engine top',
                      style:
                          Textfontstyle.TextStyle14w400c212121poppins.copyWith(
                        color: AppColors.arrowGrey,
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      AppSvgs.add,
                      color: AppColors.arrowGrey,
                    ),
                    0.5.width,
                    Text(
                      'Perform routine engine service',
                      style:
                          Textfontstyle.TextStyle14w400c212121poppins.copyWith(
                        color: AppColors.arrowGrey,
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
                3.height,
                CustomContainer(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: AppColors.cCA2626.withAlpha(30),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: SvgPicture.asset(
                                AppSvgs.briefcase,
                                height: 2.9.h,
                                width: 2.9.w,
                              ),
                            ),
                            2.width,
                            Text(
                              'Works Carried Out',
                              style: Textfontstyle.TextStyle14w400c212121poppins
                                  .copyWith(
                                color: AppColors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 11.sp,
                              ),
                            ),
                          ],
                        ),
                        SvgPicture.asset(AppSvgs.arrow_circle_down),
                      ],
                    ),
                  ),
                ),
                3.height,
                Row(
                  children: [
                    SvgPicture.asset(
                      AppSvgs.add,
                      color: AppColors.arrowGrey,
                    ),
                    0.5.width,
                    Text(
                      'Replaced cabin filter',
                      style:
                          Textfontstyle.TextStyle14w400c212121poppins.copyWith(
                        color: AppColors.arrowGrey,
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      AppSvgs.add,
                      color: AppColors.arrowGrey,
                    ),
                    0.5.width,
                    Text(
                      'Replaced engine oil',
                      style:
                          Textfontstyle.TextStyle14w400c212121poppins.copyWith(
                        color: AppColors.arrowGrey,
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
                3.height,
                CustomContainer(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: AppColors.cCA2626.withAlpha(30),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: SvgPicture.asset(
                                AppSvgs.clipboard_tick,
                                height: 2.9.h,
                                width: 2.9.w,
                              ),
                            ),
                            2.width,
                            Text(
                              'Recommendations',
                              style: Textfontstyle.TextStyle14w400c212121poppins
                                  .copyWith(
                                color: AppColors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 11.sp,
                              ),
                            ),
                          ],
                        ),
                        SvgPicture.asset(AppSvgs.arrow_circle_down),
                      ],
                    ),
                  ),
                ),
                3.height,
                Row(
                  children: [
                    SvgPicture.asset(
                      AppSvgs.add,
                      color: AppColors.arrowGrey,
                    ),
                    0.5.width,
                    Text(
                      'Replaced the spark plugs',
                      style:
                          Textfontstyle.TextStyle14w400c212121poppins.copyWith(
                        color: AppColors.arrowGrey,
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      AppSvgs.add,
                      color: AppColors.arrowGrey,
                    ),
                    0.5.width,
                    Text(
                      'Replaced the air filter',
                      style:
                          Textfontstyle.TextStyle14w400c212121poppins.copyWith(
                        color: AppColors.arrowGrey,
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
                2.height,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Next Service',
                      style:
                          Textfontstyle.TextStyle14w400c212121poppins.copyWith(
                        color: AppColors.arrowGrey,
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ),
                2.height,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Date',
                            style: Textfontstyle.TextStyle14w400c212121poppins
                                .copyWith(
                              color: AppColors.arrowGrey,
                              fontWeight: FontWeight.w600,
                              fontSize: 8.sp,
                            ),
                          ),
                          Text(
                            '31 Dec 2025',
                            style: Textfontstyle.TextStyle14w400c212121poppins
                                .copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                              fontSize: 10.sp,
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mileage',
                            style: Textfontstyle.TextStyle14w400c212121poppins
                                .copyWith(
                              color: AppColors.arrowGrey,
                              fontWeight: FontWeight.w600,
                              fontSize: 8.sp,
                            ),
                          ),
                          Text(
                            '16,000 KM',
                            style: Textfontstyle.TextStyle14w400c212121poppins
                                .copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                              fontSize: 10.sp,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                2.height,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sign off',
                        style: Textfontstyle.TextStyle14w400c212121poppins
                            .copyWith(
                          color: AppColors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: EdgeInsets.all(8),
                        child: Text(
                          'Accept',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 8.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                1.height,
                CustomContainer(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Accepted',
                                style: Textfontstyle
                                    .TextStyle12w500c212121poppins.copyWith(
                                  color: AppColors.black,
                                  fontSize: 10.sp,
                                )),
                            Text('12 Dec 2025',
                                style: Textfontstyle
                                    .TextStyle12w500c212121poppins.copyWith(
                                  color: AppColors.primary,
                                  fontSize: 10.sp,
                                )),
                          ],
                        ),
                        Divider(
                          color: AppColors.lightGrey,
                        ),
                        Text('Notes',
                            style: Textfontstyle.TextStyle12w500c212121poppins
                                .copyWith(
                              color: AppColors.black,
                              fontSize: 10.sp,
                            )),
                        1.height,
                        Text('I am happy with the work done',
                            style: Textfontstyle.TextStyle12w500c212121poppins
                                .copyWith(
                              color: AppColors.arrowGrey,
                              fontSize: 10.sp,
                            )),
                      ],
                    ),
                  ),
                ),
                1.height,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Follow up jobs',
                      style:
                          Textfontstyle.TextStyle14w400c212121poppins.copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ),
                1.height,
                CustomContainer(
                    child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Brake repairs',
                            style: Textfontstyle.TextStyle12w500c212121poppins
                                .copyWith(
                              color: AppColors.textColor,
                              fontSize: 10.sp,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'ORD-12958',
                                style: Textfontstyle
                                    .TextStyle12w500c212121poppins.copyWith(
                                  color: AppColors.arrowGrey,
                                  fontSize: 10.sp,
                                ),
                              ),
                              SvgPicture.asset(AppSvgs.arrowCircleRight),
                            ],
                          ),
                        ],
                      ),
                      Divider(
                        color: AppColors.lightGrey,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Brake repairs',
                            style: Textfontstyle.TextStyle12w500c212121poppins
                                .copyWith(
                              color: AppColors.textColor,
                              fontSize: 10.sp,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'ORD-12958',
                                style: Textfontstyle
                                    .TextStyle12w500c212121poppins.copyWith(
                                  color: AppColors.arrowGrey,
                                  fontSize: 10.sp,
                                ),
                              ),
                              SvgPicture.asset(AppSvgs.arrowCircleRight),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
