// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:nanduba/export.dart';
// import 'package:nanduba/views/Profile/Policies/Policies.dart';
// import 'package:nanduba/views/Profile/Settings/settings.dart';
// import 'package:nanduba/views/Profile/User_profile/user_profile.dart';
// import 'package:nanduba/views/Profile/order_details/Order_details.dart';
// import 'package:nanduba/views/Wishlist/Wishlist.dart';
// import 'package:nanduba/views/add_vehicle/vehicle_info/vehicle_info.dart';
// import 'package:nanduba/views/add_vehicle/vehicle_listings/vehicle_listing.dart';
// import 'package:nanduba/views/contact_us/contact_us_screen.dart';
// import 'package:nanduba/views/create_request/review_request/component/request_service_details_list.dart';
// import 'package:nanduba/views/create_request/view_requests/view_requests.dart';
// import 'package:nanduba/views/manage_address/manage_address_screen.dart';
// import 'package:nanduba/views/payment/choose_method.dart';
// import '../../widgets/core/my_text.dart';

// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({super.key});

//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   final List<Map<String, dynamic>> _items = [
//     {
//       'image': AppImages.Profile,
//       'text1': 'Profile  ',
//       'additionalImage': AppImages.arrow_circle_right,
//     },
//     {
//       'image': AppImages.heart,
//       'text1': 'Watchlist',
//       'additionalImage': AppImages.arrow_circle_right,
//     },
//     {
//       'image': AppImages.document,
//       'text1': 'Requests',
//       'additionalImage': AppImages.arrow_circle_right,
//     },
//     {
//       'image': AppImages.shop,
//       'text1': 'Orders',
//       'additionalImage': AppImages.arrow_circle_right,
//     },
//     {
//       'image': AppImages.location,
//       'text1': 'Address Book',
//       'additionalImage': AppImages.arrow_circle_right,
//     },
//     {
//       'image': AppImages.shield,
//       'text1': 'Insurance Policies',
//       'additionalImage': AppImages.arrow_circle_right,
//     },
//     {
//       'image': AppImages.car_icon,
//       'text1': 'Vehicles',
//       'additionalImage': AppImages.arrow_circle_right,
//     },
//     {
//       'image': AppImages.payment,
//       'text1': 'Payment Settings',
//       'additionalImage': AppImages.arrow_circle_right,
//     },
//     {
//       'image': AppImages.setting,
//       'text1': 'Account Settings',
//       'additionalImage': AppImages.arrow_circle_right,
//     },
//     {
//       'image': AppImages.help,
//       'text1': 'Help And Support',
//       'additionalImage': AppImages.arrow_circle_right,
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             SizedBox(height: 3.h,),
//             Padding(
//               padding:  EdgeInsets.symmetric(horizontal: 18),
//               child: CustomAppbar(title: '', ),
//             ),
//             SizedBox(height: 3.h,),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 5),
//               child: GestureDetector(
//                 onTap: (){
//                   Get.to(UserProfile());
//                 },
//                 child: CustomContainer(
//                   hpadding: 4.w,
//                   vpadding: 2.3.h,
//                   child: Row(
//                     children: [
//                       CircleAvatar(
//                         radius: 10.w,
//                         backgroundColor: AppColors.black,
//                         backgroundImage: AssetImage(AppImages.Person),
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
//                           MyText(
//                             text: "Bill Master",
//                             fontSize: 10.sp,
//                             fontWeight: FontWeight.w600,
//                             color: AppColors.midDarkGrey,
//                           ),
//                           1.5.height,
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.end,
//                             children: [
//                               MyText(
//                                 text: "View activity",
//                                 fontSize: 10.sp,
//                                 fontWeight: FontWeight.w500,
//                                 color: AppColors.primary,
//                               ),
//                               Icon(CupertinoIcons.forward, size: 15, color: AppColors.primary,)
//                             ],
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: SizedBox(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [

//                       ListView.builder(
//                         itemCount: _items.length,
//                         shrinkWrap: true,
//                         physics: NeverScrollableScrollPhysics(),
//                         itemBuilder: (context, index) {
//                           final item = _items[index];
//                           return GestureDetector(
//                             onTap: (){
//                               if(index == 3){
//                                 Get.to(OrderDetails());
//                               } else if (index == 7){
//                                 Get.to(ChooseMethods());
//                               } else if(index == 8){
//                                 Get.to(Settings());
//                               } else if (index == 9){
//                                 Get.to(ContactUsScreen());
//                               } else if (index == 5){
//                                 Get.to(Policies());
//                               } else if (index == 4){
//                                 Get.to(ManageAddressScreen());
//                               } else if (index == 0){
//                                 Get.to(UserProfile());
//                               } else if (index == 1){
//                                 Get.to(Wishlist());
//                               } else if (index == 2){
//                                 Get.to(ViewRequests());
//                               }  else if (index == 6){
//                                 Get.to(VehicleListings());
//                               }
//                             },
//                             child: Column(
//                               children: [
//                                 Container(
//                                   margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10), // Add top margin
//                                   padding: EdgeInsets.all(8.0),
//                                   decoration: BoxDecoration(
//                                     color: Colors.white,
//                                     borderRadius: BorderRadius.circular(20.0),
//                                     boxShadow: [
//                                       BoxShadow(
//                                         color: Color.fromRGBO(28, 28, 28, 0.1),
//                                         offset: Offset(0, 2),
//                                         blurRadius: 20,
//                                         spreadRadius: 0,
//                                       ),
//                                     ],
//                                   ),
//                                   child: index == 8 ? Column(
//                                     children: [
//                                       Row(
//                                         crossAxisAlignment: CrossAxisAlignment.center,
//                                         children: [
//                                           Container(
//                                             height: 40,
//                                             width: 40,
//                                             decoration: BoxDecoration(
//                                               color: Color.fromRGBO(252, 242, 242, 1),
//                                               borderRadius: BorderRadius.circular(12),
//                                             ),
//                                             child: Padding(
//                                               padding: const EdgeInsets.all(0.0),
//                                               child: Center(
//                                                 child: Image.asset(
//                                                   item['image'],
//                                                   height: 20,
//                                                   width: 20,
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                           const SizedBox(width: 8.0),
//                                           Expanded(
//                                             child: Row(
//                                               children: [
//                                                 Expanded(
//                                                   child: Column(
//                                                     crossAxisAlignment: CrossAxisAlignment.center,
//                                                     children: [
//                                                       SizedBox(width: 1.w,),
//                                                       Row(
//                                                         crossAxisAlignment: CrossAxisAlignment.center,
//                                                         children: [
//                                                           Padding(
//                                                             padding: const EdgeInsets.only(top: 5.0),
//                                                             child: Text(
//                                                               item['text1'],
//                                                               style: GoogleFonts.poppins(
//                                                                 textStyle: TextStyle(
//                                                                   fontSize: 13.sp,
//                                                                   fontWeight: FontWeight.w500,
//                                                                   color: Color.fromRGBO(31, 31, 31, 1),
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                           ),
//                                                           if (index == 0) ...[
//                                                             Padding(
//                                                               padding: const EdgeInsets.only(top:   10.0),
//                                                               child: Row(
//                                                                 children: [
//                                                                   Image.asset(
//                                                                     AppImages.Red_dot,
//                                                                     height: 8,
//                                                                     width: 8,
//                                                                   ),
//                                                                   Text(
//                                                                     '  48% completed',
//                                                                     style: GoogleFonts.poppins(
//                                                                       fontWeight: FontWeight.w500,
//                                                                       fontSize: 9.sp,
//                                                                       color: Color.fromRGBO(108, 204, 52, 1),
//                                                                     ),
//                                                                   )
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ],
//                                                         ],
//                                                       ),
//                                                       SizedBox(height: 8.0),
//                                                     ],
//                                                   ),
//                                                 ),
//                                                 if (item['additionalImage'] != null) ...[
//                                                   Padding(
//                                                     padding: const EdgeInsets.only(right: 5.0),
//                                                     child: Image.asset(
//                                                       item['additionalImage'],
//                                                       height: 20,
//                                                       width: 20,
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ],
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       1.height,
//                                       Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text(
//                                             "Edit profile ",
//                                             style: GoogleFonts.poppins(
//                                               fontSize: 10.sp,
//                                               fontWeight: FontWeight.w400,
//                                               color: Color.fromRGBO(31, 31, 31, 1),
//                                             ),
//                                           ),
//                                           Padding(
//                                             padding: EdgeInsets.only(right: 6.0),
//                                             child: Image.asset(
//                                               AppImages.arrow_circle_right,
//                                               width: 15,
//                                               height: 15,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       0.5.height,
//                                       Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text(
//                                             "Payment settings",
//                                             style: GoogleFonts.poppins(
//                                               fontSize: 10.sp,
//                                               fontWeight: FontWeight.w400,
//                                               color: Color.fromRGBO(31, 31, 31, 1),
//                                             ),
//                                           ),
//                                           Padding(
//                                             padding: EdgeInsets.only(right: 6.0),
//                                             child: Image.asset(
//                                               AppImages.arrow_circle_right,
//                                               width: 15,
//                                               height: 15,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       0.5.height,
//                                       Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text(
//                                             "Taxes information",
//                                             style: GoogleFonts.poppins(
//                                               fontSize: 10.sp,
//                                               fontWeight: FontWeight.w400,
//                                               color: Color.fromRGBO(31, 31, 31, 1),
//                                             ),
//                                           ),
//                                           Padding(
//                                             padding: EdgeInsets.only(right: 6.0),
//                                             child: Image.asset(
//                                               AppImages.arrow_circle_right,
//                                               width: 15,
//                                               height: 15,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       0.5.height,
//                                       Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text(
//                                             "login & security",
//                                             style: GoogleFonts.poppins(
//                                               fontSize: 10.sp,
//                                               fontWeight: FontWeight.w400,
//                                               color: Color.fromRGBO(31, 31, 31, 1),
//                                             ),
//                                           ),
//                                           Padding(
//                                             padding: EdgeInsets.only(right: 6.0),
//                                             child: Image.asset(
//                                               AppImages.arrow_circle_right,
//                                               width: 15,
//                                               height: 15,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       0.5.height,
//                                       Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text(
//                                             "Preference",
//                                             style: GoogleFonts.poppins(
//                                               fontSize: 10.sp,
//                                               fontWeight: FontWeight.w400,
//                                               color: Color.fromRGBO(31, 31, 31, 1),
//                                             ),
//                                           ),
//                                           Padding(
//                                             padding: EdgeInsets.only(right: 6.0),
//                                             child: Image.asset(
//                                               AppImages.arrow_circle_right,
//                                               width: 15,
//                                               height: 15,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       0.5.height,
//                                       Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text(
//                                             "Notification settings",
//                                             style: GoogleFonts.poppins(
//                                               fontSize: 10.sp,
//                                               fontWeight: FontWeight.w400,
//                                               color: Color.fromRGBO(31, 31, 31, 1),
//                                             ),
//                                           ),
//                                           Padding(
//                                             padding: EdgeInsets.only(right: 6.0),
//                                             child: Image.asset(
//                                               AppImages.arrow_circle_right,
//                                               width: 15,
//                                               height: 15,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       0.5.height,
//                                       Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text(
//                                             "Close account",
//                                             style: GoogleFonts.poppins(
//                                               fontSize: 10.sp,
//                                               fontWeight: FontWeight.w400,
//                                               color: Color.fromRGBO(31, 31, 31, 1),
//                                             ),
//                                           ),
//                                           Padding(
//                                             padding: EdgeInsets.only(right: 6.0),
//                                             child: Image.asset(
//                                               AppImages.arrow_circle_right,
//                                               width: 15,
//                                               height: 15,
//                                             ),
//                                           ),
//                                         ],
//                                       ),

