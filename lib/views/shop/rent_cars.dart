import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/inbox/chat_screen/chat_screen.dart';
import 'package:nanduba/views/inbox/chat_list/chat_list.dart';
import 'package:nanduba/widgets/core/filter_checks.dart';
import 'package:nanduba/widgets/core/my_text.dart';

import '../../controllers/rent_car_controller.dart';
import 'widgets/image_swiper.dart';

class RentCars extends StatefulWidget {
  const RentCars({super.key, required this.car});

  final Map<String, String> car;

  @override
  State<RentCars> createState() => _RentCarsState();
}

class _RentCarsState extends State<RentCars> {
  int currentSlide = 0;
  bool pickUp = false;
  bool _switchValue = false;

  final RentCarController rentVM = Get.find<RentCarController>();

  Widget getTabSvg(int slide) {
    switch (slide) {
      case 0:
      case 1:
      case 2:
        return Image.asset(widget.car['carPic']!,
            width: 200.0); // Ensure 'imageKey' is the correct key
      default:
        return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
            child: Column(
              children: [
                myAppBar(
                  title: widget.car['carFullName']!,
                  icon: AppSvgs.message,
                  isToggle: true,
                  onTogglePressed: () {
                    Get.to(ChatScreenMain());
                  },
                ), // Ensure 'title' is the correct key
                SizedBox(height: 3.h),
                Stack(
                  children: [
                    CustomContainer(
                      vpadding: 1.h,
                      borderRadius: 20,
                      child: SwipeableImage(
                        itemCount: 3,
                        currentSlide: currentSlide,
                        onChange: (value) {
                          setState(() {
                            currentSlide = value;
                          });
                        },
                        closeGesture: () {},
                        buttonOnpressed: () {},
                        tabSvg: getTabSvg(currentSlide),
                        isIndicator: false,
                        child: Positioned(
                            right: 2, left: 2, top: 0, child: SizedBox()),
                      ),
                    ),
                    Positioned(
                      right: 12,
                      left: 12,
                      top: 12,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 1,
                          ),
                          const FavSliderIcon(),
                        ],
                      ),
                    ),
                  ],
                ), // Use SizedBox instead of 2.height
                // CustomContainer(
                //   child: SwipeableImage(
                //     itemCount: 3,
                //     currentSlide: currentSlide,
                //     onChange: (value) {
                //       setState(() {
                //         currentSlide = value;
                //       });
                //     },
                //     closeGesture: () {},
                //     buttonOnpressed: () {},
                //     tabSvg: getTabSvg(currentSlide),
                //     child: Positioned(
                //       right: 2,
                //       child: const FavouriteIcon(),
                //     ),
                //   ),
                // ),
                2.height,
                CustomContainer(
                  hpadding: 6.w,
                  vpadding: 2.h,
                  borderRadius: 30,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 50.w,
                            child: MyText(
                              text: widget.car['carFullName']!,
                              fontWeight: FontWeight.w600,
                              fontSize: 15.sp,
                              color: AppColors.black,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 0.5.h,
                              horizontal: 2.w,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.yellow,
                              borderRadius: BorderRadius.circular(20.sp),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.star_rounded,
                                  color: AppColors.white,
                                  size: 5.w,
                                ),
                                SizedBox(width: 1.w),
                                Text(
                                  "4.5",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.w800,
                                        color: AppColors.white,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      1.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  AppSvgs.location,
                                  color: AppColors.primary,
                                  height: 2.5.h,
                                ),
                                SizedBox(
                                  width: 0.5.h,
                                ),
                                MyText(
                                  text: "Seattle, Washington, USA",
                                  color: AppColors.midDarkGrey,
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                          ),
                          MyText(
                            text: '1.5k ratings',
                            color: AppColors.darkGrey,
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      2.height,
                      Divider(
                        color: AppColors.lightGrey,
                        thickness: 1,
                        height: 2,
                      ),
                      2.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  AppSvgs.seat,
                                  height: 2.h,
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                MyText(
                                  text: "4 Seats",
                                  color: AppColors.midDarkGrey,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                )
                              ],
                            ),
                          ),
                          MyText(
                            text: "|",
                            color: AppColors.midDarkGrey,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w200,
                          ),
                          SizedBox(
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  AppSvgs.cc,
                                  height: 2.h,
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                MyText(
                                  text: "3.5 cc displacement",
                                  color: AppColors.midDarkGrey,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                2.height,
                CustomContainer(
                  hpadding: 6.w,
                  vpadding: 2.h,
                  borderRadius: 30,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(
                        () => Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                rentVM.pickUp.value = !rentVM.pickUp.value;
                              },
                              child: Container(
                                height: 24,
                                width: 24,
                                margin: EdgeInsets.only(right: 6),
                                decoration: BoxDecoration(
                                    color: rentVM.pickUp.value == false
                                        ? Colors.white
                                        : AppColors.white,
                                    border: Border.all(
                                      width: 1,
                                      color: rentVM.pickUp.value == false
                                          ? AppColors.border
                                          : AppColors.primary,
                                    ),
                                    borderRadius: BorderRadius.circular(8)),
                                child: rentVM.pickUp.value == false
                                    ? SizedBox()
                                    : Icon(
                                        Icons.check,
                                        size: 14,
                                        color: AppColors.primary,
                                      ),
                              ),
                            ),
                            MyText(
                              text: "Pick up and return to same location",
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.grey,
                            )
                          ],
                        ),
                      ),
                      1.height,
                      CustomTextField(
                        name: "Pick up and return location",
                        hintText: "Pick up location",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                          color: AppColors.verylightGreen,
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                        )),
                        prefixIcon: SvgPicture.asset(
                          AppSvgs.location2,
                          fit: BoxFit.scaleDown,
                          color: AppColors.primary,
                        ),
                        hintStyle: GoogleFonts.poppins(
                            textStyle: TextStyle(
                          color: AppColors.verylightGreen,
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                        )),
                        // suffixIcon: SvgPicture.asset(AppSvgs.calendar, color: AppColors.primary, height: 12,),
                      ),
                      2.height,
                      MyText(
                        text: "Pick up date",
                        color: AppColors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        textAlign: TextAlign.left,
                      ),
                      1.height,
                      CustomTextField(
                        name: "",
                        hintText: "",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                          color: AppColors.verylightGreen,
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                        )),
                        hintStyle: GoogleFonts.poppins(
                            textStyle: TextStyle(
                          color: AppColors.verylightGreen,
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                        )),
                        suffixIcon: SvgPicture.asset(
                          AppSvgs.calendar,
                          color: AppColors.primary,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      1.height,
                      Obx(() => rentVM.pickUp.value == false
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText(
                                  text: "Return location",
                                  color: AppColors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                  textAlign: TextAlign.left,
                                ),
                                1.height,
                                CustomTextField(
                                  name: "",
                                  hintText: "Return location",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                    color: AppColors.verylightGreen,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp,
                                  )),
                                  hintStyle: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                    color: AppColors.verylightGreen,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp,
                                  )),
                                  prefixIcon: SvgPicture.asset(
                                    AppSvgs.location2,
                                    color: AppColors.primary,
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                                1.height,
                              ],
                            )
                          : SizedBox()),
                      MyText(
                        text: "Return date",
                        color: AppColors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        textAlign: TextAlign.left,
                      ),
                      1.height,
                      CustomTextField(
                        name: "",
                        hintText: "",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                          color: AppColors.verylightGreen,
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                        )),
                        hintStyle: GoogleFonts.poppins(
                            textStyle: TextStyle(
                          color: AppColors.verylightGreen,
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                        )),
                        suffixIcon: SvgPicture.asset(
                          AppSvgs.calendar,
                          color: AppColors.primary,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      2.height,
                      MyText(
                        text: "Where are you driving to?",
                        color: AppColors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        textAlign: TextAlign.left,
                      ),
                      1.height,
                      CustomDropdown(
                        name: "Within city/Across cities",
                        hintText: "Within city/Across cities",
                        hintStyle: GoogleFonts.poppins(
                            textStyle: TextStyle(
                          color: AppColors.verylightGreen,
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                        )),
                        items: [
                          DropdownMenuItem(
                            child: Text("asdasd"),
                            value: 1,
                          ),
                          DropdownMenuItem(
                            child: Text("asdasd"),
                            value: 2,
                          ),
                          DropdownMenuItem(
                            child: Text("asdasd"),
                            value: 3,
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
                    text: "Cancellation Policy",
                    color: AppColors.primary,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Color.fromRGBO(
            255, 255, 255, 1), // Set your desired background color here
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.sp, horizontal: 5.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                text: "\$295.00/Day",
                color: AppColors.primary,
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
              ),
              CustomButton(
                height: 6.h,
                width: 40.w,
                label: "Reserve",
                onPressed: () {
                  // _showBottomSheet();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
