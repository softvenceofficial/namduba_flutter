import 'package:nanduba/export.dart';

class ResetYourPasswordScreen extends StatefulWidget {
  const ResetYourPasswordScreen({super.key});

  @override
  State<ResetYourPasswordScreen> createState() =>
      _ResetYourPasswordScreenState();
}

class _ResetYourPasswordScreenState extends State<ResetYourPasswordScreen> {
  bool obscurePassword = true;
  final _formKey = GlobalKey<FormBuilderState>();
  bool obscureConfrmPassword = true;
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
                    title: AppText.changePassword,
                  ),
                  CustomContainer(
                    hpadding: 6.w,
                    vMargin: 2.h,
                    width: double.maxFinite,
                    vpadding: 4.h,
                    child: FormBuilder(
                      key: _formKey,
                      child: Column(
                        children: [
                          CustomVerificationContainer(
                            icon: AppSvgs.forgotByEmail,
                            vpadding: 4.2.h,
                            hpadding: 9.w,
                            borderRadius: 15.w,
                            svgHeight: 10.w,
                          ),
                          3.height,
                          Text(
                            AppText.resetPassword,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          1.height,
                          Text(
                            textAlign: TextAlign.center,
                            AppText.belowDetail,
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: AppColors.midGrey,
                                    ),
                          ),
                          7.height,
                          CustomTextField(
                            name: 'newPassword',
                            hintText: AppText.enterPassword,
                            titleText: AppText.newPassword,
                            obscureText: obscurePassword,
                            prefixIcon: SvgPicture.asset(
                              fit: BoxFit.scaleDown,
                              AppSvgs.passwordIcon,
                            ),
                            textInputAction: TextInputAction.next,
                            fillColor: AppColors.white,
                            onChanged: (p0) {
                              setState(() {});
                            },
                            validator: FormBuilderValidators.required(),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  obscurePassword = !obscurePassword;
                                });
                              },
                              child: SvgPicture.asset(
                                fit: BoxFit.scaleDown,
                                obscurePassword
                                    ? AppSvgs.eye
                                    : AppSvgs.eyeSlash,
                              ),
                            ),
                          ),
                          3.height,
                          CustomTextField(
                            name: 'confirmPassword',
                            hintText: AppText.enterPassword,
                            titleText: AppText.confirmPassword,
                            textInputAction: TextInputAction.done,
                            obscureText: obscureConfrmPassword,
                            prefixIcon: SvgPicture.asset(
                              fit: BoxFit.scaleDown,
                              AppSvgs.passwordIcon,
                            ),
                            fillColor: AppColors.white,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.equal(
                                  _formKey.currentState?.fields['password']
                                          ?.value ??
                                      '',
                                  errorText: 'Must be equal to password.')
                            ]),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  obscureConfrmPassword =
                                      !obscureConfrmPassword;
                                });
                              },
                              child: SvgPicture.asset(
                                fit: BoxFit.scaleDown,
                                obscureConfrmPassword
                                    ? AppSvgs.eye
                                    : AppSvgs.eyeSlash,
                              ),
                            ),
                          ),
                          9.height,
                          CustomButton(
                            label: AppText.setPassword,
                            onPressed: () {
                              AppCustomNavigator.push(
                                  context, const AllowNotificationScreen());
                            },
                          ),
                          3.height,
                          GestureDetector(
                            onTap: () {
                              AppCustomNavigator.pop(context);
                              AppCustomNavigator.pop(context);
                              AppCustomNavigator.pop(context);
                              AppCustomNavigator.pop(context);
                              AppCustomNavigator.pop(context);
                            },
                            child: Text(
                              AppText.backLogin,
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
                          // 2.height,
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
