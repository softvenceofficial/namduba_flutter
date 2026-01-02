import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/add_vehicle/policy_information/claims/widget/document_container_reuse.dart';
import 'package:nanduba/views/add_vehicle/policy_information/claims/widget/reuse_claim_detail_row.dart';
import 'package:nanduba/views/add_vehicle/policy_information/coverages/component/collision_coverage.dart';
import 'package:nanduba/views/add_vehicle/policy_information/coverages/component/comprehensive_coverage.dart';
import 'package:nanduba/views/add_vehicle/policy_information/coverages/vehicle_coverage.dart';
import 'package:nanduba/views/add_vehicle/policy_information/transactions/component/payments_list.dart';
import 'package:nanduba/views/add_vehicle/purchase_history/basic_report.dart';
import 'package:nanduba/views/add_vehicle/vehicle_profile/component/upload_image_container.dart';
import '../../../../widgets/core/my_text.dart';

class ClaimDetails extends StatefulWidget {
  @override
  State<ClaimDetails> createState() => _ClaimDetailsState();
}

class _ClaimDetailsState extends State<ClaimDetails> {
  int selectedButtonIndex = 1;
  List<dynamic> history = [
    {"date": "16 August", "text": "Return Started"},
    {"date": "27 July", "text": "Delivered"},
    {"date": "25 July", "text": "Item Purchased"}
  ];
  bool _isExpanded = false;

  final Map<String, String> claimDetails = {
    'Claim Number': 'LUS 2090 / CAS',
    'Insurer': 'Hallord Insurance',
    'Claim Type': 'Single Vehicle Accident Claim',
    'Vehicle': '2024 BMW x 3 ALP 1212',
    'Incident Type': 'Accident',
    'Incident Date': '25 August 2024',
    'Incident Location': '26 Melbourne Street, USA',
    'Incident Details':
        'Was crossing road then vehicle hit me from the back and damaged my boot'
  };

  final List<String> claimFor = [
    'Own Vehicle Damage',
    'Third Party Property Damage',
    'Covering Vehicle',
    'Towing',
  ];

  final List<String> documentIcons = [
    'Policy Report',
    'Driver License',
  ];

