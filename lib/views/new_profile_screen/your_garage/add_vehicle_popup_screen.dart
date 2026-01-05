import 'package:flutter/material.dart';
import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/new_profile_screen/your_garage/add_a_vehicle_screen.dart';

class AddVehicleScreen extends StatefulWidget {
  const AddVehicleScreen({super.key});

  @override
  State<AddVehicleScreen> createState() => _AddVehicleScreenState();
}

class _AddVehicleScreenState extends State<AddVehicleScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          width: double.infinity,
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppText.addVehicle,
                    style: Textfontstyle.TextStyle18w600c212121poppins.copyWith(
                        fontSize: 12.sp, color: AppColors.textColor),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    customBorder: const CircleBorder(),
                    child: Container(
                      height: 22,
                      width: 22,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.red,
                          width: 1.5,
                        ),
                      ),
                      padding: const EdgeInsets.all(4),
                      child: const Icon(
                        Icons.close,
                        color: AppColors.red,
                        size: 12,
                      ),
                    ),
                  )
                ],
              ),
              0.7.height,
              Text(
                AppText.whattypeofvehicle,
                style: Textfontstyle.TextStyle14w400midgreypoppins,
              ),
              3.2.height,

              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        AppCustomNavigator.push(
                            context, const AddAVehicleScreen());
                      },
                      child: Container(
                        height: 141,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppImages.carImage,
                              height: 23,
                              width: 60,
                            ),
                            1.height,
                            Text(
                              "Car or Truck",
                              style: Textfontstyle.TextStyle16w500c212121poppins
                                  .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w900,
                                      color: AppColors.c5D5D5D),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  5.width, // space between squares
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        AppCustomNavigator.push(
                            context, const AddAVehicleScreen());
                      },
                      child: Container(
                        height: 141,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          border:
                              Border.all(color: AppColors.cBEBEBE, width: 1.5),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppImages.bikeImage,
                              height: 33,
                              width: 80,
                            ),
                            1.height,
                            Text(
                              "Motorbike",
                              style: Textfontstyle.TextStyle16w500c212121poppins
                                  .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w900,
                                      color: AppColors.c5D5D5D),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              3.height,

              // Second Row (Trailer & Tools)
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        AppCustomNavigator.push(
                            context, const AddAVehicleScreen());
                      },
                      child: Container(
                        height: 141,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          border:
                              Border.all(color: AppColors.cBEBEBE, width: 1.5),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppImages.trailerImage,
                              height: 40,
                              width: 90,
                            ),
                            1.height,
                            Text(
                              "Trailer",
                              style: Textfontstyle.TextStyle16w500c212121poppins
                                  .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w900,
                                      color: AppColors.c5D5D5D),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  5.width,
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        AppCustomNavigator.push(
                            context, const AddAVehicleScreen());
                      },
                      child: Container(
                        height: 141,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          border:
                              Border.all(color: AppColors.cBEBEBE, width: 1.5),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppImages.toolsImage,
                              height: 33,
                              width: 90,
                            ),
                            1.height,
                            Text(
                              "Plant or \nMachinery",
                              style: Textfontstyle.TextStyle16w500c212121poppins
                                  .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w900,
                                      color: AppColors.c5D5D5D),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
