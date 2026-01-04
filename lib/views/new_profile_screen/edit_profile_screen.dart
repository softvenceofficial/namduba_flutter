import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/new_profile_screen/idfntity_vareficaton/uplode_id_screen.dart';
import 'package:nanduba/views/new_profile_screen/widget/underline_textfild.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
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
            const CustomAppbar(title: AppText.personalinfo),
            3.7.height,
            EditableField(
              label: "Legal name",
              hintText: "Edit your name",
              controller: nameController,
            ),
            1.8.height,
            EditableField(
              label: "Phone",
              hintText: "Edit your phone number",
              controller: phoneController,
            ),
            1.8.height,
            EditableField(
              label: "Email",
              hintText: "Edit your email",
              controller: emailController,
            ),
            1.8.height,
            EditableField(
              label: "Driver's license",
              hintText: "Not provider",
              edittext: "Add",
              controller: licenseController,
            ),
            1.8.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Identity verification",
                  style: Textfontstyle.TextStyle14w500c212121poppins.copyWith(
                    fontSize: 12.sp,
                    color: AppColors.textColor,
                  ),
                ),
                InkWell(
                  onTap: () {
                    AppCustomNavigator.push(context, const UplodeIdScreen());
                  },
                  child: Text(
                    "Start",
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
              "Not Started",
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
