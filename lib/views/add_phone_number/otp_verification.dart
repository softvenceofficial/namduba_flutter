import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/add_phone_number/add_phone_number_screen.dart';
import 'package:nanduba/views/finish_signing_up/finish_signing_up_screen.dart';

class OtpVerification extends StatelessWidget {
  const OtpVerification({super.key});

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
                    title: AppText.verifyNumber,
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
                        Text(AppText.verification,
                            style: Textfontstyle.TextStyle18w600c212121poppins
                                .copyWith(fontSize: 14.sp)),
                        1.height,
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: AppText.enteryout4digitcode,
                              style: Textfontstyle.TextStyle14w400midgreypoppins
                              // .copyWith(fontSize: 10.sp)
                              // children: [
                              // TextSpan(
                              //   text: '\n+27 501 5054 241',
                              //   style: Theme.of(context)
                              //       .textTheme
                              //       .bodyMedium
                              //       ?.copyWith(fontWeight: FontWeight.w700),
                              // ),
                              // ],
                              ),
                        ),

                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: AppText.number,
                              style: Textfontstyle.TextStyle14w400midgreypoppins
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.black,
                                      fontSize: 10.sp)),
                        ),
                        4.4.height,
                        Pinput(
                          length: 6,
                          cursor: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                  padding: EdgeInsets.symmetric(vertical: .9.h),
                                  // margin: EdgeInsets.symmetric(vertical: 0.1.h),
                                  width: 0.3.w,
                                  height: 2.2.h,
                                  color: AppColors.primary),
                            ],
                          ),
                          defaultPinTheme: PinTheme(
                            width: 35.w,
                            height: 3.5.h,
                            textStyle: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(15.sp),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.lightGrey.withOpacity(0.5),
                                  spreadRadius: 1.sp,
                                  blurRadius: 3.sp,
                                ),
                              ],
                            ),
                          ),
                          pinputAutovalidateMode:
                              PinputAutovalidateMode.disabled,
                          onCompleted: (value) {},
                        ),
                        3.9.height,
                        CustomButton(
                          label: AppText.verify,
                          labelFontSize: 14.sp,
                          onPressed: () {
                            AppCustomNavigator.push(
                                context, const FinishSigningUpScreen());
                          },
                        ),
                        1.5.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: InkWell(
                                onTap: () {
                                  AppCustomNavigator.push(
                                      context, const AddPhoneNumberScreen());
                                },
                                child: Text(
                                  AppText.resendCode,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.transparent,
                                        shadows: [
                                          Shadow(
                                              color: AppColors.primary,
                                              offset: Offset(0.h, -0.5.h))
                                        ],
                                        decoration: TextDecoration.underline,
                                        decorationColor: AppColors.primary,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        40.height,
                        // CustomButton(
                        //   label: AppText.verify,
                        //   onPressed: () {
                        //     AppCustomNavigator.push(
                        //         context, const AddInfoScreen());
                        //   },
                        // ),
                        // 10.height,
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