//                                     ],
//                                   ) : Row(
//                                     crossAxisAlignment: CrossAxisAlignment.center,
//                                     children: [
//                                       Container(
//                                         height: 40,
//                                         width: 40,
//                                         decoration: BoxDecoration(
//                                           color: Color.fromRGBO(252, 242, 242, 1),
//                                           borderRadius: BorderRadius.circular(12),
//                                         ),
//                                         child: Padding(
//                                           padding: const EdgeInsets.all(0.0),
//                                           child: Center(
//                                             child: Image.asset(
//                                               item['image'],
//                                               height: 20,
//                                               width: 20,
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       const SizedBox(width: 8.0),
//                                       Expanded(
//                                         child: Row(
//                                           children: [
//                                             Expanded(
//                                               child: Column(
//                                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                                 children: [
//                                                   SizedBox(width: 1.w,),
//                                                   Row(
//                                                     crossAxisAlignment: CrossAxisAlignment.center,
//                                                     children: [
//                                                       Padding(
//                                                         padding: const EdgeInsets.only(top: 5.0),
//                                                         child: Text(
//                                                           item['text1'],
//                                                           style: GoogleFonts.poppins(
//                                                             textStyle: TextStyle(
//                                                               fontSize: 13.sp,
//                                                               fontWeight: FontWeight.w500,
//                                                               color: Color.fromRGBO(31, 31, 31, 1),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       if (index == 0) ...[
//                                                         Padding(
//                                                           padding: const EdgeInsets.only(top:   10.0),
//                                                           child: Row(
//                                                             children: [
//                                                               Image.asset(
//                                                                 AppImages.Red_dot,
//                                                                 height: 8,
//                                                                 width: 8,
//                                                               ),
//                                                               Text(
//                                                                 '  48% completed',
//                                                                 style: GoogleFonts.poppins(
//                                                                   fontWeight: FontWeight.w500,
//                                                                   fontSize: 9.sp,
//                                                                   color: Color.fromRGBO(108, 204, 52, 1),
//                                                                 ),
//                                                               )
//                                                             ],
//                                                           ),
//                                                         ),
//                                                       ],
//                                                     ],
//                                                   ),
//                                                   SizedBox(height: 8.0),
//                                                 ],
//                                               ),
//                                             ),
//                                             if (item['additionalImage'] != null) ...[
//                                               Padding(
//                                                 padding: const EdgeInsets.only(right: 5.0),
//                                                 child: Image.asset(
//                                                   item['additionalImage'],
//                                                   height: 20,
//                                                   width: 20,
//                                                 ),
//                                               ),
//                                             ],
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           );
//                         },
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 15),
//                         child: CustomButton(label: "Log Out", onPressed: () {}),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),

