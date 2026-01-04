import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/auth/create_an_account/get_email_otp.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();
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
                    child: FormBuilder(
                      key: formKey,
                      child: Column(
                        children: [
                          CustomVerificationContainer(
                            icon: AppSvgs.forgotByEmail,
                            vpadding: 4.h,
                            hpadding: 9.w,
                            borderRadius: 15.w,
                            svgHeight: 10.w,
                          ),
                          2.4.height,
                          Text(AppText.enterEmail,
                              style:
                                  Textfontstyle.TextStyle18w700c212121poppins),
                          0.9.height,
                          Text(
                            textAlign: TextAlign.center,
                            AppText.sendOTPEmail,
                            style: Textfontstyle.TextStyle14w400greypoppins
                                .copyWith(color: AppColors.midGrey),
                          ),
                          7.3.height,
                          CustomTextField(
                            name: 'email',
                            hintText: AppText.email,
                            titleText: AppText.emailAddress,
                            prefixIcon: SvgPicture.asset(
                              fit: BoxFit.scaleDown,
                              AppSvgs.emailIcon,
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.email(),
                            ]),
                          ),
                          7.7.height,
                          CustomButton(
                            label: AppText.coontinue,
                            onPressed: () {
                              AppCustomNavigator.push(
                                  context, const GetEmailOtp());
                            },
                          ),
                          2.7.height,
                          GestureDetector(
                            onTap: () {
                              AppCustomNavigator.pop(context);
                              // AppCustomNavigator.pop(context);
                              // AppCustomNavigator.pop(context);
                            },
                            child: Text(
                              AppText.backLogin,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
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
                          4.height,
                        ],
                      ),
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
