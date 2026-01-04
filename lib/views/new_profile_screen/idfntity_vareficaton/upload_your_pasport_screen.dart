import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/new_profile_screen/idfntity_vareficaton/we_will_let_you_know.dart';
import 'package:nanduba/views/new_profile_screen/idfntity_vareficaton/widget/upload_container_widget.dart';

class UploadYourPasportScreen extends StatefulWidget {
  const UploadYourPasportScreen({super.key});

  @override
  State<UploadYourPasportScreen> createState() =>
      _UploadYourPasportScreenState();
}

class _UploadYourPasportScreenState extends State<UploadYourPasportScreen> {
  File? uploadedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
          child: Column(
            children: [
              const CustomAppbar(title: AppText.uploadyourpassport),
              2.7.height,
              Text(
                AppText.makesurephotosnotblurry,
                style: Textfontstyle.TextStyle14w400midgreypoppins.copyWith(
                    fontSize: 10.sp),
              ),
              2.7.height,
              UploadContainer(
                svgPath: AppSvgs.id,
                title: AppText.uploadpage,
                subtitle: AppText.jpegorpng,
                onImageSelected: (File? file) {
                  setState(() {
                    uploadedImage = file;
                  });

                  if (file != null) {
                    debugPrint("Selected image path: ${file.path}");
                  } else {
                    debugPrint("Image removed");
                  }
                },
              ),
              18.height,
              CustomButton(
                label: AppText.coontinue,
                onPressed: () {
                  if (uploadedImage == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please upload your passport image"),
                        duration: Duration(seconds: 2),
                      ),
                    );
                    return;
                  }

                  AppCustomNavigator.push(context, const WeWillLetYouKnow());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
