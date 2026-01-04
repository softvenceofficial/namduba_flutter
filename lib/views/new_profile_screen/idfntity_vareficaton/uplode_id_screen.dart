
import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/new_profile_screen/idfntity_vareficaton/driving_license_screen.dart';
import 'package:nanduba/views/new_profile_screen/idfntity_vareficaton/widget/counrty_seleted_button.dart';

class UplodeIdScreen extends StatefulWidget {
  const UplodeIdScreen({super.key});

  @override
  State<UplodeIdScreen> createState() => _UplodeIdScreenState();
}

class _UplodeIdScreenState extends State<UplodeIdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppbar(title: AppText.uploadyourid),
              2.7.height,
              Text(
                AppText.uploadidwarning,
                style: Textfontstyle.TextStyle14w400midgreypoppins.copyWith(
                    fontSize: 10.sp),
              ),
              2.7.height,
              const Text('Issuing Contry'),
              0.5.height,
              CountryDropdown(
                initialValue: "India",
                onChanged: (value) {
                  debugPrint("Selected country: $value");
                },
              ),
              1.height,
              CustomTextField(
                onTap: () {
                  AppCustomNavigator.push(
                      context, const DrivingLicenseScreen());
                },
                readOnly: true,
                borderRadius: 8,
                hintText: "Driving license",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: SvgPicture.asset(
                    AppSvgs.carIcon,
                    color: AppColors.red,
                    height: 4,
                    width: 4,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              1.height,
              CustomTextField(
                onTap: () {
                  AppCustomNavigator.push(
                      context, const DrivingLicenseScreen());
                },
                readOnly: true,
                borderRadius: 8,
                hintText: "Passport",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: SvgPicture.asset(
                    AppSvgs.passporticon,
                    color: AppColors.red,
                    height: 4,
                    width: 4,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              1.height,
              CustomTextField(
                onTap: () {
                  AppCustomNavigator.push(
                      context, const DrivingLicenseScreen());
                },
                readOnly: true,
                borderRadius: 8,
                hintText: "NRC",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: SvgPicture.asset(
                    AppSvgs.id,
                    color: AppColors.red,
                    height: 4,
                    width: 4,
                    fit: BoxFit.contain,
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
