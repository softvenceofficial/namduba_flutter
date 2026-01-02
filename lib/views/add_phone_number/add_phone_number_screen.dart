import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/add_phone_number/otp_verification.dart';
import 'package:nanduba/views/finish_signing_up/finish_signing_up_screen.dart';

class AddPhoneNumberScreen extends StatefulWidget {
  const AddPhoneNumberScreen({super.key});

  @override
  State<AddPhoneNumberScreen> createState() => _AddPhoneNumberScreenState();
}

class _AddPhoneNumberScreenState extends State<AddPhoneNumberScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  final phoneController = TextEditingController();
  Country? selectedCountry;
  bool isValid = true;

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
                    title: AppText.addphonenumber,
                  ),
                  CustomContainer(
                    height: 100.h,
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
                          AppText.enteryourphonenumber,
                          style: Textfontstyle.TextStyle18w600c212121poppins
                              .copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        1.height,
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: AppText.sendOTPEmail,
                            style: Textfontstyle.TextStyle14w400midgreypoppins
                                .copyWith(
                              fontSize: 10.sp,
                            ),
                          ),
                        ),
                        1.9.height,
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            AppText.phone,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: AppColors.grey,
                                  fontFamily:
                                      GoogleFonts.poppins(fontSize: 8.sp)
                                          .fontFamily,
                                ),
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        IntlPhoneField(
                          controller: phoneController,
                          disableLengthCheck: true,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: AppColors.black),
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(14.sp),
                                ),
                                borderSide:
                                    const BorderSide(color: AppColors.primary),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(14.sp),
                                ),
                                borderSide:
                                    const BorderSide(color: AppColors.border),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(14.sp),
                                ),
                                borderSide:
                                    const BorderSide(color: AppColors.border),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(14.sp),
                                ),
                                borderSide:
                                    const BorderSide(color: AppColors.black),
                              ),
                              errorText: isValid ? null : AppText.validPhone,
                              errorStyle: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: AppColors.black)),
                        ),
                        1.9.height,
                        RichText(
                          // textAlign: TextAlign.center,
                          text: TextSpan(
                            text: AppText.sendOTPIns,
                            style: Textfontstyle.TextStyle14w400midgreypoppins
                                .copyWith(
                              fontSize: 10.sp,
                            ),
                          ),
                        ),
                        2.height,
                        CustomButton(
                          label: AppText.coontinue,
                          labelFontSize: 14.sp,
                          onPressed: () {
                            AppCustomNavigator.push(
                                context, const OtpVerification());
                          },
                        ),
                        // 2.height,
                        // Row(
                        //   children: [
                        //     Text(
                        //       AppText.dontrecivedanycode,
                        //       style: Textfontstyle.TextStyle14w400midgreypoppins
                        //           .copyWith(fontSize: 10.sp),
                        //     ),
                        //     Padding(
                        //       padding: const EdgeInsets.only(top: 8),
                        //       child: Text(
                        //         AppText.resendCode,
                        //         style: Theme.of(context)
                        //             .textTheme
                        //             .bodyMedium
                        //             ?.copyWith(
                        //               fontWeight: FontWeight.w600,
                        //               color: AppColors.transparent,
                        //               shadows: [
                        //                 Shadow(
                        //                     color: AppColors.primary,
                        //                     offset: Offset(0.h, -0.5.h))
                        //               ],
                        //               decoration: TextDecoration.underline,
                        //               decorationColor: AppColors.primary,
                        //             ),
                        //       ),
                        //     ),
                        //   ],
                        // ),

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
