import 'package:flutter/material.dart';
import 'package:nanduba/export.dart';

import '../../widgets/core/custom_appbar.dart';
import '../../widgets/core/my_text.dart';

class RateReviewScreen extends StatefulWidget {
  const RateReviewScreen({super.key});

  @override
  State<RateReviewScreen> createState() => _RateReviewScreenState();
}

class _RateReviewScreenState extends State<RateReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.0.w),
        child: Column(
          children: [
            CustomAppbar(title: "Rate & Review"),
            3.height,
            CustomContainer(
              borderRadius: 20,
                child: Column(
              children: [
                3.height,
                Align(
                  alignment: Alignment.center,
                  child: MyText(
                    text: "Kindly Rate & Review Your\n Experience",
                    fontWeight: FontWeight.w500,
                    fontSize: 11.sp,
                    color: AppColors.grey,
                    textAlign: TextAlign.center,
                  ),
                ),
                2.height,
                CircleAvatar(
                  radius: 7.h,
                  backgroundImage: AssetImage(AppImages.Person),
                ),
                2.height,
                Align(
                  alignment: Alignment.center,
                  child: MyText(
                    text: "John Trial",
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                    color: AppColors.black,
                    textAlign: TextAlign.center,
                  ),
                ),
                2.height,
                Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     SvgPicture.asset(AppSvgs.star, height: 4.h, color: AppColors.yellow,),
                     1.width,
                     SvgPicture.asset(AppSvgs.star, height: 4.h, color: AppColors.yellow,),
                      1.width,
                     SvgPicture.asset(AppSvgs.star, height: 4.h, color: AppColors.yellow,),
                      1.width,
                     SvgPicture.asset(AppSvgs.star, height: 4.h, color: AppColors.yellow,),
                      1.width,
                     SvgPicture.asset(AppSvgs.star_border, height: 4.h, color: AppColors.yellow,),
                    ],
                  )
                ),
                3.height,
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 5.0.w),
                  child: Container(
                    height: 17.h,
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        width: 0.5,
                        color: AppColors.verylightGreen,
                      )
                    ),
                    child: SingleChildScrollView(
                      child: TextFormField(
                        readOnly: false,
                        cursorColor: AppColors.verylightGreen,
                        maxLines: null,
                        minLines: 1,
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.verylightGreen)),
                        decoration: InputDecoration(
                          hintStyle: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.verylightGreen)),
                          hintText: 'Let us know your experience',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                  ),
                ),
                3.height,
              ],
            )),
            Spacer(),
            CustomButton(label: "Submit", onPressed: () {}),
            3.height
          ],
        ),
      )),
    );
  }
}
