import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';

class SimplifyYourSigninWidget extends StatefulWidget {
  const SimplifyYourSigninWidget({super.key});

  @override
  State<SimplifyYourSigninWidget> createState() =>
      _SimplifyYourSigninWidgetState();
}

class _SimplifyYourSigninWidgetState extends State<SimplifyYourSigninWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(14))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              AppCustomNavigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SvgPicture.asset(
                  AppSvgs.closeCircle,
                  color: AppColors.primary,
                )
              ],
            ),
          ),
          Text(
            "Simplify your sign-in",
            style: Textfontstyle.TextStyle14w400midgreyinter.copyWith(
                fontSize: 12.sp,
                color: AppColors.textColor,
                fontWeight: FontWeight.bold),
          ),
          0.5.height,
          Text(
            "Sign in with your face, fingerprint or PIN",
            style: Textfontstyle.TextStyle14w400midgreyinter.copyWith(
                fontSize: 10.sp,
                color: AppColors.grey,
                fontWeight: FontWeight.w600),
          ),
          8.2.height,
          CustomButton(
            label: AppText.coontinue,
            onPressed: () {},
          ),
          1.height,
          InkWell(
            onTap: () {
              AppCustomNavigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  "Skip for now",
                  style: Textfontstyle.TextStyle14w400midgreyinter.copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.textColor,
                      fontSize: 10.sp,
                      color: AppColors.grey,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
