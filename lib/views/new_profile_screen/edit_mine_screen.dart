// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';

class EditMineScreen extends StatefulWidget {
  const EditMineScreen({super.key});

  @override
  State<EditMineScreen> createState() => _EditMineScreenState();
}

class _EditMineScreenState extends State<EditMineScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppbar(title: AppText.editlinfo),
                SizedBox(height: 20),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      AppImages.profileimage,
                      height: 120,
                      width: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    height: 35,
                    width: 160,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.camera_alt,
                                color: AppColors.white, size: 16),
                            SizedBox(width: 8),
                            Text(
                              "Change Photo",
                              style: Textfontstyle.TextStyle14w400c212121poppins
                                  .copyWith(
                                color: AppColors.white,
                                fontSize: 10.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Display Name",
                  style: Textfontstyle.TextStyle12w500c212121poppins.copyWith(
                    fontSize: 10.sp,
                  ),
                ),
                SizedBox(height: 10),
                CustomTextField(
                  hintText: "Enter your display name",
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: SvgPicture.asset(
                      AppSvgs.profileIcon,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Location",
                  style: Textfontstyle.TextStyle12w500c212121poppins.copyWith(
                    fontSize: 10.sp,
                  ),
                ),
                SizedBox(height: 10),
                CustomTextField(
                  hintText: "Enter your location",
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: SvgPicture.asset(
                      AppSvgs.location,
                      height: 8,
                      width: 8,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Bio",
                  style: Textfontstyle.TextStyle12w500c212121poppins.copyWith(
                    fontSize: 10.sp,
                  ),
                ),
                SizedBox(height: 10),
                CustomTextField(
                  maxLines: 5,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24.0),
        child: CustomButton(label: 'Save', onPressed: () {}),
      ),
    );
  }
}
