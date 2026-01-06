import 'package:flutter/material.dart';
import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/new_profile_screen/marketplace/widget/chack_box_widget.dart';

class SelectVehicleScreen extends StatefulWidget {
  const SelectVehicleScreen({super.key});

  @override
  State<SelectVehicleScreen> createState() => _SelectVehicleScreenState();
}

class _SelectVehicleScreenState extends State<SelectVehicleScreen> {
  final List<CarStep> steps = [
    CarStep(
      title: "Select the car’s manufacturer",
      hint: "Vehicle Name",
    ),
    CarStep(
      title: "Select the car’s model",
      hint: "Model Name",
    ),
    CarStep(
      title: "Select the production year",
      hint: "Production Year",
    ),
    CarStep(
      title: "Select the variant",
      hint: "Variant",
    ),
    CarStep(
      title: "Select the vehicle type",
      hint: "Vehicle Type",
    ),
    CarStep(
      title: "Select the chassis",
      hint: "Chassis",
    ),
    CarStep(
      title: "Select the engine",
      hint: "Engine",
    ),
  ];

  int _selectedIndex = -1;
  int currentStep = 0;

  // Initial list of vehicles
  List<Map<String, String>> vehicles = [
    {"name": "ZMW", "plate": "ALJ1679ZM", "image": AppImages.toyota},
    {"name": "ZMW", "plate": "ALJ1679ZM", "image": AppImages.toyota},
  ];

  // Controllers for popup text fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _plateController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _plateController.dispose();
    super.dispose();
  }

  // void _showAddVehicleDialog() {
  //   _nameController.text = "";
  //   _plateController.text = "";

  //   showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       backgroundColor: AppColors.white,
  //       title: Text("Add Vehicle",
  //           style: Textfontstyle.TextStyle16w500c212121poppins),
  //       content: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           // Custom Text Field for Vehicle Name
  //           CustomTextField(
  //             controller: _nameController,
  //             hintText: "Vehicle Name",
  //             borderRadius: 8,
  //           ),
  //           1.height,
  //           // Custom Text Field for Vehicle Plate
  //           CustomTextField(
  //             controller: _plateController,
  //             hintText: "Vehicle Plate",
  //             borderRadius: 8,
  //           ),
  //         ],
  //       ),
  //       actions: [
  //         TextButton(
  //           onPressed: () {
  //             Navigator.pop(context);
  //           },
  //           child: Text("Cancel",
  //               style: Textfontstyle.TextStyle14w400midgreyinter),
  //         ),
  //         ElevatedButton(
  //           onPressed: () {
  //             setState(() {
  //               vehicles.add({
  //                 "name": _nameController.text.isEmpty
  //                     ? "ZMW"
  //                     : _nameController.text,
  //                 "plate": _plateController.text.isEmpty
  //                     ? "ALJ1679ZM"
  //                     : _plateController.text,
  //                 "image": AppImages.toyota,
  //               });
  //               _selectedIndex = vehicles.length - 1; // Select the new vehicle
  //             });
  //             Navigator.pop(context);
  //           },
  //           child: const Text("Add"),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
          child: Column(
            children: [
              CustomAppbar(title: "Select vehicles"),
              2.height,
              Text(
                "Please choose the type of insurance you need",
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
                        _selectedIndex = index; // select only this vehicle
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

              // Add Vehicle Button
              InkWell(
                // onTap: _showAddVehicleDialog,
                child: CustomContainer(
                  isBorder: _selectedIndex == vehicles.length,
                  height: 60,
                  width: double.infinity,
                  hpadding: 18,
                  vpadding: 18,
                  child: Center(
                    child: Text(
                      "+ Add Vehicle",
                      style:
                          Textfontstyle.TextStyle16w500c212121poppins.copyWith(
                        color: AppColors.textColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              // StepInputCard(
              //   title: steps[currentStep].title,
              //   hintText: steps[currentStep].hint,
              //   controller: _nameController,
              //   progress: (currentStep + 1) / steps.length,
              //   onBack: currentStep > 0
              //       ? () => setState(() => currentStep--)
              //       : null,
              //   onClear: () {
              //     _nameController.clear();
              //   },
              //   onNext: () {
              //     if (currentStep < steps.length - 1) {
              //       setState(() {
              //         currentStep++;
              //       });
              //     } else
              //       ();
              //   },
              // ),

              3.7.height,
              CustomButton(
                label: AppText.coontinue,
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}

class StepInputCard extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;
  final double progress;
  final VoidCallback? onBack;
  final VoidCallback onClear;
  final VoidCallback? onNext;

  const StepInputCard({
    super.key,
    required this.title,
    required this.hintText,
    required this.controller,
    required this.progress,
    this.onBack,
    required this.onClear,
    this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 12),

            CustomTextField(
              controller: controller,
              hintText: hintText,
              borderRadius: 8,
              readOnly: true,
            ),

            const SizedBox(height: 14),

            /// 🔹 PROGRESS BAR (red)
            LinearProgressIndicator(
              borderRadius: BorderRadius.circular(8),
              value: progress,
              minHeight: 11,
              backgroundColor: AppColors.secondary,
              color: AppColors.primary,
            ),

            2.height,

            /// 🔹 BUTTONS (⬅ ❌ ➡)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// BACK
                InkWell(
                  onTap: onBack,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.primary),
                    child: Icon(
                      Icons.chevron_left,
                      color: AppColors.white,
                    ),
                  ),
                ),
                2.width,

                /// CLEAR
                InkWell(
                  onTap: onClear,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.primary.withAlpha(20)),
                    child: Icon(
                      Icons.close,
                      color: AppColors.primary,
                    ),
                  ),
                ),
                2.width,

                /// NEXT
                InkWell(
                  onTap: onNext,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.primary),
                    child: Icon(
                      Icons.chevron_right,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CarStep {
  final String title;
  final String hint;

  CarStep({
    required this.title,
    required this.hint,
  });
}
