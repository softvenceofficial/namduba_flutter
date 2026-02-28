import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/new_profile_screen/login_and_security/widget/update_button.dart';
import 'package:nanduba/views/new_profile_screen/marketplace/screen/select_driver_screen.dart';
import 'package:nanduba/views/new_profile_screen/marketplace/widget/chack_box_widget.dart';
import 'package:nanduba/views/new_profile_screen/marketplace/widget/step_input_card.dart';

class CarStep {
  final String title;
  final String subtitle;
  final String hint;

  CarStep({
    required this.title,
    required this.subtitle,
    required this.hint,
  });
}

class SelectVehicleScreen extends StatefulWidget {
  const SelectVehicleScreen({super.key});

  @override
  State<SelectVehicleScreen> createState() => _SelectVehicleScreenState();
}

class _SelectVehicleScreenState extends State<SelectVehicleScreen> {
  final List<CarStep> steps = [
    CarStep(
      title: "Select the car’s manufacturer",
      subtitle: "Make",
      hint: "Vehicle Name",
    ),
    CarStep(
      title: "Select the car’s model",
      subtitle: "Model",
      hint: "Model Name",
    ),
    CarStep(
      title: "Select the production year",
      subtitle: "Yeat",
      hint: "Production Year",
    ),
    CarStep(
      title: "Select the variant",
      subtitle: "Varint",
      hint: "Variant",
    ),
    CarStep(
      title: "Select the vehicle type",
      subtitle: "Type",
      hint: "Vehicle Type",
    ),
    CarStep(
      title: "Select the chassis",
      subtitle: "Shassis",
      hint: "Chassis",
    ),
    CarStep(
      title: "Select the engine",
      subtitle: "Engine",
      hint: "Engine",
    ),
  ];

  int currentStep = 0;
  int _selectedIndex = -1;

  // Initial list of vehicles
  List<Map<String, String>> vehicles = [
    {"name": "BMW X3 ", "plate": "ALJ1679ZM", "image": AppImages.toyota},
    {"name": "TOYOTA HILUX", "plate": "ALJ1679ZM", "image": AppImages.toyota},
  ];

  // Controllers for popup text fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _plateController = TextEditingController();

  // State variables to control which UI is visible
  bool showSearchContainer = false;
  bool showManualInput = false;

  @override
  void dispose() {
    _nameController.dispose();
    _plateController.dispose();
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
                  title: "Select vehicles",
                  svgIconNextToTitle: AppSvgs.searchIcon,
                ),
                2.height,
                Text(
                  "Which vehicles do you want to include?",
                  style: Textfontstyle.TextStyle14w400midgreyinter.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                2.7.height,

                // Vehicle list
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
                            Image.asset(vehicle["image"]!),
                            4.width,
                            Column(
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
                                Text(
                                  vehicle["plate"]!,
                                  style: Textfontstyle
                                      .TextStyle16w500c212121poppins.copyWith(
                                    color: AppColors.midGrey,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
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

                // Conditional area: Add Vehicle / Search Container / StepInputCard
                if (!showSearchContainer && !showManualInput)
                  // Add Vehicle button
                  InkWell(
                    onTap: () {
                      setState(() {
                        showSearchContainer = true; // show search container
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
                          "+ Add Vehicle",
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
                                "Enter Reg number",
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
                                    showManualInput =
                                        true; // show StepInputCard
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
                            "Reg number",
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
                            hintText: "Search Reg number",
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
                                    showSearchContainer =
                                        false; // back to Add Vehicle
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
                  // StepInputCard for manual entry
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
                        AppCustomNavigator.push(
                            context, const SelectDriverScreen());
                        // setState(() {
                        //   showManualInput = false; // finished manual input
                        // });
                      }
                    },
                  ),

                3.7.height,
                if (!showManualInput && !showSearchContainer)
                  CustomButton(
                    label: AppText.coontinue,
                    onPressed: () {
                      AppCustomNavigator.push(
                          context, const SelectDriverScreen());
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
