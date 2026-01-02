import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';

class GetEmailOtp extends StatelessWidget {
  const GetEmailOtp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          CustomPaint(
            painter: CommonBackgroundPaint(),
            size: Size(100.w, 100.h),
          ),
          SafeArea(
              child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
              child: Column(
                children: [
                  const CustomAppbar(
                    title: AppText.resetPassword,
                  ),
                  CustomContainer(
                    hpadding: 6.w,
                    vMargin: 3.h,
                    width: double.maxFinite,
                    vpadding: 4.h,
                    child: Column(
                      children: [
                        CustomVerificationContainer(
                          icon: AppSvgs.verifyNumber,
                          vpadding: 5.h,
                          hpadding: 7.w,
                          borderRadius: 15.w,
                          svgHeight: 7.w,
                        ),
                        3.height,
                        Text(
                          AppText.otpVerification,
                          style: Textfontstyle.TextStyle18w700c212121poppins
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                        1.height,
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: AppText.foryoursecurity,
                              style: Textfontstyle.TextStyle14w400greypoppins
                                  .copyWith(color: AppColors.midGrey)),
                        ),
                        8.height,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Email Icon
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: SvgPicture.asset(
                                AppSvgs.emailIcon,
                                height: 16,
                                width: 16,
                              ),
                            ),

                            0.5.width,

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppText.email,
                                  style: Textfontstyle
                                      .TextStyle14w400greypoppins.copyWith(
                                    color: AppColors.midGrey,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                0.5.height,
                                Text(AppText.dagmailcom,
                                    style: Textfontstyle
                                            .TextStyle14w400greypoppins
                                        .copyWith(color: AppColors.midGrey)),
                              ],
                            ),
                          ],
                        ),

                        3.7.height,

                        // Pinput(
                        //   length: 4,
                        //   cursor: Column(
                        //     mainAxisAlignment: MainAxisAlignment.end,
                        //     children: [
                        //       Container(
                        //           margin: EdgeInsets.symmetric(vertical: 1.7.h),
                        //           width: 0.3.w,
                        //           height: 3.h,
                        //           color: AppColors.primary),
                        //     ],
                        //   ),
                        //   defaultPinTheme: PinTheme(
                        //     width: 15.w,
                        //     height: 6.5.h,
                        //     textStyle: const TextStyle(
                        //       fontSize: 22,
                        //       fontWeight: FontWeight.w600,
                        //     ),
                        //     decoration: BoxDecoration(
                        //       color: AppColors.white,
                        //       borderRadius: BorderRadius.circular(15.sp),
                        //       boxShadow: [
                        //         BoxShadow(
                        //           color: AppColors.lightGrey.withOpacity(0.5),
                        //           spreadRadius: 1.sp,
                        //           blurRadius: 3.sp,
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        //   pinputAutovalidateMode:
                        //       PinputAutovalidateMode.disabled,
                        //   onCompleted: (value) {},
                        // ),

                        CustomButton(
                          label: AppText.emailme,
                          onPressed: () {
                            AppCustomNavigator.push(context, const OtpScreen());
                          },
                        ),
                        2.4.height,
                        Text(
                          AppText.contactus,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.transparent,
                                    fontSize: 16,
                                    shadows: [
                                      Shadow(
                                          color: AppColors.primary,
                                          offset: Offset(0.h, -0.5.h))
                                    ],
                                    decoration: TextDecoration.underline,
                                    decorationColor: AppColors.primary,
                                  ),
                        ),
                        10.height,
                      ],
                    ),
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
