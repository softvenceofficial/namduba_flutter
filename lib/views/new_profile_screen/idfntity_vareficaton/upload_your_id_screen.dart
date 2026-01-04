import 'dart:io';
import 'package:flutter/material.dart';
import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/new_profile_screen/idfntity_vareficaton/upload_your_pasport_screen.dart';
import 'package:nanduba/views/new_profile_screen/idfntity_vareficaton/widget/upload_container_widget.dart';

class UploadYourId extends StatefulWidget {
  const UploadYourId({super.key});

  @override
  State<UploadYourId> createState() => _UploadYourIdState();
}

class _UploadYourIdState extends State<UploadYourId> {
  File? frontIdImage;
  File? backIdImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
          child: Column(
            children: [
              const CustomAppbar(title: AppText.uploadyourid),
              2.7.height,
              Text(
                AppText.makesurephotosnotblurry,
                style: Textfontstyle.TextStyle14w400midgreypoppins.copyWith(
                  fontSize: 10.sp,
                ),
              ),
              2.7.height,
              // Front ID
              UploadContainer(
                svgPath: AppSvgs.id,
                title: AppText.uploadfont,
                subtitle: AppText.jpegorpng,
                onImageSelected: (File? file) {
                  setState(() {
                    frontIdImage = file;
                  });

                  if (file != null) {
                    debugPrint("Front ID path: ${file.path}");
                  } else {
                    debugPrint("Front ID removed");
                  }
                },
              ),
              3.5.height,
              // Back ID
              UploadContainer(
                svgPath: AppSvgs.addNotes,
                title: AppText.uploadback,
                subtitle: AppText.jpegorpng,
                onImageSelected: (File? file) {
                  setState(() {
                    backIdImage = file;
                  });

                  if (file != null) {
                    debugPrint("Back ID path: ${file.path}");
                  } else {
                    debugPrint("Back ID removed");
                  }
                },
              ),
              3.5.height,
              CustomButton(
                label: AppText.coontinue,
                onPressed: () {
                  if (frontIdImage == null || backIdImage == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content:
                            Text("Please upload both front and back ID images"),
                        duration: Duration(seconds: 2),
                      ),
                    );
                    return;
                  }

                  // Navigate to Passport screen
                  AppCustomNavigator.push(
                    context,
                    const UploadYourPasportScreen(),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
