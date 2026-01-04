import 'dart:io';


import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/new_profile_screen/idfntity_vareficaton/upload_your_id_screen.dart';
import 'package:nanduba/views/new_profile_screen/idfntity_vareficaton/widget/upload_container_widget.dart';

class DrivingLicenseScreen extends StatefulWidget {
  const DrivingLicenseScreen({super.key});

  @override
  State<DrivingLicenseScreen> createState() => _DrivingLicenseScreenState();
}

class _DrivingLicenseScreenState extends State<DrivingLicenseScreen> {
  File? frontLicenseImage;
  File? backLicenseImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
          child: Column(
            children: [
              const CustomAppbar(title: AppText.uploadyourlicense),
              2.7.height,
              Text(
                AppText.makesurephotosnotblurry,
                style: Textfontstyle.TextStyle14w400midgreypoppins.copyWith(
                  fontSize: 10.sp,
                ),
              ),
              2.7.height,
              // Front License
              UploadContainer(
                svgPath: AppSvgs.id,
                title: AppText.uploadfont,
                subtitle: AppText.jpegorpng,
                onImageSelected: (File? file) {
                  setState(() {
                    frontLicenseImage = file;
                  });

                  if (file != null) {
                    debugPrint("Front license image path: ${file.path}");
                  } else {
                    debugPrint("Front license image removed");
                  }
                },
              ),
              3.5.height,
              // Back License
              UploadContainer(
                svgPath: AppSvgs.addNotes,
                title: AppText.uploadback,
                subtitle: AppText.jpegorpng,
                onImageSelected: (File? file) {
                  setState(() {
                    backLicenseImage = file;
                  });

                  if (file != null) {
                    debugPrint("Back license image path: ${file.path}");
                  } else {
                    debugPrint("Back license image removed");
                  }
                },
              ),
              3.5.height,
              // Continue Button
              CustomButton(
                label: AppText.coontinue,
                onPressed: () {
                  if (frontLicenseImage == null || backLicenseImage == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                            "Please upload both front and back license images"),
                        duration: Duration(seconds: 2),
                      ),
                    );
                    return;
                  }

           
                  AppCustomNavigator.push(
                    context,
                    const UploadYourId(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
