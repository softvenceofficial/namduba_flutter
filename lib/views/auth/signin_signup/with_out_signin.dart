import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/auth/create_an_account/create_an_account.dart';
import 'package:nanduba/views/auth/signin_page/signin_screen.dart';

class WithOutSignin extends StatefulWidget {
  const WithOutSignin({super.key});

  @override
  State<WithOutSignin> createState() => _WithOutSigninState();
}

class _WithOutSigninState extends State<WithOutSignin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          CustomPaint(
            size: Size(100.w, 200.h),
            painter: SignInSignUpBackgroundPaint(),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  6.2.height,

                  /// Title
                  Text(
                    "Sign in for a unique experience",
                    textAlign: TextAlign.center,
                    style: Textfontstyle.TextStyle18w700c212121poppins.copyWith(
                        fontSize: 18.sp),
                  ),

                  3.6.height,

                  /// Sign In Button
                  CustomButton(
                    width: double.infinity,
                    label: "Sign in",
                    onPressed: () {
                      // Navigate
                      AppCustomNavigator.push(context, const SigninScreen());
                    },
                  ),

                  3.2.height,

                  ///  Continue as Guest
                  CustomButton(
                    width: double.infinity,
                    label: "Create account",
                    backgroundColor: Colors.white,
                    textcolor: AppColors.textColor,
                    borderRadius: 16.sp,
                    onPressed: () {
                      AppCustomNavigator.push(context, const CreateAnAccount());
                    },
                  ),

                  8.height,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
