import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';

import 'package:nanduba/views/auth/add_info/agreement_widget.dart';

class FinishSigningUpScreen extends StatelessWidget {
  const FinishSigningUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // CustomPaint(
          //   painter: CommonBackgroundPaint(),
          //   size: Size(100.w, 100.h),
          // ),
          SafeArea(
              child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomAppbar(
                    title: AppText.finishsignin,
                  ),
                  2.7.height,
                  Text(
                    AppText.personalise,
                    style: Textfontstyle.TextStyle18w700c212121poppins,
                  ),
                  2.height,
                  CustomTextField(
                    name: 'lastName',
                    hintText: AppText.hintext,
                    titleText: AppText.usernameoptional,
                    prefixIcon: SvgPicture.asset(
                      fit: BoxFit.scaleDown,
                      AppSvgs.profileIcon,
                    ),
                    textInputAction: TextInputAction.next,
                    validator: FormBuilderValidators.required(),
                  ),
                  .5.height,
                  Text(
                    AppText.createusername,
                    style: Textfontstyle.TextStyle14w400midgreyinter,
                  ),
                  3.7.height,
                  CustomTextField(
                    name: 'lastName',
                    hintText: AppText.dateofbirth,
                    titleText: AppText.dateofbirth,
                    prefixIcon: SvgPicture.asset(
                      fit: BoxFit.scaleDown,
                      AppSvgs.calendar,
                    ),
                    textInputAction: TextInputAction.next,
                    validator: FormBuilderValidators.required(),
                  ),
                  3.4.height,
                  CustomTextField(
                    name: 'lastName',
                    hintText: AppText.ddmmyy,
                    titleText: AppText.driverslicence,
                    prefixIcon: SvgPicture.asset(
                      fit: BoxFit.scaleDown,
                      AppSvgs.calendar,
                    ),
                    textInputAction: TextInputAction.next,
                    validator: FormBuilderValidators.required(),
                  ),
                  4.8.height,
                  Padding(
                    padding: const EdgeInsets.only(left: 29),
                    child: Text(
                      AppText.datetimeofagreement,
                      style:
                          Textfontstyle.TextStyle14w400c212121poppins.copyWith(
                              fontSize: 12.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                  0.6.height,
                  const AgreementWidget(),
                  2.6.height,
                  CustomButton(
                    textcolor: AppColors.cCA2626.withAlpha(100),
                    backgroundColor: AppColors.cCA2626.withAlpha(50),
                    borderColor: Colors.transparent,
                    label: AppText.agreeAndCont,
                    onPressed: () {
                      // AppCustomNavigator.push(
                      //     context, const AddInfoScreen());
                    },
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
