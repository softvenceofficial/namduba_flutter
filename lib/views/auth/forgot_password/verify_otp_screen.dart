import 'package:nanduba/export.dart';

class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({super.key});

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
                    title: AppText.verifyOtp,
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
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        1.height,
                        Text(
                          textAlign: TextAlign.center,
                          AppText.enterOtp,
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: AppColors.midGrey,
                                  ),
                        ),
                        8.height,
                        Pinput(
                          length: 4,
                          cursor: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                  margin: EdgeInsets.symmetric(vertical: 1.7.h),
                                  width: 0.3.w,
                                  height: 3.h,
                                  color:
                                      AppColors.primary // Set cursor color here
                                  ),
                            ],
                          ),
                          defaultPinTheme: PinTheme(
                            width: 15.w,
                            height: 6.5.h,
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
                        3.height,
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: AppText.notRecieved,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: AppColors.midGrey),
                            children: [
                              TextSpan(
                                text: AppText.resendCode,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.primary,
                                      decoration: TextDecoration.underline,
                                      decorationColor: AppColors.primary,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        10.height,
                        CustomButton(
                          label: AppText.verify,
                          onPressed: () {
                            AppCustomNavigator.push(
                                context, const ResetYourPasswordScreen());
                          },
                        ),
                        3.height,
                        GestureDetector(
                          onTap: () {
                            AppCustomNavigator.pop(context);
                          },
                          child: Text(
                            AppText.backForgot,
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
                        6.height,
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
