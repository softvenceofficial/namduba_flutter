import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/new_profile_screen/login_and_security/widget/update_button.dart';
import 'package:nanduba/views/new_profile_screen/marketplace/screen/quriy_screen.dart';
import 'package:nanduba/views/new_profile_screen/marketplace/widget/chack_box_widget.dart';
import 'package:nanduba/views/new_profile_screen/marketplace/widget/step_input_card.dart';

class DriverSteps {
  final String title;
  final String subtitle;
  final String hint;

  DriverSteps({
    required this.title,
    required this.subtitle,
    required this.hint,
  });
}

class SelectDriverScreen extends StatefulWidget {
  const SelectDriverScreen({super.key});

  @override
  State<SelectDriverScreen> createState() => _SelectDriverScreenState();
}

class _SelectDriverScreenState extends State<SelectDriverScreen> {
  final List<DriverSteps> steps = [
    DriverSteps(
      title: "Enter the driver's full name",
      subtitle: "Full Name",
      hint: "Driver Name",
    ),
    DriverSteps(
      title: "Enter the driver's license number",
      subtitle: "License No",
      hint: "License Number",
    ),
    DriverSteps(
      title: "Select the driver's date of birth",
      subtitle: "Date of Birth",
      hint: "DD/MM/YYYY",
    ),
    DriverSteps(
      title: "Enter the driver's contact number",
      subtitle: "Contact",
      hint: "Phone Number",
    ),
    DriverSteps(
      title: "Enter the driver's address",
      subtitle: "Address",
      hint: "Residential Address",
    ),
    DriverSteps(
      title: "How are they listed on their license?",
      subtitle: "gender",
      hint: "Select gender ",
    ),
    DriverSteps(
      title: "How is Alice’s related to you?",
      subtitle: "Relationship",
      hint: "Select",
    ),
  ];

  int currentStep = 0;
  int _selectedIndex = -1;

  // Initial list of vehicles
  List<Map<String, String>> vehicles = [
    {"name": "ALAN SMITH", "plate": "ALJ1679ZM", "image": AppSvgs.drivericon},
    {"name": "MARY WRIGHT", "plate": "ALJ1679ZM", "image": AppSvgs.drivericon},
  ];

  // Controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _plateController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  // State variables
  bool showSearchContainer = false;
  bool showManualInput = false;

  @override
  void dispose() {
    _nameController.dispose();
    _plateController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CustomAppbar(
                  centerTitle: true,
                  isborder: true,
                  title: "Select drivers",
                  svgIconNextToTitle: AppSvgs.searchIcon,
                ),
                2.height,
                Text(
                  "Who are the drivers you want to include?",
                  style: Textfontstyle.TextStyle14w400midgreyinter.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                2.7.height,

                // Driver list
                ...List.generate(vehicles.length, (index) {
                  final vehicle = vehicles[index];
                  final isSelected = _selectedIndex == index;

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      child: CustomContainer(
                        isBorder: isSelected,
                        height: 60,
                        width: double.infinity,
                        hpadding: 10,
                        vpadding: 10,
                        child: Row(
                          children: [
                            SvgPicture.asset(vehicle["image"]!),
                            4.width,
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  vehicle["name"]!,
                                  style: Textfontstyle
                                      .TextStyle16w500c212121poppins.copyWith(
                                    color: AppColors.textColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            CustomCheckbox(
                              isChecked: isSelected,
                              onTap: () {
                                setState(() {
                                  _selectedIndex = index;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),

                2.1.height,

                // Conditional area
                if (!showSearchContainer && !showManualInput)
                  // Add Vehicle button
                  InkWell(
                    onTap: () {
                      setState(() {
                        showSearchContainer = true;
                      });
                    },
                    child: CustomContainer(
                      isBorder: _selectedIndex == vehicles.length,
                      height: 60,
                      width: double.infinity,
                      hpadding: 18,
                      vpadding: 18,
                      child: Center(
                        child: Text(
                          "+ Add Driver",
                          style: Textfontstyle.TextStyle16w500c212121poppins
                              .copyWith(
                            color: AppColors.textColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),

                if (showSearchContainer && !showManualInput)
                  // Search Container
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 0.4,
                          spreadRadius: 1,
                          offset: const Offset(0, 0),
                          color: AppColors.black.withAlpha(20),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Search driver",
                                style:
                                    Textfontstyle.TextStyle12w500c212121poppins
                                        .copyWith(
                                            color: AppColors.c343434,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 12.sp),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    showManualInput = true;
                                  });
                                },
                                child: Text(
                                  "Enter manually",
                                  style: Textfontstyle
                                          .TextStyle12w500c212121poppins
                                      .copyWith(
                                          color: AppColors.c707070,
                                          fontSize: 8.sp,
                                          fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          1.height,
                          Text(
                            "Enter roadsmart number",
                            style: Textfontstyle.TextStyle12w500c212121poppins
                                .copyWith(
                                    color: AppColors.c707070,
                                    fontSize: 8.sp,
                                    fontWeight: FontWeight.normal),
                          ),
                          1.height,
                          CustomTextField(
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: SvgPicture.asset(AppSvgs.searchIcon),
                            ),
                            hintText: "Search rs number or license number  ",
                            borderRadius: 16,
                            readOnly: false,
                          ),
                          2.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    showSearchContainer = false;
                                  });
                                },
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: AppColors.primary.withAlpha(20),
                                  ),
                                  child: const Icon(
                                    Icons.close,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                              2.width,
                              UpdateButton(
                                title: "Search",
                                onTap: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                if (showManualInput)
                  StepInputCard(
                    subtitle: steps[currentStep].subtitle,
                    title: steps[currentStep].title,
                    hintText: steps[currentStep].hint,
                    controller: _nameController,
                    progress: (currentStep + 1) / steps.length,
                    isLastStep: currentStep == steps.length - 1,
                    onBack: currentStep > 0
                        ? () => setState(() {
                              currentStep--;
                              _nameController.clear();
                            })
                        : null,
                    onClear: () {
                      _nameController.clear();
                      setState(() {
                        showManualInput = false;
                      });
                    },
                    onNext: () {
                      if (currentStep < steps.length - 1) {
                        setState(() {
                          currentStep++;
                          _nameController.clear();
                        });
                      } else {
                        AppCustomNavigator.push(context, const QuriyScreen());
                      }
                    },
                    customField: currentStep == 0
                        ? Row(
                            children: [
                              const Expanded(
                                child: CustomTextField(
                                  titleText: "First Name",
                                  hintText: "First Name",
                                  borderRadius: 8,
                                ),
                              ),
                              8.width,
                              const Expanded(
                                child: CustomTextField(
                                  titleText: "Last Name",
                                  hintText: "Last Name",
                                  borderRadius: 8,
                                ),
                              ),
                            ],
                          )
                        : null,
                  ),

                3.7.height,
                if (!showManualInput && !showSearchContainer)
                  CustomButton(
                    label: AppText.coontinue,
                    onPressed: () {
                      AppCustomNavigator.push(context, const QuriyScreen());
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