  void toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            1.height,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: CustomAppbar(
                title: "Claim Details",
                toggleIcon: AppImages.toggle,
              ),
            ),
            1.height,
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        1.height,
                        CustomContainer(
                            hpadding: 4.w,
                            vpadding: 2.h,
                            vMargin: 1.h,
                            borderRadius: 20,
                            child: Column(
                              children: [
                                ReuseClaimDetailRow(
                                    icon: AppSvgs.notification,
                                    title: "Your Claim is cancelled",
                                    description: "Loream Ipsum",
                                    buttonText: ''),
                                2.5.height,
                                ReuseClaimDetailRow(
                                  icon: AppSvgs.dollar2,
                                  title: "Your Total Excess",
                                  description: "\$500.00",
                                  buttonText: "Pay Now",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.sp,
                                  height: 0.5,
                                ),
                              ],
                            )),
                        1.height,
                        CustomContainer(
                          hpadding: 4.w,
                          vpadding: 2.h,
                          borderRadius: 20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  MyText(
                                    text: "Claim #264566",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 0.6.h, horizontal: 2.w),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: AppColors.greenicon,
                                        borderRadius:
                                            BorderRadius.circular(10.sp)),
                                    child: FittedBox(
                                      child: MyText(
                                        text: "Open",
                                        color: AppColors.white,
                                        fontSize: 8.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              1.height,
                              MyText(
                                text: "Hallord Zombia LTD",
                                fontWeight: FontWeight.w500,
                                fontSize: 10.sp,
                                color: AppColors.grey,
                              ),
                              1.height,
                              MyText(
                                text: "February 13, 2024 at 5:36 PM",
                                fontWeight: FontWeight.w500,
                                fontSize: 10.sp,
                                color: AppColors.grey,
                              ),
                              1.height,
                              GestureDetector(
                                onTap: () {
                                  _showModalBottomSheet(context);
                                },
                                child: MyText(
                                  text: "View Details",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10.sp,
                                  color: AppColors.primary,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                        2.height,
                        CustomContainer(
                          hpadding: 4.w,
                          vpadding: 2.h,
                          borderRadius: 20,
                          child: Row(
                            children: [
                              Container(
                                // height: 58,
                                // width: 58,
                                alignment: Alignment.center,
                                // // margin: EdgeInsets.only(right: 15),
                                padding: EdgeInsets.all(13),
                                decoration: BoxDecoration(
                                  color: AppColors.secondary,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: SvgPicture.asset(
                                  AppSvgs.sheild,
                                  color: AppColors.primary,
                                  height: 3.h,
                                ),
                              ),
                              3.width,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyText(
                                    text:
                                        "Your claim is being handled\nby Desomd J.",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10.sp,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 0.6.h, horizontal: 2.w),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: AppColors.greenicon,
                                        borderRadius:
                                            BorderRadius.circular(10.sp)),
                                    child: FittedBox(
                                      child: MyText(
                                        text: "Contact",
                                        color: AppColors.white,
                                        fontSize: 8.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        2.height,
                        CustomContainer(
                          hpadding: 4.w,
                          vpadding: 2.5.h,
                          borderRadius: 20,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(108, 204, 52, 1),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 4.0),
                                      child: Row(children: [
                                        Image.asset(
                                          AppImages.truck,
                                          height: 1.2.h,
                                        ),
                                        Text(
                                          ' Fulfilled',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              fontSize: 8.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 1),
                                            ),
                                          ),
                                        ),
                                      ]),
                                    ),
                                  )
                                ],
                              ),
                              0.5.height,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'February 14, 2024 at 6:30 am - 4517 Washington',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 9.sp,
                                          color:
                                              Color.fromRGBO(159, 159, 159, 1),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              1.height,
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                        width: 1,
                                        color:
                                            Color.fromRGBO(235, 223, 224, 1)),
                                  ),
                                  child: Theme(
                                    data: Theme.of(context).copyWith(
                                        dividerColor: Colors
                                            .transparent), // Removes the divider line
                                    child: ExpansionTile(
                                      tilePadding: EdgeInsets.symmetric(
                                          horizontal: 15.0),
                                      collapsedBackgroundColor:
                                          Colors.transparent,
                                      backgroundColor: Colors.transparent,
                                      title: Text('Document'),
                                      trailing: Icon(Icons.keyboard_arrow_right,
                                          size: 4.h),
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15.0),
                                          child: Text(
                                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque nisl eros, '
                                            'pulvinar facilisis justo mollis, auctor consequat urna. Morbi a bibendum metus. '
                                            'Donec scelerisque sollicitudin enim eu venenatis. Duis tincidunt laoreet ex, '
                                            'in pretium orci vestibulum eget.',
                                            style: TextStyle(
                                                color: Colors.black54),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                        width: 1,
                                        color:
                                            Color.fromRGBO(235, 223, 224, 1)),
                                  ),
                                  child: Theme(
                                    data: Theme.of(context).copyWith(
                                        dividerColor: Colors
                                            .transparent), // Removes the divider line
                                    child: ExpansionTile(
                                      tilePadding: EdgeInsets.symmetric(
                                          horizontal: 15.0),
                                      collapsedBackgroundColor:
                                          Colors.transparent,
                                      backgroundColor: Colors.transparent,
                                      title: Text('Reports'),
                                      trailing: Icon(Icons.keyboard_arrow_right,
                                          size: 4.h),
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15.0),
                                          child: Text(
                                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque nisl eros, '
                                            'pulvinar facilisis justo mollis, auctor consequat urna. Morbi a bibendum metus. '
                                            'Donec scelerisque sollicitudin enim eu venenatis. Duis tincidunt laoreet ex, '
                                            'in pretium orci vestibulum eget.',
                                            style: TextStyle(
                                                color: Colors.black54),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              2.height,
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 8.h,
                                            width: 15.w,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(2.w),
                                            ),
                                            child: Image.asset(
                                              AppImages.Registration,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          SizedBox(width: 2.w),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    MyText(
                                                      text:
                                                          'Own Coverage Claim',
                                                      color:
                                                          AppColors.textColor,
                                                      fontSize: 11.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                    Image.asset(
                                                        AppImages.toggle,
                                                        height: 20,
                                                        width: 20),
                                                  ],
                                                ),
                                                MyText(
                                                  text: "Quantity 1",
                                                  color: Color.fromRGBO(
                                                      159, 159, 159, 1),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 10.sp,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: toggleExpand,
                                                      child: Row(
                                                        children: [
                                                          Icon(Icons
                                                              .keyboard_arrow_down_outlined)
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      if (_isExpanded) ...[
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 1.h),
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                  color: Color.fromRGBO(
                                                      235, 223, 224, 1),
                                                  width:
                                                      1.0), // Baby pink color
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                MyText(
                                                  text: '2019 BMW x 3',
                                                  color: AppColors.textColor,
                                                  fontSize: 11.sp,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                MyText(
                                                  text: ' ACJ 1827',
                                                  color: AppColors.grey,
                                                  fontSize: 11.sp,
                                                ),
                                              ],
                                            ),
                                            Image.asset(
                                              AppImages.arrow_circle_right,
                                              height: 5.h,
                                              width: 5.w,
                                            )
                                          ],
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 1.h),
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                  color: Color.fromRGBO(
                                                      235, 223, 224, 1),
                                                  width:
                                                      1.0), // Baby pink color
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                MyText(
                                                  text: '2022 Toyota',
                                                  color: AppColors.textColor,
                                                  fontSize: 11.sp,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                MyText(
                                                  text: ' ACJ 1840',
                                                  color: AppColors.grey,
                                                  fontSize: 11.sp,
                                                ),
                                              ],
                                            ),
                                            Image.asset(
                                              AppImages.arrow_circle_right,
                                              height: 5.h,
                                              width: 5.w,
                                            )
                                          ],
                                        ),
                                      ],
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        2.height,
                        MyText(
                          text: "History",
                          fontWeight: FontWeight.w600,
                          fontSize: 15.sp,
                          color: AppColors.textColor,
                        ),
                        1.5.height,
                        CustomContainer(
                          hpadding: 4.w,
                          vpadding: 1.5.h,
                          borderRadius: 20,
                          child: Column(
                              children: List.generate(
                                  history.length,
                                  (index) => Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 0.5.h),
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 5,
                                              width: 5,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppColors.primary,
                                              ),
                                            ),
                                            2.width,
                                            MyText(
                                              text: history[index]['date']
                                                  .toString(),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 10.sp,
                                              color: AppColors.textColor3,
                                            ),
                                            Spacer(),
                                            MyText(
                                              text: history[index]['text']
                                                  .toString(),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 10.sp,
                                              color: AppColors.textColor,
                                            ),
                                          ],
                                        ),
                                      ))),
                        ),
                        2.height,
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _showModalBottomSheet(BuildContext context) async {
    await showModalBottomSheet(
      backgroundColor: AppColors.white,
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.sp)),
      ),
      builder: (BuildContext context) {
        return SafeArea(
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setModalState) {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        3.height,
                        // Claim details header
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Claim Details',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                              onTap: () {
                                AppCustomNavigator.pop(context);
                              },
                              child: SvgPicture.asset(
                                AppSvgs.closeCircle,
                                color: AppColors.primary,
                                height: 2.5.h,
                              ),
                            ),
                          ],
                        ),
                        2.height,

                        // First Row: Claim Number and Insurer
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: _buildDetailItem(
                                title: 'Claim Number',
                                value: claimDetails['Claim Number']!,
                              ),
                            ),
                            4.width,
                            Expanded(
                              child: _buildDetailItem(
                                title: 'Insurer',
                                value: claimDetails['Insurer']!,
                              ),
                            ),
                          ],
                        ),
                        1.5.height,

                        // Second Row: Claim Type
                        _buildDetailItem(
                          title: 'Claim Type',
                          value: claimDetails['Claim Type']!,
                        ),
                        1.5.height,

                        // Third Row: Vehicle and Incident Type
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: _buildDetailItem(
                                title: 'Vehicle',
                                value: claimDetails['Vehicle']!,
                              ),
                            ),
                            4.width,
                            Expanded(
                              child: _buildDetailItem(
                                title: 'Incident Type',
                                value: claimDetails['Incident Type']!,
                              ),
                            ),
                          ],
                        ),
                        1.5.height,

                        // Fourth Row: Incident Date and Incident Location
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: _buildDetailItem(
                                title: 'Incident Date',
                                value: claimDetails['Incident Date']!,
                              ),
                            ),
                            4.width,
                            Expanded(
                              child: _buildDetailItem(
                                title: 'Incident Location',
                                value: claimDetails['Incident Location']!,
                              ),
                            ),
                          ],
                        ),
                        1.5.height,

                        // Incident Details
                        _buildDetailItem(
                          title: 'Incident Details',
                          value: claimDetails['Incident Details']!,
                        ),
                        2.height,

                        // Claim For section
                        Text(
                          'Claim For',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  color: AppColors.midDarkGrey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10.sp),
                        ),
                        1.height,
                        for (var item in claimFor) ...{
                          Row(
                            children: [
                              Icon(
                                Icons.circle,
                                size: 6.sp,
                                color: AppColors.primary,
                              ),
                              2.width,
                              Flexible(
                                child: Text(
                                  item,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10.sp),
                                ),
                              ),
                            ],
                          ),
                          1.height,
                        },
                        1.height,
                        // Images section
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Images',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        color: AppColors.midDarkGrey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10.sp),
                              ),
                            ),
                            CustomButton(
                                width: 20.w,
                                height: 4.h,
                                labelFontSize: 9.sp,
                                label: 'Upload',
                                onPressed: () {})
                          ],
                        ),
                        1.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                              6,
                              (index) => SizedBox(
                                  height: 6.h,
                                  width: 6.h,
                                  child: UploadImageContainer())),
                        ),

                        2.height,

                        // Documents section
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Documents',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        color: AppColors.midDarkGrey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10.sp),
                              ),
                            ),
                            CustomButton(
                                width: 20.w,
                                height: 4.h,
                                labelFontSize: 9.sp,
                                label: 'Upload',
                                onPressed: () {})
                          ],
                        ),
                        1.height,

                        Row(
                          children: documentIcons
                              .map((doc) => Padding(
                                    padding: EdgeInsets.only(right: 6.w),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          AppSvgs.pdf,
                                          height: 3.h,
                                        ),
                                        2.width,
                                        Text(
                                          doc,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                  fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ))
                              .toList(),
                        ),
                        3.height,
                        CustomButton(
                          label: 'Get Estimates',
                          // height: 6.h,
                          onPressed: () {},
                        ),
                        2.height,
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildDetailItem({required String title, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.midDarkGrey,
              fontWeight: FontWeight.bold,
              fontSize: 10.sp),
        ),
        0.5.height,
        Text(
          value,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
