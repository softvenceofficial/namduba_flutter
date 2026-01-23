// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/create_request/compare_estimates/compare_estimates.dart';
import 'package:nanduba/views/new_profile_screen/marketplace/widget/requst_expandable_container.dart';
import 'package:nanduba/views/new_profile_screen/marketplace/widget/text_with_red_dot.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({super.key});

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  bool showExpantion = false;
  bool showExpantion2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 4),
          child: Column(
            children: [
              CustomAppbar(
                title: "Request",
                svgIconNextToTitle: AppSvgs.filter2,
                isborder: true,
              ),
              2.height,

              /// First Request Container
              InkWell(
                onTap: () {
                  AppCustomNavigator.push(context, CompareEstimates());
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withAlpha(20),
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Compliance",
                            style: Textfontstyle.TextStyle14w400c212121poppins
                                .copyWith(
                              fontSize: 12.sp,
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    showExpantion = !showExpantion;
                                  });
                                },
                                icon: Icon(
                                  showExpantion
                                      ? Icons.expand_less
                                      : Icons.expand_more,
                                  color: AppColors.primary,
                                ),
                              ),
                              SvgPicture.asset(
                                AppSvgs.more_vert,
                                color: AppColors.primary,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Requested on March 11, 2024",
                            style: Textfontstyle.TextStyle12w500c212121poppins
                                .copyWith(
                              color: AppColors.midGrey,
                              fontSize: 10.sp,
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              setState(() {
                                showExpantion = !showExpantion;
                              });
                            },
                            child: SvgPicture.asset(
                              showExpantion
                                  ? AppSvgs.arrowdown
                                  : AppSvgs.arrowup,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Getting Estimates",
                        style: Textfontstyle.TextStyle12w500c212121poppins
                            .copyWith(
                          color: AppColors.primary,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              RequestExpandableContainer(
                isExpanded: showExpantion,
                onToggle: () {
                  setState(() {
                    showExpantion = !showExpantion;
                  });
                },
                children: [
                  textwithreddot(text: "Ex-Red Book"),
                  1.height,
                  textwithreddot(text: "road tax renewal"),
                  1.height,
                  textwithreddot(text: "Register Motor Vehicle (1)"),
                  1.height,
                  textwithreddot(text: "Change of Ownership (3)"),
                ],
              ),

              2.height,

              /// Second Request Container
              InkWell(
                onTap: () {
                  AppCustomNavigator.push(context, CompareEstimates());
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withAlpha(20),
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Compliance",
                            style: Textfontstyle.TextStyle14w400c212121poppins
                                .copyWith(
                              fontSize: 12.sp,
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    showExpantion2 = !showExpantion2;
                                  });
                                },
                                icon: Icon(
                                  showExpantion2
                                      ? Icons.expand_less
                                      : Icons.expand_more,
                                  color: AppColors.primary,
                                ),
                              ),
                              SvgPicture.asset(
                                AppSvgs.more_vert,
                                color: AppColors.primary,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Requested on March 11, 2024",
                            style: Textfontstyle.TextStyle12w500c212121poppins
                                .copyWith(
                              color: AppColors.midGrey,
                              fontSize: 10.sp,
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              setState(() {
                                showExpantion2 = !showExpantion2;
                              });
                            },
                            child: SvgPicture.asset(
                              showExpantion2
                                  ? AppSvgs.arrowdown
                                  : AppSvgs.arrowup,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              RequestExpandableContainer(
                isExpanded: showExpantion2,
                onToggle: () {
                  setState(() {
                    showExpantion2 = !showExpantion2;
                  });
                },
                children: [
                  textwithreddot(text: "Ex-Red Book"),
                  1.height,
                  textwithreddot(text: "road tax renewal"),
                  1.height,
                  textwithreddot(text: "Register Motor Vehicle (1)"),
                  1.height,
                  textwithreddot(text: "Change of Ownership (3)"),
                ],
              ),

              2.height,
            ],
          ),
        ),
      ),
    );
  }
}
