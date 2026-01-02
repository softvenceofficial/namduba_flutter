import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/add_vehicle/policy_information/policy_information.dart';
import 'package:nanduba/widgets/core/my_text.dart';

class YourPlans extends StatefulWidget {
  final double progress1; // Value between 0.0 and 1.0 to represent progress for the first bar
  final double progress2; // Value between 0.0 and 1.0 to represent progress for the second bar

  const YourPlans({
    super.key,
    required this.progress1,
    required this.progress2,
  });

  @override
  State<YourPlans> createState() => _YourPlansState();
}

class _YourPlansState extends State<YourPlans> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text('All',style: GoogleFonts.poppins(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(31, 31, 31, 1)
                          ),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 5.0),
                                child: Container(width: 3.w,height: 0.7.w,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(60)

                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Text('Active',style: GoogleFonts.poppins(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(84, 84, 84, 1)
                      ),),
                      Text('Expired',style: GoogleFonts.poppins(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(84, 84, 84, 1)
                      ),),
                      Text('  '),

                    ],

                  ),
                  SizedBox(height: 3.h,),
                  GestureDetector(
                    onTap: (){
                      Get.to(PolicyInformation());
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(28, 28, 28, 0.1).withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Color.fromRGBO(246, 246, 246, 1),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    AppImages.tetrahedral,
                                    width: 54,
                                    height: 37,
                                  ),
                                ),
                              ),
                              2.height,
                              MyText(text: "ZMW"),
                            ],
                          ),
                          SizedBox(width: 3.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Motor',
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14.sp,
                                            color: Color.fromRGBO(31, 31, 31, 1),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Color.fromRGBO(230, 250, 239, 1),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 6),
                                          child: Text(
                                            'Active',
                                            style: GoogleFonts.poppins(
                                              fontSize: 9.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromRGBO(0, 199, 92, 1),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 0.5.h),
                                Text(
                                  'No: 231535060/2024', // Provide default value if null
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10.sp,
                                      color: Color.fromRGBO(84, 84, 84, 1),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 2.h),
                                Container(
                                  width: double.infinity, // Width of the progress bar
                                  height: 10, // Height of the progress bar
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5), // Rounded corners
                                    color: Color.fromRGBO(0, 199, 92, 0.1), // Progress color
                                  ),
                                  child: Stack(
                                    children: [
                                      AnimatedContainer(
                                        duration: Duration(milliseconds: 300),
                                        width: 200 * widget.progress1, // Width of the filled part based on progress
                                        height: 8,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: Color.fromRGBO(0, 199, 92, 1), // Progress color
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 2.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Valid Until',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromRGBO(84, 84, 84, 1),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                      child: Text(
                                        '23 Dec 2024',
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Color.fromRGBO(31, 31, 31, 1),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 1.h),
                                SizedBox(height: 1.h),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 3.h,),
                  GestureDetector(
                    onTap: (){
                      Get.to(PolicyInformation());
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(28, 28, 28, 0.1).withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: Color.fromRGBO(246, 246, 246, 1),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        AppImages.tetrahedral,
                                        width: 54,
                                        height: 37,
                                      ),
                                    ),
                                  ),
                                  3.height,
                                  MyText(text: "USD"),
                                ],
                              ),
                              SizedBox(width: 3.w),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Motor',
                                            style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14.sp,
                                                color: Color.fromRGBO(31, 31, 31, 1),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: Color.fromRGBO(230, 250, 239, 1),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 6),
                                              child: Text(
                                                'Active',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 9.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromRGBO(0, 199, 92, 1),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 0.5.h),
                                    Text(
                                      'No: 231535060/2024', // Provide default value if null
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10.sp,
                                          color: Color.fromRGBO(84, 84, 84, 1),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 2.h),
                                    Container(
                                      width: double.infinity, // Width of the progress bar
                                      height: 10, // Height of the progress bar
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5), // Rounded corners
                                        color: Color.fromRGBO(255, 235, 237, 1), // Progress color
                                      ),
                                      child: Stack(
                                        children: [
                                          AnimatedContainer(
                                            duration: Duration(milliseconds: 300),
                                            width: 200 * widget.progress2, // Width of the filled part based on progress
                                            height: 8,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              color: Color.fromRGBO(230, 59, 76, 1), // Progress color
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 2.h),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Your policy is expiring',

                                            style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromRGBO(84, 84, 84, 1),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                            child: Text(
                                              '23 Dec 2024',
                                              style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color.fromRGBO(31, 31, 31, 1),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 1.h),
                                    SizedBox(height: 1.h),
                                  ],
                                ),
                              ),
                            ],
                          ),
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
                          SizedBox(height: 2.h,),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width:150,
                                  child: Text('Renew in advance to always be',style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10.sp,
                                      color: Color.fromRGBO(84, 84, 84, 1)
                                  ),),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Color.fromRGBO(217, 50, 67, 1),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                                    child: Text(
                                      'Renew',
                                      style: GoogleFonts.poppins(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                      ),
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  CustomButton(label: "Add Policy", onPressed: (){})
                ],
              ),
            ),
      ),
    );
  }
}
