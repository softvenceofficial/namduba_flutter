import 'package:nanduba/export.dart';
import 'package:nanduba/views/auth/create_an_account/create_an_account.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  bool obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SafeArea(
              child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomAppbar(
                    title: AppText.login,
                  ),
                  RichText(
                    text: TextSpan(
                      text: AppText.road,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 16.sp,
                            color: AppColors.black,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  3.height,
                  CustomTextField(
                    name: 'email',
                    hintText: AppText.email,
                    titleText: AppText.email,
                    prefixIcon: SvgPicture.asset(
                      fit: BoxFit.scaleDown,
                      AppSvgs.emailIcon,
                    ),
                    textInputAction: TextInputAction.next,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.email(),
                    ]),
                  ),
                  3.height,
                  CustomTextField(
                    name: 'password',
                    hintText: "********",
                    titleText: AppText.password,
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
                        obscurePassword ? AppSvgs.eye : AppSvgs.eyeSlash,
                      ),
                    ),
                  ),
                  3.height,
                  CustomButton(
                      label: AppText.login,
                      onPressed: () {
                        AppCustomNavigator.push(
                            context, const ForgotPasswordScreen());
                      }),
                  3.height,
                  InkWell(
                    onTap: () {
                      AppCustomNavigator.push(
                          context, const ForgotPasswordScreen());
                    },
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                          text: AppText.resetPassword,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontSize: 14.sp,
                                    color: AppColors.primary,
                                  ),
                        ),
                      ),
                    ),
                  ),
                  35.height,
                  InkWell(
                    onTap: () {
                      AppCustomNavigator.push(context, const CreateAnAccount());
                    },
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                          text: AppText.createaccount,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontSize: 14.sp,
                                    color: AppColors.primary,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
