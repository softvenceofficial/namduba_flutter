import 'package:get/get.dart';

import '../../export.dart';
import '../../widgets/core/my_text.dart';
import '../rate_and_review/rate_review_screen.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {

  int _rating = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0.w),
          child: Column(
            children: [
              CustomAppbar(title: "Leave Feedback"),
              4.height,
              Row(
                children: [
                  CircleAvatar(
                    radius: 4.h,
                    backgroundColor: AppColors.lightBlue,
                    child: MyText(text: "J",
                    fontWeight: FontWeight.w500,
                    fontSize: 24.sp,
                    color: AppColors.textColor,
                    ),
                  ),
                  2.width,
                  Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        text: "Counting Carsr",
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                        color: AppColors.textColor,
                      ),
                      1.height,
                      MyText(
                        text: "98.6% Positive Results",
                        fontWeight: FontWeight.w400,
                        fontSize: 10.sp,
                        color: AppColors.black,
                      ),
                    ],
                  ))
                ],
              ),
              2.height,
              Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                  text: "How was your experience?",
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                  color: AppColors.textColor,
                ),
              ),
              1.height,
              Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                  text: "Rate your overall experience with the seller.",
                  fontWeight: FontWeight.w400,
                  fontSize: 10.sp,
                  color: AppColors.midGrey,
                ),
              ),
              2.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomContainer(
                      width: Get.width * 0.26,
                    vpadding: 2.h,
                    isBorder: true,
                      child: Column(
                    children: [
                      Icon(CupertinoIcons.plus, size: 25, color: AppColors.primary,),
                      1.height,
                      MyText(
                        text: "Positive",
                        fontWeight: FontWeight.w600,
                        fontSize: 10.sp,
                        color: AppColors.primary,
                      ),
                    ],
                  )),
                  CustomContainer(
                      width: Get.width * 0.26,
                      vpadding: 2.h,
                      isBorder: true,
                      child: Column(
                        children: [
                          Icon(Icons.check_box_outline_blank_outlined, size: 25, color: AppColors.primary,),
                          1.height,
                          MyText(
                            text: "Neutral",
                            fontWeight: FontWeight.w600,
                            fontSize: 10.sp,
                            color: AppColors.primary,
                          ),
                        ],
                      )),
                  CustomContainer(
                      width: Get.width * 0.26,
                      vpadding: 2.h,
                      isBorder: true,
                      child: Column(
                        children: [
                          Icon(CupertinoIcons.minus, size: 25, color: AppColors.primary,),
                          1.height,
                          MyText(
                            text: "Negative",
                            fontWeight: FontWeight.w600,
                            fontSize: 10.sp,
                            color: AppColors.primary,
                          ),
                        ],
                      )),
                ],
              ),
              2.height,
              Row(
                children: [
                  Container(
                    height: 9.h,
                    width: 9.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(image: AssetImage(AppImages.front_bumper), fit: BoxFit.contain)
                    ),
                  ),
                  2.width,
                  Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        text: "Front bumper",
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                        color: AppColors.textColor,
                      ),
                      MyText(
                        text: "\$50.00",
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                        color: AppColors.black,
                      ),
                    ],
                  ))
                ],
              ),
              2.height,
              Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                  text: "Tell us more about this item.",
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                  color: AppColors.textColor,
                ),
              ),
              1.height,
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(5, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _rating = index + 1;
                        });
                      },
                      child: Padding(
                        padding:  EdgeInsets.only(right: index == 5 ? 0 : 4.0),
                        child: SvgPicture.asset(
                          index < _rating ? AppSvgs.star : AppSvgs.star_border,
                          height: 3.h,
                          color: AppColors.yellow,
                        ),
                      ),
                    );
                  }),
                ),
              ),
              2.height,
              Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                  text: "Tell us more about this item.",
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                  color: AppColors.textColor,
                ),
              ),
              1.height,
              Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                  text: "Help the Nanduba community by sharing more details about your purchase.",
                  fontWeight: FontWeight.w400,
                  fontSize: 10.sp,
                  color: AppColors.midGrey,
                ),
              ),
              2.height,
              CustomContainer(
                height: 24.h,
                vpadding: 0.h,
                hpadding: 4.w,
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
                            color: AppColors.verylightGreen
                        )
                    ),
                    decoration: InputDecoration(
                      hintStyle: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.verylightGreen
                          )
                      ),
                      hintText:  'Enter your message here...',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,

                    ),
                  ),
                ),
              ),
              2.height,
              Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                  text: "Add up tp 5 photos(optional)",
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp,
                  color: AppColors.textColor,
                ),
              ),
              2.height,
              Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(
                    text: "Make sure you follow our ",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 10.sp,
                      color: AppColors.midGrey,
                    ),
                    children: [
                      TextSpan(
                        text: "Images, videos and text policy",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 10.sp,
                          color: AppColors.black,
                          decoration: TextDecoration.underline, // Add underline if needed
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              2.height,
              Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                  text: "0 of 5",
                  fontWeight: FontWeight.w600,
                  fontSize: 10.sp,
                  color: AppColors.midGrey,
                ),
              ),
              2.height,
              Align(
                alignment: Alignment.centerLeft,
                child: CustomContainer(
                    hpadding: 4.h,
                    vpadding: 4.h,
                    isBorder: true,
                    borderRadius: 20,
                    child: Icon(CupertinoIcons.plus, size: 25, color: AppColors.primary,)),
              ),
              2.height,
              CustomButton(label: "Submit", onPressed: (){
                Get.to(RateReviewScreen());
              }),
              2.height
            ],
          ),
        ),
      )),
    );
  }
}
