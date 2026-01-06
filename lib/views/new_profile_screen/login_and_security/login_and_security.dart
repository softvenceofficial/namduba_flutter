import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/new_profile_screen/login_and_security/widget/custom_switch.dart';
import 'package:nanduba/views/new_profile_screen/login_and_security/widget/social_login_row.dart';
import 'package:nanduba/views/new_profile_screen/login_and_security/widget/verification_option.dart';
import 'package:nanduba/views/new_profile_screen/widget/underline_textfild.dart';

class LoginAndSecurity extends StatefulWidget {
  const LoginAndSecurity({super.key});

  @override
  State<LoginAndSecurity> createState() => _LoginAndSecurityState();
}

class _LoginAndSecurityState extends State<LoginAndSecurity> {
  final phoneController = TextEditingController();
  final nameController = TextEditingController();
  bool isOn = false;

  int _selectedVerification = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppbar(title: "Log in & Security"),
                3.7.height,
                EditableField(
                  label: "Passkeys",
                  hintText: "Not added",
                  edittext: "Add",
                  controller: nameController,
                ),
                1.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Password",
                      style:
                          Textfontstyle.TextStyle14w500c212121poppins.copyWith(
                        fontSize: 12.sp,
                        color: AppColors.textColor,
                      ),
                    ),
                    InkWell(
                      child: Text(
                        "Cencel",
                        style: Textfontstyle.TextStyle14w500c212121poppins
                            .copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.textColor,
                          fontSize: 12.sp,
                          color: AppColors.textColor,
                        ),
                      ),
                    ),
                  ],
                ),
                2.2.height,
                CustomTextField(
                  name: 'new password',
                  hintText: "New password",
                  titleText: AppText.newPassword,
                  prefixIcon: SvgPicture.asset(
                    fit: BoxFit.scaleDown,
                    AppSvgs.profileIcon,
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(AppSvgs.eye),
                  ),
                  textInputAction: TextInputAction.next,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.email(),
                  ]),
                ),
                1.height,
                CustomTextField(
                  name: 'Confirmpassword',
                  hintText: "Confirm password",
                  titleText: AppText.confirmPassword,
                  prefixIcon: SvgPicture.asset(
                    fit: BoxFit.scaleDown,
                    AppSvgs.profileIcon,
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(AppSvgs.eye),
                  ),
                  textInputAction: TextInputAction.next,
                  fillColor: AppColors.white,
                  validator: FormBuilderValidators.required(),
                ),
                1.7.height,
                InkWell(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    height: 35,
                    width: 83,
                    decoration: BoxDecoration(
                      color: AppColors.cCA2626,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      "Update",
                      style:
                          Textfontstyle.TextStyle12w500c212121poppins.copyWith(
                              fontSize: 7.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.white),
                    ),
                  ),
                ),
                2.height,
                Container(
                  height: 1,
                  width: double.infinity,
                  color: AppColors.cBEBEBE,
                ),
                2.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "2-step verification ",
                      style:
                          Textfontstyle.TextStyle14w500c212121poppins.copyWith(
                        fontSize: 12.sp,
                        color: AppColors.textColor,
                      ),
                    ),
                    InkWell(
                      child: Text(
                        "Manage",
                        style: Textfontstyle.TextStyle14w500c212121poppins
                            .copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.textColor,
                          fontSize: 12.sp,
                          color: AppColors.textColor,
                        ),
                      ),
                    ),
                  ],
                ),
                1.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "0xxxxxxx56",
                          style: Textfontstyle.TextStyle14w500c212121poppins
                              .copyWith(
                            fontSize: 10.sp,
                            color: AppColors.midGrey,
                          ),
                        ),
                        2.width,
                        Text(
                          "Verified",
                          style: Textfontstyle.TextStyle14w500c212121poppins
                              .copyWith(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.midGrey,
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      child: Text(
                        "Edit",
                        style: Textfontstyle.TextStyle14w500c212121poppins
                            .copyWith(
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.midGrey,
                          fontSize: 10.sp,
                          color: AppColors.midGrey,
                        ),
                      ),
                    ),
                  ],
                ),
                2.height,
                Text(
                  "Phone Number",
                  style: Textfontstyle.TextStyle12w500c212121poppins.copyWith(
                      color: AppColors.midGrey),
                ),
                0.5.height,
                IntlPhoneField(
                  controller: phoneController,
                  disableLengthCheck: true,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: AppColors.black),
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(14.sp),
                        ),
                        borderSide: const BorderSide(color: AppColors.primary),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(14.sp),
                        ),
                        borderSide: const BorderSide(color: AppColors.border),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(14.sp),
                        ),
                        borderSide: const BorderSide(color: AppColors.border),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(14.sp),
                        ),
                        borderSide: const BorderSide(color: AppColors.black),
                      ),
                      errorStyle: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: AppColors.black)),
                ),
                2.height,
                InkWell(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    height: 35,
                    width: 83,
                    decoration: BoxDecoration(
                      color: AppColors.cCA2626,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      "Update",
                      style:
                          Textfontstyle.TextStyle12w500c212121poppins.copyWith(
                              fontSize: 7.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.white),
                    ),
                  ),
                ),
                3.height,
                Text(
                  "Other ways to verify it’s you",
                  style: Textfontstyle.TextStyle14w500c212121poppins.copyWith(
                    fontSize: 12.sp,
                    color: AppColors.midGrey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                .5.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "dav******@gmail.com",
                          style: Textfontstyle.TextStyle14w500c212121poppins
                              .copyWith(
                            fontSize: 10.sp,
                            color: AppColors.midGrey,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                        2.width,
                        Text(
                          "verified",
                          style: Textfontstyle.TextStyle14w500c212121poppins
                              .copyWith(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.normal,
                            color: AppColors.midGrey,
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      child: Text(
                        "Edit",
                        style: Textfontstyle.TextStyle14w500c212121poppins
                            .copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.midGrey,
                          fontSize: 10.sp,
                          color: AppColors.midGrey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                2.height,
                CustomTextField(
                  name: 'Email',
                  hintText: AppText.email,
                  titleText: "Enter Email",
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
                InkWell(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    height: 35,
                    width: 83,
                    decoration: BoxDecoration(
                      color: AppColors.cCA2626,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      "Update",
                      style:
                          Textfontstyle.TextStyle12w500c212121poppins.copyWith(
                              fontSize: 7.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.white),
                    ),
                  ),
                ),
                2.height,

                /// message via app notificaton or sms
                VerificationOption(
                  isSelected: _selectedVerification == 1,
                  title: "Text me",
                  subtitle:
                      "We’ll send you a text message. Standard rates may apply",
                  statusText: "Active",
                  iconPath: AppSvgs.textmeicon,
                  onTap: () {
                    setState(() {
                      _selectedVerification = 1;
                    });
                  },
                ),

                2.height,

                VerificationOption(
                  isSelected: _selectedVerification == 2,
                  title: "App notification",
                  subtitle:
                      "We’ll send you push notifications on your mobile device through the app",
                  statusText: "",
                  iconPath: AppSvgs.phonetik,
                  onTap: () {
                    setState(() {
                      _selectedVerification = 2;
                    });
                  },
                ),

                4.4.height,
                InkWell(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    height: 35,
                    width: 83,
                    decoration: BoxDecoration(
                      color: AppColors.cCA2626,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      "Turn off",
                      style:
                          Textfontstyle.TextStyle12w500c212121poppins.copyWith(
                              fontSize: 7.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.white),
                    ),
                  ),
                ),
                3.height,
                Container(
                  height: 1,
                  width: double.infinity,
                  color: AppColors.cBEBEBE,
                ),
                2.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Sign in with your roadsmart app",
                      style:
                          Textfontstyle.TextStyle14w500c212121poppins.copyWith(
                        fontSize: 12.sp,
                        color: AppColors.textColor,
                      ),
                    ),
                    InkWell(
                      child: Text(
                        "Edit",
                        style: Textfontstyle.TextStyle14w500c212121poppins
                            .copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.textColor,
                          fontSize: 12.sp,
                          color: AppColors.textColor,
                        ),
                      ),
                    ),
                  ],
                ),
                1.height,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "We’ll send a notification to this device to \napprove sign in",
                      style:
                          Textfontstyle.TextStyle12w500c212121poppins.copyWith(
                              color: AppColors.textColor, fontSize: 9.sp),
                    ),
                    SimpleSwitch(
                      value: isOn,
                      onChanged: (val) {
                        setState(() {
                          debugPrint("Switch is On: $isOn");
                          isOn = val;
                        });
                      },
                    ),
                  ],
                ),
                3.2.height,
                const Divider(
                  thickness: 1,
                  color: AppColors.cBEBEBE,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Social sign in ",
                      style:
                          Textfontstyle.TextStyle14w500c212121poppins.copyWith(
                        fontSize: 12.sp,
                        color: AppColors.textColor,
                      ),
                    ),
                    InkWell(
                      child: Text(
                        "Edit",
                        style: Textfontstyle.TextStyle14w500c212121poppins
                            .copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.textColor,
                          fontSize: 12.sp,
                          color: AppColors.textColor,
                        ),
                      ),
                    ),
                  ],
                ),
                1.3.height,
                SocialLoginRow(
                  platform: "Facebook",
                  status: "Unlinked",
                ),

                0.5.height,

                SocialLoginRow(
                  platform: "Google",
                  status: "Unlinked",
                ),

                0.5.height,

                SocialLoginRow(
                  platform: "Apple ID",
                  status: "Unlinked",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
