

import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/auth/create_an_account/create_an_account.dart';
import 'package:nanduba/views/auth/signin_page/signin_screen.dart';

class SigninSignupScreen extends StatefulWidget {
  const SigninSignupScreen({super.key});

  @override
  State<SigninSignupScreen> createState() => _SigninSignupScreenState();
}

class _SigninSignupScreenState extends State<SigninSignupScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  final phoneController = TextEditingController();
  bool isValid = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          /// 🔹 Background
          CustomPaint(
            painter: SignInSignUpBackgroundPaint(),
            size: Size(100.w, 100.h),
          ),

          /// 🔹 Main Content
          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
              child: FormBuilder(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// spacing for top button
                    3.3.height,

                    /// Title
                    RichText(
                      text: TextSpan(
                        text: AppText.road,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 23.sp,
                              color: AppColors.black,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ),

                    0.5.height,

                    /// Subtitle
                    Text(
                      AppText.problemToday,
                      style: Textfontstyle.TextStyle14w400greypoppins,
                    ),

                    18.5.height,

                    /// Continue Button
                    CustomButton(
                      label: AppText.cntnu,
                      onPressed: () {
                        AppCustomNavigator.push(
                          context,
                          const SigninScreen(),
                        );
                      },
                    ),

                    6.height,

                    /// OR Divider
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: AppColors.dulPink,
                            indent: 20.w,
                            endIndent: 2.w,
                          ),
                        ),
                        Text(
                          'or',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: AppColors.grey),
                        ),
                        Expanded(
                          child: Divider(
                            color: AppColors.dulPink,
                            indent: 2.w,
                            endIndent: 20.w,
                          ),
                        ),
                      ],
                    ),

                    6.height,

                    /// Social Buttons
                    CustomButton(
                      icon: AppSvgs.fb,
                      backgroundColor: AppColors.transparent,
                      foregroundColor: AppColors.black,
                      borderRadius: 15.sp,
                      label: AppText.continueFacebook,
                      onPressed: () {},
                    ),

                    2.height,

                    CustomButton(
                      icon: AppSvgs.gmail,
                      backgroundColor: AppColors.transparent,
                      foregroundColor: AppColors.black,
                      borderRadius: 15.sp,
                      label: AppText.continueGoogle,
                      onPressed: () {},
                    ),

                    2.height,

                    CustomButton(
                      icon: AppSvgs.apple,
                      backgroundColor: AppColors.transparent,
                      foregroundColor: AppColors.black,
                      borderRadius: 15.sp,
                      label: AppText.continueApple,
                      onPressed: () {},
                    ),

                    4.7.height,

                    /// Bottom Text
                    Center(
                      child: Text(
                        AppText.donthaveanaccount,
                        style: Textfontstyle.TextStyle14w400greypoppins,
                      ),
                    ),

                    InkWell(
                      onTap: () {
                        AppCustomNavigator.push(
                          context,
                          const CreateAnAccount(),
                        );
                      },
                      child: Center(
                        child: Text(
                          AppText.createaccount,
                          style: Textfontstyle.TextStyle14w400cCA2626poppins,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// 🔹 Top Left Close Button + Text (FIXED)
          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: SafeArea(
              child: Row(
                children: [
                  /// Close Button
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.12),
                          blurRadius: 4,
                        ),
                        BoxShadow(
                          color: Colors.black.withOpacity(0.12),
                          blurRadius: 4,
                        ),
                      ],
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {
                        AppCustomNavigator.replace(
                          context,
                          const BottomNavbar(),
                        );
                      },
                      icon: Icon(
                        Icons.close,
                        color: AppColors.black,
                        size: 16.sp,
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  /// Text next to button
                  Text(
                    AppText.login,
                    style: Textfontstyle.TextStyle22w600c000000poppins,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
