// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:nanduba/export.dart';
// import 'package:nanduba/widgets/core/filter_checks.dart';

// import '../../../constants/colors.dart';
// import '../../../widgets/core/my_text.dart';

// class UserProfile extends StatefulWidget {
//   const UserProfile({super.key});

//   @override
//   State<UserProfile> createState() => _UserProfileState();
// }

// class _UserProfileState extends State<UserProfile> {
//   bool _isDropdownOpen = false; // Track whether the dropdown is open
//   String _selectedGender = 'Select gender'; // Property to store selected gender

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(18.0),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 myAppBar(title: 'Your Profile', icon: null,),
//                 SizedBox(height: 2.5.h,),
//                 CustomContainer(
//                   hpadding: 4.w,
//                   vpadding: 2.3.h,
//                   isBorder: true,
//                   child: Row(
//                     children: [
//                       Stack(
//                         children: [
//                           CircleAvatar(
//                             radius: 10.w,
//                             backgroundColor: AppColors.black,
//                             backgroundImage: AssetImage(AppImages.Person),
//                           ),
//                           Positioned(
//                             bottom: 0,
//                             right: 1.w,
//                               child: Icon(Icons.photo, size: 3.h, color: AppColors.primary,))
//                         ],
//                       ),
//                       2.width,
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           MyText(
//                             text: "John Trial",
//                             fontSize: 12.sp,
//                             fontWeight: FontWeight.w600,
//                             color: AppColors.black,
//                           ),
//                           1.5.height,
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Image.asset(AppImages.call,height: 2.h, ) ,
//                               1.width,
//                               MyText(
//                                 text: "9876543210",
//                                 fontSize: 10.sp,
//                                 fontWeight: FontWeight.w600,
//                                 color: AppColors.midDarkGrey,
//                               ),
//                             ],
//                           ),

//                           1.5.height,
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Image.asset(AppImages.sms,height: 2.h, ) ,
//                               1.width,
//                               MyText(
//                                 text: "Johntrial123@gmail.com",
//                                 fontSize: 10.sp,
//                                 fontWeight: FontWeight.w600,
//                                 color: AppColors.midDarkGrey,
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 2.height,
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: MyText(
//                     text: 'Enter Name',
//                     color: AppColors.grey,
//                     fontWeight: FontWeight.w400,
//                     fontSize: 10.sp,
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//                 1.height,
//                 CustomTextField(
//                   name: "Email",
//                   hintText: "Enter username",
//                   hintStyle: GoogleFonts.poppins(
//                     textStyle: TextStyle(
//                       fontSize: 10.sp,
//                       fontWeight: FontWeight.w400,
//                       color: AppColors.textColor,
//                     ),
//                   ),
//                   style: GoogleFonts.poppins(
//                     textStyle: TextStyle(
//                       fontSize: 10.sp,
//                       fontWeight: FontWeight.w400,
//                       color: AppColors.textColor,
//                     ),
//                   ),
//                   suffixIcon: InkWell(
//                     onTap: (){
//                       Get.to(OtpScreen());
//                     },
//                     child: Padding(
//                       padding: EdgeInsets.only(top: 2.h, right: 3.w),
//                       child: MyText(text: "Change", decoration: TextDecoration.underline,color: AppColors.primary, fontSize: 10.sp,),
//                     ),
//                   ),
//                   keyboardType: TextInputType.emailAddress,
//                   prefixIcon: SvgPicture.asset(AppSvgs.profileIcon, fit: BoxFit.scaleDown),
//                 ),
//                 1.height,
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: MyText(
//                     text: 'Enter Email',
//                     color: AppColors.grey,
//                     fontWeight: FontWeight.w400,
//                     fontSize: 10.sp,
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//                 1.height,
//                 CustomTextField(
//                   name: "Email",
//                   hintText: "Enter email",
//                   hintStyle: GoogleFonts.poppins(
//                     textStyle: TextStyle(
//                       fontSize: 10.sp,
//                       fontWeight: FontWeight.w400,
//                       color: AppColors.textColor,
//                     ),
//                   ),
//                   style: GoogleFonts.poppins(
//                     textStyle: TextStyle(
//                       fontSize: 10.sp,
//                       fontWeight: FontWeight.w400,
//                       color: AppColors.textColor,
//                     ),
//                   ),
//                   suffixIcon: InkWell(
//                     onTap: (){
//                       Get.to(OtpScreen());
//                     },
//                     child: Padding(
//                       padding: EdgeInsets.only(top: 2.h, right: 3.w),
//                       child: MyText(text: "Change", decoration: TextDecoration.underline,color: AppColors.primary, fontSize: 10.sp,),
//                     ),
//                   ),
//                   keyboardType: TextInputType.emailAddress,
//                   prefixIcon: SvgPicture.asset(AppSvgs.emailIcon, fit: BoxFit.scaleDown),
//                 ),
//                 1.height,
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: MyText(
//                     text: 'Enter Password',
//                     color: AppColors.grey,
//                     fontWeight: FontWeight.w400,
//                     fontSize: 10.sp,
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//                 1.height,
//                 CustomTextField(
//                   name: "Email",
//                   hintText: "Enter password",
//                   hintStyle: GoogleFonts.poppins(
//                     textStyle: TextStyle(
//                       fontSize: 10.sp,
//                       fontWeight: FontWeight.w400,
//                       color: AppColors.textColor,
//                     ),
//                   ),
//                   style: GoogleFonts.poppins(
//                     textStyle: TextStyle(
//                       fontSize: 10.sp,
//                       fontWeight: FontWeight.w400,
//                       color: AppColors.textColor,
//                     ),
//                   ),
//                   suffixIcon: InkWell(
//                     onTap: (){
//                       Get.to(OtpScreen());
//                     },
//                     child: Padding(
//                       padding: EdgeInsets.only(top: 2.h, right: 3.w),
//                       child: MyText(text: "Change", decoration: TextDecoration.underline,color: AppColors.primary, fontSize: 10.sp,),
//                     ),
//                   ),
//                   keyboardType: TextInputType.emailAddress,
//                   prefixIcon: SvgPicture.asset(AppSvgs.passwordIcon, fit: BoxFit.scaleDown),
//                 ),
//                 1.height, // Spacer between fields
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: MyText(
//                     text: 'Enter Contact',
//                     color: AppColors.grey,
//                     fontWeight: FontWeight.w400,
//                     fontSize: 10.sp,
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//                 1.height,
//                 CustomTextField(
//                   name: "Enter contact",
//                   hintText: "Enter contact",
//                   hintStyle: GoogleFonts.poppins(
//                     textStyle: TextStyle(
//                       fontSize: 10.sp,
//                       fontWeight: FontWeight.w400,
//                       color: AppColors.textColor,
//                     ),
//                   ),
//                   style: GoogleFonts.poppins(
//                     textStyle: TextStyle(
//                       fontSize: 10.sp,
//                       fontWeight: FontWeight.w400,
//                       color: AppColors.textColor,
//                     ),
//                   ),
//                   keyboardType: TextInputType.phone,
//                   prefixIcon: SvgPicture.asset(AppSvgs.call, fit: BoxFit.scaleDown
//                   ),
//                 ),
//                 1.height, // Spacer between fields
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: MyText(
//                     text: 'Drivers License Number',
//                     color: AppColors.grey,
//                     fontWeight: FontWeight.w400,
//                     fontSize: 10.sp,
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//                 1.height,
//                 CustomTextField(
//                   name: "Username",
//                   hintText: "Enter driving license number",
//                   hintStyle: GoogleFonts.poppins(
//                     textStyle: TextStyle(
//                       fontSize: 10.sp,
//                       fontWeight: FontWeight.w400,
//                       color: AppColors.textColor,
//                     ),
//                   ),
//                   style: GoogleFonts.poppins(
//                     textStyle: TextStyle(
//                       fontSize: 10.sp,
//                       fontWeight: FontWeight.w400,
//                       color: AppColors.textColor,
//                     ),
//                   ),
//                   keyboardType: TextInputType.text,
//                   prefixIcon: SvgPicture.asset(AppSvgs.calendar, fit: BoxFit.scaleDown),
//                 ),
//                 1.height, // Spacer between fields
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: MyText(text: "Driver's License Expiry Date",
//                     color: AppColors.grey,
//                     fontWeight: FontWeight.w400,
//                     fontSize: 10.sp,
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//                 1.height,
//                 CustomTextField(
//                   name: "Expiry Date",
//                   hintText: "DD/MM/YY",
//                   hintStyle: GoogleFonts.poppins(
//                       textStyle: TextStyle(
//                         fontSize: 10.sp,
//                         fontWeight: FontWeight.w400,
//                         color: AppColors.verylightGreen,
//                       )
//                   ),
//                   style: GoogleFonts.poppins(
//                       textStyle: TextStyle(
//                         fontSize: 10.sp,
//                         fontWeight: FontWeight.w400,
//                         color: AppColors.verylightGreen,
//                       )
//                   ),
//                   keyboardType: TextInputType.emailAddress,
//                   prefixIcon: SvgPicture.asset(AppSvgs.calendar, fit: BoxFit.scaleDown,),
//                 ),
//                 1.height,
//                  Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Text('Gender'),
//               ],
//             ),
//                 1.height,
//                 Container(
//               height: 50,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(16),
//                 border: Border.all(width: 1, color: Color.fromRGBO(235, 223, 224, 1)),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                     child: Row(
//                       children: [
//                         Image.asset(
//                           AppImages.gender, // Replace with your image path
//                           width: 16,
//                           height: 16,
//                         ),
//                         SizedBox(width: 8),
//                         Text(
//                           _selectedGender, // Display the selected gender or default text
//                           style: GoogleFonts.poppins(
//                             textStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   PopupMenuButton<String>(
//                     icon: Image.asset(
//                       AppImages.arrow_down, // Replace with your image path for the arrow
//                       width: 24,
//                       height: 24,
//                     ),
//                     onSelected: (String value) {
//                       setState(() {
//                         _selectedGender = value; // Update selected gender
//                       });
//                     },
//                     itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
//                       PopupMenuItem<String>(
//                         value: 'Male',
//                         child: Text('Option 1', style: TextStyle(fontSize: 14)),
//                       ),
//                       PopupMenuItem<String>(
//                         value: 'Female',
//                         child: Text('Option 2', style: TextStyle(fontSize: 14)),
//                       ),
//                     ],
//                   ),

//                 ],
//               ),
//             ),
//                 2.height,
//                 FilterChecks(title: "Enable Text Notifications", backgroundColor: Colors.white, tick: AppColors.primary,),
//                 2.height,
//                 CustomButton(label: "Update Information", onPressed: (){})
//               ],
//             ),
//           ),
//         ),
//       )
//       ,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/widgets/core/filter_checks.dart';

import '../../../constants/colors.dart';
import '../../../widgets/core/my_text.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  bool _isDropdownOpen = false; // Track whether the dropdown is open
  String _selectedGender = 'Select gender'; // Property to store selected gender

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const myAppBar(
                  title: 'Your Profile',
                  icon: null,
                ),
                SizedBox(
                  height: 2.5.h,
                ),
                CustomContainer(
                  hpadding: 4.w,
                  vpadding: 2.3.h,
                  isBorder: true,
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 10.w,
                            backgroundColor: AppColors.black,
                            backgroundImage: AssetImage(AppImages.Person),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 1.w,
                            child: Icon(
                              Icons.photo,
                              size: 3.h,
                              color: AppColors.primary,
                            ),
                          )
                        ],
                      ),
                      2.width,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            text: "John Trial",
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                          1.5.height,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                AppImages.call,
                                height: 2.h,
                              ),
                              1.width,
                              MyText(
                                text: "9876543210",
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.midDarkGrey,
                              ),
                            ],
                          ),
                          1.5.height,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                AppImages.sms,
                                height: 2.h,
                              ),
                              1.width,
                              MyText(
                                text: "Johntrial123@gmail.com",
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.midDarkGrey,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                2.height,
                Align(
                  alignment: Alignment.centerLeft,
                  child: MyText(
                    text: 'Username',
                    color: AppColors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 10.sp,
                    textAlign: TextAlign.center,
                  ),
                ),
                1.height,
                CustomTextField(
                  name: "Email",
                  hintText: "Enter username",
                  hintStyle: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textColor,
                    ),
                  ),
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textColor,
                    ),
                  ),
                  suffixIcon: InkWell(
                    onTap: () {
                      Get.to(OtpScreen());
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 2.h, right: 3.w),
                      child: MyText(
                        text: "Change",
                        decoration: TextDecoration.underline,
                        color: AppColors.primary,
                        fontSize: 10.sp,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: SvgPicture.asset(AppSvgs.profileIcon,
                      fit: BoxFit.scaleDown),
                ),
                1.height,
                Align(
                  alignment: Alignment.centerLeft,
                  child: MyText(
                    text: 'Name',
                    color: AppColors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 10.sp,
                    textAlign: TextAlign.center,
                  ),
                ),
                1.height,
                CustomTextField(
                  name: "Email",
                  hintText: "Enter name",
                  hintStyle: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textColor,
                    ),
                  ),
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textColor,
                    ),
                  ),
                  suffixIcon: InkWell(
                    onTap: () {
                      Get.to(OtpScreen());
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 2.h, right: 3.w),
                      child: MyText(
                        text: "Change",
                        decoration: TextDecoration.underline,
                        color: AppColors.primary,
                        fontSize: 10.sp,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: SvgPicture.asset(AppSvgs.profileIcon,
                      fit: BoxFit.scaleDown),
                ),
                1.height,
                Align(
                  alignment: Alignment.centerLeft,
                  child: MyText(
                    text: 'Email',
                    color: AppColors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 10.sp,
                    textAlign: TextAlign.center,
                  ),
                ),
                1.height,
                CustomTextField(
                  name: "Email",
                  hintText: "Enter email",
                  hintStyle: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textColor,
                    ),
                  ),
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textColor,
                    ),
                  ),
                  suffixIcon: InkWell(
                    onTap: () {
                      Get.to(OtpScreen());
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 2.h, right: 3.w),
                      child: MyText(
                        text: "Change",
                        decoration: TextDecoration.underline,
                        color: AppColors.primary,
                        fontSize: 10.sp,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: SvgPicture.asset(AppSvgs.emailIcon,
                      fit: BoxFit.scaleDown),
                ),
                1.height,
                Align(
                  alignment: Alignment.centerLeft,
                  child: MyText(
                    text: 'Enter Password',
                    color: AppColors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 10.sp,
                    textAlign: TextAlign.center,
                  ),
                ),
                1.height,
                CustomTextField(
                  name: "Email",
                  hintText: "Enter password",
                  hintStyle: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textColor,
                    ),
                  ),
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textColor,
                    ),
                  ),
                  suffixIcon: InkWell(
                    onTap: () {
                      Get.to(OtpScreen());
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 2.h, right: 3.w),
                      child: MyText(
                        text: "Change",
                        decoration: TextDecoration.underline,
                        color: AppColors.primary,
                        fontSize: 10.sp,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: SvgPicture.asset(AppSvgs.passwordIcon,
                      fit: BoxFit.scaleDown),
                ),
                1.height, // Spacer between fields
                Align(
                  alignment: Alignment.centerLeft,
                  child: MyText(
                    text: 'Enter Contact',
                    color: AppColors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 10.sp,
                    textAlign: TextAlign.center,
                  ),
                ),
                1.height,
                CustomTextField(
                  name: "Enter contact",
                  hintText: "Enter contact",
                  hintStyle: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textColor,
                    ),
                  ),
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textColor,
                    ),
                  ),
                  suffixIcon: InkWell(
                    onTap: () {
                      Get.to(OtpScreen());
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 2.h, right: 3.w),
                      child: MyText(
                        text: "Change",
                        decoration: TextDecoration.underline,
                        color: AppColors.primary,
                        fontSize: 10.sp,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                  prefixIcon:
                      SvgPicture.asset(AppSvgs.call, fit: BoxFit.scaleDown),
                ),
                1.height, // Spacer between fields
                Align(
                  alignment: Alignment.centerLeft,
                  child: MyText(
                    text: 'Drivers License Number',
                    color: AppColors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 10.sp,
                    textAlign: TextAlign.center,
                  ),
                ),
                1.height,
                CustomTextField(
                  name: "Username",
                  hintText: "Enter driving license number",
                  hintStyle: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey,
                    ),
                  ),
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textColor,
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  prefixIcon: SvgPicture.asset(
                    AppSvgs.licence,
                    fit: BoxFit.scaleDown,
                    color: AppColors.primary,
                  ),
                ),
                1.height, // Spacer between fields
                Align(
                  alignment: Alignment.centerLeft,
                  child: MyText(
                    text: "Driver's License Expiry Date",
                    color: AppColors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 10.sp,
                    textAlign: TextAlign.center,
                  ),
                ),
                1.height,
                CustomTextField(
                  name: "Expiry Date",
                  hintText: "MM/YY",
                  hintStyle: GoogleFonts.poppins(
                      textStyle: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.verylightGreen,
                  )),
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.verylightGreen,
                  )),
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: SvgPicture.asset(
                    AppSvgs.calendar,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                1.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Gender'),
                  ],
                ),
                1.height,
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                        width: 1, color: Color.fromRGBO(235, 223, 224, 1)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: [
                            Image.asset(
                              AppImages.gender, // Replace with your image path
                              width: 16,
                              height: 16,
                            ),
                            SizedBox(width: 8),
                            Text(
                              _selectedGender, // Display the selected gender or default text
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ),
                      PopupMenuButton<String>(
                        icon: Image.asset(
                          AppImages
                              .arrow_down, // Replace with your image path for the arrow
                          width: 24,
                          height: 24,
                        ),
                        onSelected: (String value) {
                          setState(() {
                            _selectedGender = value; // Update selected gender
                          });
                        },
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<String>>[
                          PopupMenuItem<String>(
                            value: 'Male',
                            child: Text('Option 1',
                                style: TextStyle(fontSize: 14)),
                          ),
                          PopupMenuItem<String>(
                            value: 'Female',
                            child: Text('Option 2',
                                style: TextStyle(fontSize: 14)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                2.height,
                FilterChecks(
                  title: "Enable Text Notifications",
                  backgroundColor: Colors.white,
                  tick: AppColors.primary,
                ),
                2.height,
                CustomButton(label: "Update Information", onPressed: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
