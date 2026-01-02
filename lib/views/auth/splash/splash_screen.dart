import 'package:nanduba/export.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    config();
  }

  config() async {
    await Future.delayed(
      (const Duration(milliseconds: 1500)),
    ).whenComplete(
      () => AppCustomNavigator.replace(
        context,
        const SigninSignupScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          CustomPaint(
            painter: SplashBackgroundPainter(),
            size: Size(100.w, 100.h),
          ),
          Center(
            child: Image.asset(
              AppImages.logo,
              filterQuality: FilterQuality.high,
              isAntiAlias: true,
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }
}
