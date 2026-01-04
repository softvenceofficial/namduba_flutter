import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/new_profile_screen/personal_information_screen.dart';

class WeWillLetYouKnow extends StatefulWidget {
  const WeWillLetYouKnow({super.key});

  @override
  State<WeWillLetYouKnow> createState() => _WeWillLetYouKnowState();
}

class _WeWillLetYouKnowState extends State<WeWillLetYouKnow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 4,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppText.wewilllet,
                style: Textfontstyle.TextStyle18w700c212121poppins,
              ),
              1.6.height,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  textAlign: TextAlign.center,
                  AppText.wewillletyouknow,
                  style: Textfontstyle.TextStyle14w400midgreypoppins.copyWith(
                      fontSize: 10.sp),
                ),
              ),
              4.5.height,
              InkWell(
                onTap: () {
                  AppCustomNavigator.push(
                      context, const PersonalInformationScreen());
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 45,
                  width: 180,
                  decoration: BoxDecoration(
                    color: AppColors.cCA2626,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "Got it",
                    style: Textfontstyle.TextStyle12w500c212121poppins.copyWith(
                        fontWeight: FontWeight.bold, color: AppColors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
