import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts package
import 'package:nanduba/export.dart';
import 'package:nanduba/widgets/core/my_text.dart'; // Import your assets

class TrackPlans extends StatefulWidget {
  const TrackPlans({super.key});

  @override
  State<TrackPlans> createState() => _TrackPlansState();
}

class _TrackPlansState extends State<TrackPlans> {
  bool _expanded = false;

  void _toggleExpansion() {
    setState(() {
      _expanded = !_expanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(28, 28, 28, 0.1),
                      offset: Offset(0, 2),
                      blurRadius: 20,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Claims  ', style: GoogleFonts.poppins(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(31, 31, 31, 1),
                              )),
                              Image.asset(AppImages.Dot, width: 6, height: 6),
                              Text('  PLN231628Cu/2018/4', style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 9.sp,
                                color: Color.fromRGBO(84, 84, 84, 1),
                              )),
                            ],
                          ),
                          GestureDetector(
                            onTap: _toggleExpansion,
                            child: Image.asset(AppImages.circle_arrow, height: 18, width: 18),
                          ),
                        ],
                      ),
                      if (_expanded) ...[
                        SizedBox(height: 1.h),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Submitted on 23 June 2024', style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 9.sp,
                              color: Color.fromRGBO(84, 84, 84, 1),
                            )),
                          ],
                        ),
                        SizedBox(height: 1.h),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromRGBO(253, 248, 240, 1),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 6),
                                child: Text('Processing', style: GoogleFonts.poppins(
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(255, 153, 0, 1),
                                )),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 1.h),

                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Color.fromRGBO(235, 223, 224, 1),
                                      width: 1.0, // Border width
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 1.h),

                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('PLN231628Cu/2018/4',style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.sp,
                                    color: Color.fromRGBO(31, 31, 31, 1)
                                )),
                              ],
                            ),
                            SizedBox(height: 1.5.h),

                            Row(
                              children: [
                                Image.asset(AppImages.Dot, width: 6, height: 6),
                                Text('  Own Damage',style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 9.sp,
                                )),
                              ],
                            ),
                            SizedBox(height: 1.h),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('    Toyato Hux ABP 1268',style: GoogleFonts.poppins(
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(84, 84, 84, 1),
                                )),
                              ],
                            ),
                            SizedBox(height: 2.h),

                            Row(
                              children: [
                                Image.asset(AppImages.Dot, width: 6, height: 6),
                                Text('  Own Damage',style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 9.sp,
                                )),
                              ],
                            ),
                            SizedBox(height: 1.h),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('    Toyato Hux ABP 1268',style: GoogleFonts.poppins(
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(84, 84, 84, 1),
                                )),
                              ],
                            )
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 16,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromRGBO(217, 50, 67, 1),
                borderRadius: BorderRadius.circular(60),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Initiate Claim',style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(255, 255, 255, 1),
                    )),
                  ],
                ),
              ),
            ),
            3.height,
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
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
                    children: [
                      Container(
                        width: 7.h,
                        height: 7.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.secondary,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(3.0.w),
                          child: Image.asset(
                            AppImages.shield,
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ),
                      3.width,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(text: "Single Vehicle Accident Claim",
                              fontSize: 12.sp,
                              color: AppColors.black,
                              fontWeight: FontWeight.w600,
                            ),
                            MyText(
                                text: "Accident Date: 10 Mar 2024",
                              fontSize: 10.sp,
                              color: AppColors.midDarkGrey,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      )
                    ],
              ),
                  2.height,
                  Divider(
                    height: 1,
                    color: AppColors.border,
                    thickness: 1
                    ,
                  ),
                  2.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 0.5.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: AppColors.backGreen,
                        ),
                        child: MyText(text: "Completed",
                        fontWeight: FontWeight.w400,
                        fontSize: 8.sp,
                        color: AppColors.green3,
                        )
                      ),
                      MyText(text: "LVN 7325",
                        fontSize: 12.sp,
                        color: AppColors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  )
              ]
            ),
                        ),
           ]
        ),
      ),
    );
  }
}
