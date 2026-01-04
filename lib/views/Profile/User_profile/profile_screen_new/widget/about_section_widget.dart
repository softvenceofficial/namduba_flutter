import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';

class AboutSectionWidget extends StatelessWidget {
  const AboutSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              AppText.locationLabel,
              style: Textfontstyle.TextStyle12w500c212121poppins.copyWith(
                  color: AppColors.bottomNav),
            ),
            Text(
              AppText.locationValue,
              style: Textfontstyle.TextStyle12w500c212121poppins.copyWith(
                color: AppColors.bottomNav,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        0.2.height,
        Row(
          children: [
            Text(
              AppText.memberSinceLabel,
              style: Textfontstyle.TextStyle12w500c212121poppins.copyWith(
                  color: AppColors.bottomNav),
            ),
            Text(
              AppText.memberSinceValue,
              style: Textfontstyle.TextStyle12w500c212121poppins.copyWith(
                color: AppColors.bottomNav,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
