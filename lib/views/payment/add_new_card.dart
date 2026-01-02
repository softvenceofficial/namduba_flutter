import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/manage_address/manage_address_screen.dart';
import 'package:nanduba/widgets/core/filter_checks.dart';
import 'package:nanduba/widgets/core/my_text.dart';

class AddNewCard extends StatefulWidget {
  const AddNewCard({super.key});

  @override
  State<AddNewCard> createState() => _AddNewCardState();
}

class _AddNewCardState extends State<AddNewCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.0.w),
        child: Column(
          children: [
            CustomAppbar(title: "Add New Card"),
            4.height,
            Align(
              alignment: Alignment.centerLeft,
              child: MyText(text: 'Name on Card',
                color: AppColors.grey,
                fontWeight: FontWeight.w400,
                fontSize: 10.sp,
                textAlign: TextAlign.center,
              ),
            ),
            0.5.height,
            CustomTextField(
              name: "Profile Name",
              hintText: "Enter name",
              hintStyle: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.verylightGreen,
                  )
              ),
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.verylightGreen,
                  )
              ),
              keyboardType: TextInputType.emailAddress,
              prefixIcon: SvgPicture.asset(AppSvgs.profileIcon, fit: BoxFit.scaleDown,),
            ),
            2.height,
            Align(
              alignment: Alignment.centerLeft,
              child: MyText(text: 'Card Number',
                color: AppColors.grey,
                fontWeight: FontWeight.w400,
                fontSize: 10.sp,
                textAlign: TextAlign.center,
              ),
            ),
            0.5.height,
            CustomTextField(
              name: "Card Number",
              hintText: "Enter card number",
              hintStyle: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.verylightGreen,
                  )
              ),
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.verylightGreen,
                  )
              ),
              keyboardType: TextInputType.emailAddress,
              prefixIcon: SvgPicture.asset(AppSvgs.card, fit: BoxFit.scaleDown,),
            ),
            2.height,
            Align(
              alignment: Alignment.centerLeft,
              child: MyText(text: 'Expiry Date',
                color: AppColors.grey,
                fontWeight: FontWeight.w400,
                fontSize: 10.sp,
                textAlign: TextAlign.center,
              ),
            ),
            0.5.height,
            CustomTextField(
              name: "Expiry Date",
              hintText: "MM/YY",
              hintStyle: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.verylightGreen,
                  )
              ),
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.verylightGreen,
                  )
              ),
              keyboardType: TextInputType.emailAddress,
              prefixIcon: SvgPicture.asset(AppSvgs.calendar, fit: BoxFit.scaleDown,),
            ),
            2.height,
            FilterChecks(title: "Make it default", tick: AppColors.primary, backgroundColor: Colors.white,),
            Spacer(),
            CustomButton(label: "Save Changes", onPressed: (){
             // Get.to(ManageAddressScreen());
            }),
            2.height,
          ],
        ),
      )),
    );
  }
}
