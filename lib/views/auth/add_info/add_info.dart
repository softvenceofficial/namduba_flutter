import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';

class AddInfoScreen extends StatefulWidget {
  const AddInfoScreen({super.key});

  @override
  State<AddInfoScreen> createState() => _AddInfoScreenState();
}

class _AddInfoScreenState extends State<AddInfoScreen> {
  bool obscurePassword = true;
  final _formKey = GlobalKey<FormBuilderState>();
  bool obscureConfrmPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
            child: const CustomAppbar(
              title: AppText.createaccount,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 4.w),
            child: RichText(
              text: TextSpan(
                  text: AppText.letsgets,
                  style: Textfontstyle.TextStyle23w600c212121poppins),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
                child: FormBuilder(
                  key: _formKey,
                  child: Column(
                    children: [
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
                      2.height,
                      CustomTextField(
                        name: 'firstName',
                        hintText: AppText.firstName,
                        titleText: AppText.firstName,
                        prefixIcon: SvgPicture.asset(
                          fit: BoxFit.scaleDown,
                          AppSvgs.profileIcon,
                        ),
                        textInputAction: TextInputAction.next,
                        validator: FormBuilderValidators.required(),
                      ),
                      2.height,
                      CustomTextField(
                        name: 'lastName',
                        hintText: AppText.lastName,
                        titleText: AppText.lastName,
                        prefixIcon: SvgPicture.asset(
                          fit: BoxFit.scaleDown,
                          AppSvgs.profileIcon,
                        ),
                        textInputAction: TextInputAction.next,
                        validator: FormBuilderValidators.required(),
                      ),
                      2.height,

                      CustomTextField(
                        name: 'password',
                        hintText: AppText.password,
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
                      2.height,
                      CustomTextField(
                        name: 'confirmPassword',
                        hintText: AppText.confirmPassword,
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
                              obscureConfrmPassword = !obscureConfrmPassword;
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
                      // 3.height,
                      // const AgreementWidget(),
                      6.3.height,
                      CustomButton(
                          label: AppText.verifiyemail,
                          onPressed: () {
                            AppCustomNavigator.push(
                                context, const ForgotPasswordScreen());
                          })
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
