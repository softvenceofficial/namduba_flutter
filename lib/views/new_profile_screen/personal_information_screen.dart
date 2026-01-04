import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';

class PersonalInformationScreen extends StatefulWidget {
  const PersonalInformationScreen({super.key});

  @override
  State<PersonalInformationScreen> createState() =>
      _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  final phoneController = TextEditingController();
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
                const CustomAppbar(title: AppText.personalinfo),
                3.7.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Legal name",
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
                1.height,
                Container(
                  height: 1,
                  width: double.infinity,
                  color: AppColors.cBEBEBE,
                ),
                1.height,
                CustomTextField(
                  name: 'Frist name',
                  hintText: AppText.email,
                  titleText: AppText.firstName,
                  prefixIcon: SvgPicture.asset(
                    fit: BoxFit.scaleDown,
                    AppSvgs.profileIcon,
                  ),
                  textInputAction: TextInputAction.next,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.email(),
                  ]),
                ),
                1.height,
                CustomTextField(
                  name: 'Last name',
                  hintText: "Doe",
                  titleText: AppText.lastName,
                  prefixIcon: SvgPicture.asset(
                    fit: BoxFit.scaleDown,
                    AppSvgs.profileIcon,
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
                      "Save",
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
                      "Phone",
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
                      "Save",
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
                      "Email",
                      style:
                          Textfontstyle.TextStyle14w500c212121poppins.copyWith(
                        fontSize: 12.sp,
                        color: AppColors.textColor,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        
                      },
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
                1.height,
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
                      "Save",
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
                Text(
                  "Driver’s license ",
                  style: Textfontstyle.TextStyle14w500c212121poppins.copyWith(
                    fontSize: 12.sp,
                    color: AppColors.textColor,
                  ),
                ),
                1.height,
                CustomTextField(
                  name: 'Licence Expiry',
                  hintText: AppText.email,
                  titleText: "Drivers Licence Expiry",
                  prefixIcon: SvgPicture.asset(
                    fit: BoxFit.scaleDown,
                    AppSvgs.calendar,
                  ),
                  textInputAction: TextInputAction.next,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.email(),
                  ]),
                ),
                1.height,
                CustomTextField(
                  name: 'Email',
                  hintText: "License Class",
                  titleText: "License Class",
                  prefixIcon: SvgPicture.asset(
                    fit: BoxFit.scaleDown,
                    AppSvgs.id,
                    color: AppColors.red,
                  ),
                  textInputAction: TextInputAction.next,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.email(),
                  ]),
                ),
                1.height,
                CustomTextField(
                  name: 'Email',
                  hintText: "Issuing Authority",
                  titleText: "Issuing Authority ",
                  prefixIcon: SvgPicture.asset(
                    fit: BoxFit.scaleDown,
                    AppSvgs.id,
                    color: AppColors.red,
                  ),
                  textInputAction: TextInputAction.next,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.email(),
                  ]),
                ),
                1.height,
                CustomTextField(
                  name: 'Email',
                  hintText: "Drivers License Number",
                  titleText: "Drivers License Number",
                  prefixIcon: SvgPicture.asset(
                    fit: BoxFit.scaleDown,
                    AppSvgs.id,
                    color: AppColors.red,
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
                      "Save",
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
                1.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Identity Verification \nProvided ",
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
                4.height,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