//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/Profile/Policies/Policies.dart';
import 'package:nanduba/views/Profile/Settings/settings.dart';
import 'package:nanduba/views/Profile/User_profile/user_profile.dart';
import 'package:nanduba/views/Profile/order_details/Order_details.dart';
import 'package:nanduba/views/Wishlist/Wishlist.dart';
import 'package:nanduba/views/add_vehicle/vehicle_info/vehicle_info.dart';
import 'package:nanduba/views/add_vehicle/vehicle_listings/vehicle_listing.dart';
import 'package:nanduba/views/contact_us/contact_us_screen.dart';
import 'package:nanduba/views/create_request/review_request/component/request_service_details_list.dart';
import 'package:nanduba/views/create_request/view_requests/view_requests.dart';
import 'package:nanduba/views/manage_address/manage_address_screen.dart';
import 'package:nanduba/views/payment/choose_method.dart';
import '../../widgets/core/my_text.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List<Map<String, dynamic>> _items = [
    {
      'image': AppImages.Profile,
      'text1': 'Profile  ',
      'additionalImage': AppImages.arrow_circle_right,
    },
    {
      'image': AppImages.heart,
      'text1': 'Watchlist',
      'additionalImage': AppImages.arrow_circle_right,
    },
    {
      'image': AppImages.document,
      'text1': 'Requests',
      'additionalImage': AppImages.arrow_circle_right,
    },
    {
      'image': AppImages.shop,
      'text1': 'Orders',
      'additionalImage': AppImages.arrow_circle_right,
    },
    {
      'image': AppImages.location,
      'text1': 'Address Book',
      'additionalImage': AppImages.arrow_circle_right,
    },
    {
      'image': AppImages.shield,
      'text1': 'Insurance Policies',
      'additionalImage': AppImages.arrow_circle_right,
    },
    {
      'image': AppImages.car_icon,
      'text1': 'Vehicles',
      'additionalImage': AppImages.arrow_circle_right,
    },
    {
      'image': AppImages.payment,
      'text1': 'Payment Settings',
      'additionalImage': AppImages.arrow_circle_right,
    },
    {
      'image': AppImages.setting,
      'text1': 'Account Settings',
      'additionalImage': AppImages.arrow_circle_right,
    },
    {
      'image': AppImages.help,
      'text1': 'Help And Support',
      'additionalImage': AppImages.arrow_circle_right,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 3.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: CustomAppbar(
                title: '',
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 5),
              child: GestureDetector(
                onTap: () {
                  Get.to(UserProfile());
                },
                child: CustomContainer(
                  hpadding: 4.w,
                  vpadding: 2.3.h,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 10.w,
                        backgroundColor: AppColors.black,
                        backgroundImage: AssetImage(AppImages.Person),
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
                          MyText(
                            text: "Bill Master",
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.midDarkGrey,
                          ),
                          1.5.height,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              MyText(
                                text: "View activity",
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primary,
                              ),
                              Icon(
                                CupertinoIcons.forward,
                                size: 15,
                                color: AppColors.primary,
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                        itemCount: _items.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final item = _items[index];
                          return GestureDetector(
                            onTap: () {
                              if (index == 3) {
                                Get.to(OrderDetails());
                              } else if (index == 7) {
                                Get.to(ChooseMethods());
                              } else if (index == 8) {
                                Get.to(Settings());
                              } else if (index == 9) {
                                Get.to(ContactUsScreen());
                              } else if (index == 5) {
                                Get.to(Policies());
                              } else if (index == 4) {
                                Get.to(ManageAddressScreen());
                              } else if (index == 0) {
                                Get.to(UserProfile());
                              } else if (index == 1) {
                                Get.to(Wishlist());
                              } else if (index == 2) {
                                Get.to(ViewRequests());
                              } else if (index == 6) {
                                Get.to(VehicleListings());
                              }
                            },
                            child: Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 16.0,
                                      vertical: 10), // Add top margin
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(28, 28, 28, 0.1),
                                        offset: Offset(0, 2),
                                        blurRadius: 20,
                                        spreadRadius: 0,
                                      ),
                                    ],
                                  ),
                                  child: index == 8
                                      ? Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  height: 40,
                                                  width: 40,
                                                  decoration: BoxDecoration(
                                                    color: Color.fromRGBO(
                                                        252, 242, 242, 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            0.0),
                                                    child: Center(
                                                      child: Image.asset(
                                                        item['image'],
                                                        height: 20,
                                                        width: 20,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 8.0),
                                                Expanded(
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            SizedBox(
                                                              width: 1.w,
                                                            ),
                                                            Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          top:
                                                                              5.0),
                                                                  child: Text(
                                                                    item[
                                                                        'text1'],
                                                                    style: GoogleFonts
                                                                        .poppins(
                                                                      textStyle:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            13.sp,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        color: Color.fromRGBO(
                                                                            31,
                                                                            31,
                                                                            31,
                                                                            1),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                if (index ==
                                                                    0) ...[
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                        .only(
                                                                        top:
                                                                            10.0),
                                                                    child: Row(
                                                                      children: [
                                                                        Image
                                                                            .asset(
                                                                          AppImages
                                                                              .Red_dot,
                                                                          height:
                                                                              8,
                                                                          width:
                                                                              8,
                                                                        ),
                                                                        Text(
                                                                          '  48% completed',
                                                                          style:
                                                                              GoogleFonts.poppins(
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontSize:
                                                                                9.sp,
                                                                            color: Color.fromRGBO(
                                                                                108,
                                                                                204,
                                                                                52,
                                                                                1),
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ],
                                                            ),
                                                            SizedBox(
                                                                height: 8.0),
                                                          ],
                                                        ),
                                                      ),
                                                      if (item[
                                                              'additionalImage'] !=
                                                          null) ...[
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  right: 5.0),
                                                          child: Image.asset(
                                                            item[
                                                                'additionalImage'],
                                                            height: 20,
                                                            width: 20,
                                                          ),
                                                        ),
                                                      ],
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            1.height,
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Edit profile ",
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 10.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color.fromRGBO(
                                                        31, 31, 31, 1),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 6.0),
                                                  child: Image.asset(
                                                    AppImages
                                                        .arrow_circle_right,
                                                    width: 15,
                                                    height: 15,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            0.5.height,
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Payment settings",
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 10.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color.fromRGBO(
                                                        31, 31, 31, 1),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 6.0),
                                                  child: Image.asset(
                                                    AppImages
                                                        .arrow_circle_right,
                                                    width: 15,
                                                    height: 15,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            0.5.height,
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Taxes information",
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 10.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color.fromRGBO(
                                                        31, 31, 31, 1),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 6.0),
                                                  child: Image.asset(
                                                    AppImages
                                                        .arrow_circle_right,
                                                    width: 15,
                                                    height: 15,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            0.5.height,
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "login & security",
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 10.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color.fromRGBO(
                                                        31, 31, 31, 1),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 6.0),
                                                  child: Image.asset(
                                                    AppImages
                                                        .arrow_circle_right,
                                                    width: 15,
                                                    height: 15,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            0.5.height,
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Preference",
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 10.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color.fromRGBO(
                                                        31, 31, 31, 1),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 6.0),
                                                  child: Image.asset(
                                                    AppImages
                                                        .arrow_circle_right,
                                                    width: 15,
                                                    height: 15,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            0.5.height,
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Notification settings",
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 10.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color.fromRGBO(
                                                        31, 31, 31, 1),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 6.0),
                                                  child: Image.asset(
                                                    AppImages
                                                        .arrow_circle_right,
                                                    width: 15,
                                                    height: 15,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            0.5.height,
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Close account",
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 10.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color.fromRGBO(
                                                        31, 31, 31, 1),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 6.0),
                                                  child: Image.asset(
                                                    AppImages
                                                        .arrow_circle_right,
                                                    width: 15,
                                                    height: 15,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      : Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 40,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                color: Color.fromRGBO(
                                                    252, 242, 242, 1),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(0.0),
                                                child: Center(
                                                  child: Image.asset(
                                                    item['image'],
                                                    height: 20,
                                                    width: 20,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            Expanded(
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        SizedBox(
                                                          width: 1.w,
                                                        ),
                                                        Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      top: 5.0),
                                                              child: Text(
                                                                item['text1'],
                                                                style:
                                                                    GoogleFonts
                                                                        .poppins(
                                                                  textStyle:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            31,
                                                                            31,
                                                                            31,
                                                                            1),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            if (index == 0) ...[
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        top:
                                                                            10.0),
                                                                child: Row(
                                                                  children: [
                                                                    Image.asset(
                                                                      AppImages
                                                                          .Red_dot,
                                                                      height: 8,
                                                                      width: 8,
                                                                    ),
                                                                    Text(
                                                                      '  48% completed',
                                                                      style: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontSize:
                                                                            9.sp,
                                                                        color: Color.fromRGBO(
                                                                            108,
                                                                            204,
                                                                            52,
                                                                            1),
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ],
                                                        ),
                                                        SizedBox(height: 8),
                                                      ],
                                                    ),
                                                  ),
                                                  if (item['additionalImage'] !=
                                                      null) ...[
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 5.0),
                                                      child: Image.asset(
                                                        item['additionalImage'],
                                                        height: 20,
                                                        width: 20,
                                                      ),
                                                    ),
                                                  ],
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18.0, vertical: 15),
                        child: CustomButton(label: "Log Out", onPressed: () {}),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
