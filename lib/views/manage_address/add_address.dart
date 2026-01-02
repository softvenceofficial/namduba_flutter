import 'package:flutter/material.dart';
import 'package:nanduba/export.dart';
import 'package:country_picker/country_picker.dart' as cp;

import '../../widgets/core/filter_checks.dart';
import '../../widgets/core/my_text.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({super.key});

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  TextEditingController countryController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController expiryDateController1 = TextEditingController();
  final TextEditingController expiryDateController2 = TextEditingController();

  String buttonText = "Add New Address";

  @override
  void initState() {
    super.initState();
    // Add listeners to each controller
    addressController.addListener(_updateButtonText);
    cityController.addListener(_updateButtonText);
    expiryDateController1.addListener(_updateButtonText);
    expiryDateController2.addListener(_updateButtonText);
  }

  void _updateButtonText() {
    setState(() {
      if (addressController.text.isNotEmpty &&
          cityController.text.isNotEmpty &&
          expiryDateController1.text.isNotEmpty &&
          expiryDateController2.text.isNotEmpty) {
        buttonText = "Save Changes";
      } else {
        buttonText = "Add New Address";
      }
    });
  }

  @override
  void dispose() {
    // Dispose controllers
    addressController.dispose();
    cityController.dispose();
    expiryDateController1.dispose();
    expiryDateController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0.w),
          child: Column(
            children: [
              2.height,
              CustomAppbar(title: "Add Address"),
              4.height,
              CustomContainer(
                hpadding: 4.w,
                vpadding: 2.h,
                borderRadius: 20,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: MyText(
                        text: 'Address',
                        color: AppColors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    0.5.height,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: MyText(
                        text: 'Please fill the address details below',
                        color: AppColors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 10.sp,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    2.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MyText(
                          text: 'Address',
                          color: AppColors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 10.sp,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                AppSvgs.gps,
                                height: 2.h,
                                color: AppColors.primary,
                              ),
                              MyText(
                                text: 'Use Current Location',
                                color: AppColors.primary,
                                fontWeight: FontWeight.w400,
                                fontSize: 10.sp,
                                textAlign: TextAlign.center,
                                decoration: TextDecoration.underline,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    0.5.height,
                    CustomTextField(
                      controller: addressController, // Assign controller
                      name: "Enter address",
                      hintText: "Enter address",
                      hintStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.verylightGreen,
                        ),
                      ),
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.verylightGreen,
                        ),
                      ),
                      prefixIcon: SvgPicture.asset(
                        AppSvgs.location2,
                        height: 2.h,
                        color: AppColors.primary,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    2.height,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: MyText(
                        text: 'Address line 2 (Optional)',
                        color: AppColors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 10.sp,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    0.5.height,
                    CustomTextField(
                      controller: cityController, // Assign controller
                      name: "Card Number",
                      hintText: "Address line 2 (Optional)",
                      hintStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.verylightGreen,
                        ),
                      ),
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.verylightGreen,
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: SvgPicture.asset(
                        AppSvgs.city,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    2.height,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: MyText(
                        text: 'Town/City',
                        color: AppColors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 10.sp,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    0.5.height,
                    CustomTextField(
                      controller: expiryDateController1, // Assign controller
                      name: "Expiry Date",
                      hintText: "Town/City",
                      hintStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.verylightGreen,
                        ),
                      ),
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.verylightGreen,
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: SvgPicture.asset(
                        AppSvgs.state,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    2.height,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: MyText(
                        text: 'Country',
                        color: AppColors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 10.sp,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    0.5.height,
                    CustomTextField(
                      name: 'regnumber',
                      hintText: "Country",
                      hintStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.verylightGreen,
                        ),
                      ),
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.verylightGreen,
                        ),
                      ),
                      readOnly: true,
                      controller: countryController,
                      prefixIcon: SvgPicture.asset(
                        AppSvgs.global,
                        fit: BoxFit.scaleDown,
                        color: AppColors.primary,
                      ),
                      onTap: () {
                        cp.showCountryPicker(
                          context: context,
                          showPhoneCode: false,
                          onSelect: (cp.Country country) {
                            countryController.text = country.name;
                          },
                        );
                      },
                      suffixIcon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: AppColors.darkGrey,
                      ),
                    ),
                    2.height,
                    FilterChecks(
                      title: "Make it default",
                      tick: AppColors.primary,
                      backgroundColor: Colors.white,
                    ),
                  ],
                ),
              ),
              Spacer(),
              CustomButton(
                label: buttonText, // Update button label
                onPressed: () {
                  // Add your save or add functionality here
                },
              ),
              2.height,
            ],
          ),
        ),
      ),
    );
  }
}
