import 'package:get/get.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/rate_and_review/rate_review_screen.dart';
import 'package:nanduba/widgets/core/my_text.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.0.w),
        child: Column(
          children: [
            const CustomAppbar(title: "Ask Question?"),
            4.height,
            Align(
              alignment: Alignment.centerLeft,
              child: MyText(
                text: "Any Question or Query Contact Us?",
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
                color: AppColors.textColor,
              ),
            ),
            1.height,
            Align(
              alignment: Alignment.centerLeft,
              child: MyText(
                text: "Please fill the message area below to ask any question",
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
                          color: AppColors.verylightGreen)),
                  decoration: InputDecoration(
                    hintStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.verylightGreen)),
                    hintText: 'Enter your message here...',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
            ),
            13.height,
            CustomButton(
                label: "Submit",
                onPressed: () {
                  Get.to(RateReviewScreen());
                })
          ],
        ),
      )),
    );
  }
}
