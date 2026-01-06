import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/new_profile_screen/idfntity_vareficaton/uplode_id_screen.dart';
import 'package:nanduba/views/new_profile_screen/login_and_security/login_and_security.dart';
import 'package:nanduba/views/new_profile_screen/login_and_security/widget/simplify_your_signin_widget.dart';
import 'package:nanduba/views/new_profile_screen/widget/underline_textfild.dart';

class LoginAndSecurityScreen extends StatefulWidget {
  const LoginAndSecurityScreen({super.key});

  @override
  State<LoginAndSecurityScreen> createState() => _LoginAndSecurityScreenState();
}

class _LoginAndSecurityScreenState extends State<LoginAndSecurityScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final licenseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppbar(title: "Log in & Security"),
            3.7.height,
            EditableField(
              label: "Passkeys",
              hintText: "Not added",
              edittext: "Add",
              onEditTap: () {
                showModalBottomSheet(
                    backgroundColor: AppColors.white,
                    context: context,
                    builder: (context) {
                      return const SimplifyYourSigninWidget();
                    });
              },
              controller: nameController,
            ),
            1.8.height,
            EditableField(
              label: "Password ",
              hintText: "Last updated a year ago",
              controller: phoneController,
            ),
            1.8.height,
            EditableField(
              label: "2-step verification ",
              hintText: "0xxxxxxx56",
              edittext: "Manage",
              controller: emailController,
            ),
            1.8.height,
            EditableField(
              label: "Sign in with roadsmart app",
              hintText: "Not Enabled",
              controller: licenseController,
            ),
            1.8.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Social sign in ",
                  style: Textfontstyle.TextStyle14w500c212121poppins.copyWith(
                    fontSize: 12.sp,
                    color: AppColors.textColor,
                  ),
                ),
                InkWell(
                  onTap: () {
                    AppCustomNavigator.push(context, const LoginAndSecurity());
                  },
                  child: Text(
                    "Edit ",
                    style: Textfontstyle.TextStyle14w500c212121poppins.copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.textColor,
                      fontSize: 12.sp,
                      color: AppColors.textColor,
                    ),
                  ),
                ),
              ],
            ),
            0.5.height,
            Text(
              "Not linked",
              style: Textfontstyle.TextStyle14w500c212121poppins.copyWith(
                fontSize: 10.sp,
                color: AppColors.textColor,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
