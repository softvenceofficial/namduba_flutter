// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:nanduba/controllers/order_detail_controller.dart';
// import 'package:nanduba/export.dart';
// import 'package:provider/provider.dart';

// import '../../providers/estimate_provider.dart';
// import 'DetailCustomContainer.dart';
// import 'component/order_pop_up_menu.dart';

// class OrderDetailedScreen extends StatefulWidget {
//   const OrderDetailedScreen({super.key});

//   @override
//   State<OrderDetailedScreen> createState() => _OrderDetailedScreenState();
// }

// class _OrderDetailedScreenState extends State<OrderDetailedScreen> {
//   final OrderDetailController controller = Get.find<OrderDetailController>();

//   bool _isExpanded = false;
//   void _toggleExpand() {
//     setState(() {
//       _isExpanded = !_isExpanded;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromRGBO(255, 255, 255, 1),
//       body: SafeArea(
//         child: Column(
//           children: [
//             SizedBox(height: 30),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 4.w),
//               child: myAppBar(
//                 title: "Order Details",
//                 icon: AppSvgs.more_vert,
//                 iconColor: AppColors.border3,
//                 onTogglePressed: (){
//                   print("tapped");
//                   controller.showPopUp();
//                 },)
//             ),
//             Expanded(child: Stack(
//               children: [
//                 SingleChildScrollView(
//                   child: GestureDetector(
//                     onTap: (){
//                       if(controller.popUp.value == true){
//                         controller.popUp.value = false;
//                       }
//                     },
//                     child: Column(
//                       children: [
//                         SizedBox(height: 30),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                           child: Container(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(25),
//                               color: Color.fromRGBO(255, 255, 255, 1),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Color.fromRGBO(28, 28, 28, 0.1),
//                                   offset: Offset(0, 2),
//                                   blurRadius: 20,
//                                 ),
//                               ],
//                             ),
//                             height: 11.h,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(horizontal: 14.0),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                     crossAxisAlignment: CrossAxisAlignment.center,
//                                     children: [
//                                       Text(
//                                         '#1003',
//                                         style: GoogleFonts.poppins(
//                                           textStyle: TextStyle(
//                                             fontWeight: FontWeight.w600,
//                                             fontSize: 13.sp,
//                                           ),
//                                         ),
//                                       ),
//                                       Row(
//                                         children: [
//                                           Container(
//                                             decoration: BoxDecoration(
//                                               color: Color.fromRGBO(55, 125, 215, 1),
//                                               borderRadius: BorderRadius.circular(8),
//                                             ),
//                                             child: Padding(
//                                               padding: const EdgeInsets.symmetric(
//                                                   horizontal: 8.0, vertical: 4.0),
//                                               child: Text(
//                                                 'Unfulfilled',
//                                                 style: GoogleFonts.poppins(
//                                                   textStyle: TextStyle(
//                                                     fontSize: 8.sp,
//                                                     fontWeight: FontWeight.w500,
//                                                     color:
//                                                     Color.fromRGBO(255, 255, 255, 1),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                           SizedBox(width: 10), // Space between the tags
//                                           Container(
//                                             decoration: BoxDecoration(
//                                               borderRadius: BorderRadius.circular(8),
//                                               color: Color.fromRGBO(240, 78, 94, 1),
//                                             ),
//                                             child: Padding(
//                                               padding: const EdgeInsets.symmetric(
//                                                   horizontal: 8.0, vertical: 4.0),
//                                               child: Text(
//                                                 'Payment pending',
//                                                 style: GoogleFonts.poppins(
//                                                   textStyle: TextStyle(
//                                                     fontSize: 8.sp,
//                                                     fontWeight: FontWeight.w500,
//                                                     color:
//                                                     Color.fromRGBO(255, 255, 255, 1),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 SizedBox(height: 2.h),
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(horizontal: 12.0),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         'February 13, 2024 at 7:25 pm from Estimates',
//                                         style: GoogleFonts.poppins(
//                                           textStyle: TextStyle(
//                                             fontWeight: FontWeight.w500,
//                                             fontSize: 9.sp,
//                                             color: Color.fromRGBO(159, 159, 159, 1),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                             height:
//                             10), // Space between the container and the next element
//                         DetailCustomContainer(
//                           borderRadius: 6.w,
//                           vMargin: 1.h,
//                           hMargin: 5.w,
//                           hpadding: 3.w,
//                           vpadding: 2.h,
//                           child: ListView.builder(
//                             shrinkWrap: true,
//                             itemCount: 2, // Set itemCount to 2
//                             physics: NeverScrollableScrollPhysics(),
//                             padding: EdgeInsets.zero,
//                             itemBuilder: (context, index) {
//                               if (index == 0) {
//                                 // First Container
//                                 return Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Row(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         Container(
//                                           height: 8.h,
//                                           width: 17.w,
//                                           decoration: BoxDecoration(
//                                             color: Color.fromRGBO(239, 239, 239, 1),
//                                             borderRadius: BorderRadius.circular(2.w),
//                                           ),
//                                           child: Padding(
//                                             padding: const EdgeInsets.all(5.0),
//                                             child: SizedBox(
//                                               child: Image.asset(
//                                                 AppImages.car_benz,
//                                                 fit: BoxFit.contain,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                         SizedBox(
//                                             width: 2.w), // Space between image and texts
//                                         Expanded(
//                                           child: Column(
//                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                             children: [
//                                               SizedBox(
//                                                 width: 65.w,
//                                                 child: Row(
//                                                   children: [
//                                                     Expanded(
//                                                       child: Text(
//                                                         'Tune Up - Scheduled Maintenance',
//                                                         style: Theme.of(context)
//                                                             .textTheme
//                                                             .bodyLarge!
//                                                             .copyWith(
//                                                           color: AppColors.textColor,
//                                                           fontSize: 11.sp,
//                                                           fontWeight: FontWeight.w500,
//                                                           height: 1.5,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                     Image.asset(
//                                                       AppImages.toggle,
//                                                       height: 20,
//                                                       width: 20,
//                                                     )
//                                                   ],
//                                                 ),
//                                               ),
//                                               SizedBox(height: 1.h),
//                                               Text(
//                                                 "\$958.500",
//                                                 style: Theme.of(context)
//                                                     .textTheme
//                                                     .bodyLarge!
//                                                     .copyWith(
//                                                   color: AppColors.primary,
//                                                   fontSize: 12.sp,
//                                                   fontWeight: FontWeight.w800,
//                                                 ),
//                                               ),

//                                               SizedBox(height: 1.5.h),
//                                               Row(
//                                                 mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                                 children: [
//                                                   Text(
//                                                     "Qty: 1",
//                                                     style: Theme.of(context)
//                                                         .textTheme
//                                                         .bodyMedium!
//                                                         .copyWith(
//                                                       color:
//                                                       Color.fromRGBO(159, 159, 159, 1),
//                                                       fontWeight: FontWeight.w600,
//                                                       fontSize: 10.sp,
//                                                     ),
//                                                   ),

//                                                   GestureDetector(
//                                                     child:
//                                                     Row(
//                                                       children: [
//                                                         Text(
//                                                           "View Details  ",
//                                                           style: Theme.of(context)
//                                                               .textTheme
//                                                               .bodyLarge!
//                                                               .copyWith(
//                                                             color: AppColors.primary,
//                                                             fontSize: 10.sp,
//                                                             fontWeight: FontWeight.w600,
//                                                             decoration:
//                                                             TextDecoration.underline,
//                                                             decorationColor:
//                                                             AppColors.primary,
//                                                           ),
//                                                         ),
//                                                         Icon(Icons.keyboard_arrow_down_outlined)
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     SizedBox(height: 1.3.h),
//                                   ],
//                                 );
//                               } else if (index == 1) {
//                                 // Second Container
//                                 return Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Row(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         Padding(
//                                           padding: const EdgeInsets.only(top: 8.0),
//                                           child: Container(
//                                             height: 8.h,
//                                             width: 16.w,
//                                             decoration: BoxDecoration(
//                                               // Different color or other changes
//                                               borderRadius: BorderRadius.circular(2.w),
//                                             ),
//                                             child: Image.asset(
//                                               AppImages.Registration,
//                                               fit: BoxFit.fill,
//                                             ),
//                                           ),
//                                         ),
//                                         SizedBox(
//                                             width: 2.w), // Space between image and texts
//                                         Expanded(
//                                           child: Column(
//                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                             children: [
//                                               SizedBox(
//                                                 width: 65.w,
//                                                 child: Row(
//                                                   mainAxisAlignment:
//                                                   MainAxisAlignment.spaceBetween,
//                                                   children: [
//                                                     Text(
//                                                       'Registration',
//                                                       style: Theme.of(context)
//                                                           .textTheme
//                                                           .bodyLarge!
//                                                           .copyWith(
//                                                         color: AppColors.textColor,
//                                                         fontSize: 11.sp,
//                                                         fontWeight: FontWeight.w500,
//                                                         height: 1,
//                                                       ),
//                                                     ),
//                                                     Image.asset(
//                                                       AppImages.toggle,
//                                                       height: 5.h,
//                                                       width: 5.w,
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                               Text(
//                                                 "\$500",
//                                                 style: Theme.of(context)
//                                                     .textTheme
//                                                     .bodyLarge!
//                                                     .copyWith(
//                                                   color: AppColors.primary,
//                                                   fontSize: 12.sp,
//                                                   fontWeight: FontWeight.w800,
//                                                 ),
//                                               ),

//                                               SizedBox(height: 1.5.h),
//                                               Row(
//                                                 mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                                 children: [
//                                                   Text(
//                                                     "Qty: 1",
//                                                     style: Theme.of(context)
//                                                         .textTheme
//                                                         .bodyMedium!
//                                                         .copyWith(
//                                                       color:
//                                                       Color.fromRGBO(159, 159, 159, 1),
//                                                       fontWeight: FontWeight.w600,
//                                                       fontSize: 10.sp,
//                                                     ),
//                                                   ),

//                                                   GestureDetector(
//                                                     child: Row(
//                                                       children: [
//                                                         Text(
//                                                           "View Details  ",
//                                                           style: Theme.of(context)
//                                                               .textTheme
//                                                               .bodyLarge!
//                                                               .copyWith(
//                                                             color: AppColors.primary,
//                                                             fontSize: 10.sp,
//                                                             fontWeight: FontWeight.w600,
//                                                             decoration:
//                                                             TextDecoration.underline,
//                                                             decorationColor:
//                                                             AppColors.primary,
//                                                           ),
//                                                         ),
//                                                         Icon(Icons.keyboard_arrow_down_outlined)
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     // SizedBox(height: 1.3.h),
//                                     // Padding(
//                                     //     padding: const EdgeInsets.symmetric(
//                                     //         horizontal: 0.0, vertical: 8),
//                                     //     child: Container(
//                                     //       height: 7.h,
//                                     //       width: double.infinity,
//                                     //       decoration: BoxDecoration(
//                                     //         color: Color.fromRGBO(255, 255, 255, 1),
//                                     //         borderRadius: BorderRadius.circular(16),
//                                     //         border: Border.all(
//                                     //             width: 1,
//                                     //             color: Color.fromRGBO(235, 223, 224, 1)),
//                                     //       ),
//                                     //       child: Column(
//                                     //         mainAxisAlignment: MainAxisAlignment.center,
//                                     //         crossAxisAlignment: CrossAxisAlignment.center,
//                                     //         children: [
//                                     //           Padding(
//                                     //             padding: const EdgeInsets.symmetric(
//                                     //                 horizontal: 15.0),
//                                     //             child: Row(
//                                     //               mainAxisAlignment:
//                                     //               MainAxisAlignment.spaceBetween,
//                                     //               children: [
//                                     //                 Text('Documents'),
//                                     //                 Image.asset(
//                                     //                   AppImages.Vector,
//                                     //                   height: 1.2.h,
//                                     //                 )
//                                     //               ],
//                                     //             ),
//                                     //           )
//                                     //         ],
//                                     //       ),
//                                     //     )),
//                                     // Padding(
//                                     //     padding: const EdgeInsets.symmetric(
//                                     //         horizontal: 0.0, vertical: 8),
//                                     //     child: Container(
//                                     //       height: 7.h,
//                                     //       width: double.infinity,
//                                     //       decoration: BoxDecoration(
//                                     //         color: Color.fromRGBO(255, 255, 255, 1),
//                                     //         borderRadius: BorderRadius.circular(16),
//                                     //         border: Border.all(
//                                     //             width: 1,
//                                     //             color: Color.fromRGBO(235, 223, 224, 1)),
//                                     //       ),
//                                     //       child: Column(
//                                     //         mainAxisAlignment: MainAxisAlignment.center,
//                                     //         crossAxisAlignment: CrossAxisAlignment.center,
//                                     //         children: [
//                                     //           Padding(
//                                     //             padding: const EdgeInsets.symmetric(
//                                     //                 horizontal: 15.0),
//                                     //             child: Row(
//                                     //               mainAxisAlignment:
//                                     //               MainAxisAlignment.spaceBetween,
//                                     //               children: [
//                                     //                 Text('Reports'),
//                                     //                 Image.asset(
//                                     //                   AppImages.Vector,
//                                     //                   height: 1.2.h,
//                                     //                 )
//                                     //               ],
//                                     //             ),
//                                     //           )
//                                     //         ],
//                                     //       ),
//                                     //     )),
//                                   ],
//                                 );
//                               } else {
//                                 // Fallback in case index is not 0 or 1
//                                 return SizedBox.shrink(); // Return an empty widget
//                               }
//                             },
//                           ),
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                           child: Container(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                               color: Color.fromRGBO(255, 255, 255, 1),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Color.fromRGBO(28, 28, 28, 0.1),
//                                   offset: Offset(0, 2),
//                                   blurRadius: 20,
//                                 ),
//                               ],
//                             ),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 SizedBox(
//                                   height: 20,
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(horizontal: 18.0),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     children: [
//                                       Container(
//                                         decoration: BoxDecoration(
//                                           color: Color.fromRGBO(108, 204, 52, 1),
//                                           borderRadius: BorderRadius.circular(8),
//                                         ),
//                                         child: Padding(
//                                           padding: const EdgeInsets.symmetric(
//                                               horizontal: 8.0, vertical: 4.0),
//                                           child: Row(children: [
//                                             Image.asset(
//                                               AppImages.truck,
//                                               height: 1.2.h,
//                                             ),
//                                             Text(
//                                               ' Fulfilled',
//                                               style: GoogleFonts.poppins(
//                                                 textStyle: TextStyle(
//                                                   fontSize: 8.sp,
//                                                   fontWeight: FontWeight.w500,
//                                                   color: Color.fromRGBO(255, 255, 255, 1),
//                                                 ),
//                                               ),
//                                             ),
//                                           ]),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                                 SizedBox(height: 2.h),
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 18.0, right: 10),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     children: [
//                                       Expanded(
//                                         child: Text(
//                                           'February 14, 2024 at 6:30 am - 4517 Washington',
//                                           style: GoogleFonts.poppins(
//                                             textStyle: TextStyle(
//                                               fontWeight: FontWeight.w500,
//                                               fontSize: 9.sp,
//                                               color: Color.fromRGBO(159, 159, 159, 1),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.all(18.0),
//                                   child: Container(
//                                     height: 10.h,
//                                     width: double.infinity,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(16),
//                                       color: Color.fromRGBO(252, 242, 242, 1),
//                                     ),
//                                     child: Padding(
//                                       padding:
//                                       const EdgeInsets.symmetric(horizontal: 16.0),
//                                       child: Column(
//                                         mainAxisAlignment: MainAxisAlignment
//                                             .center, // Center content vertically in the Column
//                                         crossAxisAlignment: CrossAxisAlignment
//                                             .center, // Center content horizontally in the Column (for alignment within the Column)
//                                         children: [
//                                           Row(
//                                             mainAxisAlignment: MainAxisAlignment
//                                                 .start, // Align content at the start of the Row
//                                             children: [
//                                               Text(
//                                                 'Tracking Number',
//                                                 style: GoogleFonts.poppins(
//                                                     fontWeight: FontWeight.w500,
//                                                     fontSize: 10.sp,
//                                                     color: Color.fromRGBO(84, 84, 84, 1)),
//                                               ),
//                                             ],
//                                           ),
//                                           SizedBox(
//                                             height: 1.h,
//                                           ),
//                                           Row(
//                                             mainAxisAlignment: MainAxisAlignment
//                                                 .start, // Align content at the start of the Row
//                                             children: [
//                                               Text(
//                                                 '123456789ABC',
//                                                 style: GoogleFonts.poppins(
//                                                     textStyle: TextStyle(
//                                                         fontSize: 13.sp,
//                                                         fontWeight: FontWeight.w600,
//                                                         color: Color.fromRGBO(
//                                                             217, 50, 67, 1))),
//                                               ),
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 16, vertical: 8),
//                                     child: Container(
//                                       height: 7.h,
//                                       width: double.infinity,
//                                       decoration: BoxDecoration(
//                                         color: Color.fromRGBO(255, 255, 255, 1),
//                                         borderRadius: BorderRadius.circular(16),
//                                         border: Border.all(
//                                             width: 1,
//                                             color: Color.fromRGBO(235, 223, 224, 1)),
//                                       ),
//                                       child: Column(
//                                         mainAxisAlignment: MainAxisAlignment.center,
//                                         crossAxisAlignment: CrossAxisAlignment.center,
//                                         children: [
//                                           Padding(
//                                             padding: const EdgeInsets.symmetric(
//                                                 horizontal: 15.0),
//                                             child: Row(
//                                               mainAxisAlignment:
//                                               MainAxisAlignment.spaceBetween,
//                                               children: [
//                                                 Text('Documents'),
//                                                 Icon(Icons.keyboard_arrow_right,size: 4.h,)
//                                               ],
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                     )),
//                                 Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 16.0, vertical: 8),
//                                     child: Container(
//                                       height: 7.h,
//                                       width: double.infinity,
//                                       decoration: BoxDecoration(
//                                         color: Color.fromRGBO(255, 255, 255, 1),
//                                         borderRadius: BorderRadius.circular(16),
//                                         border: Border.all(
//                                             width: 1,
//                                             color: Color.fromRGBO(235, 223, 224, 1)),
//                                       ),
//                                       child: Column(
//                                         mainAxisAlignment: MainAxisAlignment.center,
//                                         crossAxisAlignment: CrossAxisAlignment.center,
//                                         children: [
//                                           Padding(
//                                             padding: const EdgeInsets.symmetric(
//                                                 horizontal: 15.0),
//                                             child: Row(
//                                               mainAxisAlignment:
//                                               MainAxisAlignment.spaceBetween,
//                                               children: [
//                                                 Text('Reports'),
//                                                 Icon(Icons.keyboard_arrow_right,size: 4.h,)

//                                               ],
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                     )),
//                                 Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: [
//                                     // Your existing components
//                                     // ...

//                                     Padding(
//                                       padding: const EdgeInsets.all(16.0),
//                                       child: Column(
//                                         children: [
//                                           Row(
//                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                             children: [
//                                               Container(
//                                                 height: 8.h,
//                                                 width: 16.w,
//                                                 decoration: BoxDecoration(
//                                                   borderRadius:
//                                                   BorderRadius.circular(2.w),
//                                                 ),
//                                                 child: Image.asset(
//                                                   AppImages.Registration,
//                                                   fit: BoxFit.fill,
//                                                 ),
//                                               ),
//                                               SizedBox(width: 2.w),
//                                               Expanded(
//                                                 child: Column(
//                                                   crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                                   children: [
//                                                     SizedBox(
//                                                       width: 60.w,
//                                                       child: Row(
//                                                         mainAxisAlignment:
//                                                         MainAxisAlignment.spaceBetween,
//                                                         children: [
//                                                           Text(
//                                                             'Registration',
//                                                             style: Theme.of(context)
//                                                                 .textTheme
//                                                                 .bodyLarge!
//                                                                 .copyWith(
//                                                               color:
//                                                               AppColors.textColor,
//                                                               fontSize: 11.sp,
//                                                               fontWeight:
//                                                               FontWeight.w500,
//                                                               height: 1,
//                                                             ),
//                                                           ),
//                                                           Image.asset(AppImages.toggle,
//                                                               height: 20, width: 20),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                     SizedBox(height: 1.h),
//                                                     Text(
//                                                       "Qty: 1",
//                                                       style: Theme.of(context)
//                                                           .textTheme
//                                                           .bodyMedium!
//                                                           .copyWith(
//                                                         color: Color.fromRGBO(
//                                                             159, 159, 159, 1),
//                                                         fontWeight: FontWeight.w600,
//                                                         fontSize: 9.sp,
//                                                       ),
//                                                     ),
//                                                     SizedBox(height: 1.5.h),
//                                                     Row(
//                                                       mainAxisAlignment:
//                                                       MainAxisAlignment.spaceBetween,
//                                                       children: [
//                                                         Text(
//                                                           "\$500  ",
//                                                           style: Theme.of(context)
//                                                               .textTheme
//                                                               .bodyLarge!
//                                                               .copyWith(
//                                                             color: AppColors.primary,
//                                                             fontSize: 11.sp,
//                                                             fontWeight: FontWeight.w800,
//                                                           ),
//                                                         ),
//                                                         GestureDetector(
//                                                           onTap: _toggleExpand,
//                                                           child: Row(
//                                                             children: [
//                                                               Text(
//                                                                 _isExpanded
//                                                                     ? "Hide Details "
//                                                                     : "View Details ",
//                                                                 style: Theme.of(context)
//                                                                     .textTheme
//                                                                     .bodyLarge!
//                                                                     .copyWith(
//                                                                   color: AppColors.primary,
//                                                                   fontSize: 9.sp,
//                                                                   fontWeight:
//                                                                   FontWeight.w600,
//                                                                   decoration: TextDecoration
//                                                                       .underline,
//                                                                   decorationColor:
//                                                                   AppColors.primary,
//                                                                 ),
//                                                               ),
//                                                               Icon(Icons.keyboard_arrow_down_outlined)
//                                                             ],
//                                                           ),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                           if (_isExpanded) ...[
//                                             SizedBox(
//                                               height: 1.h,
//                                             ),
//                                             Container(
//                                               margin: EdgeInsets.only(top: 1.h),
//                                               decoration: BoxDecoration(
//                                                 border: Border(
//                                                   bottom: BorderSide(
//                                                       color: Color.fromRGBO(
//                                                           235, 223, 224, 1),
//                                                       width: 1.0), // Baby pink color
//                                                 ),
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               height: 1.h,
//                                             ),
//                                             Row(
//                                               mainAxisAlignment:
//                                               MainAxisAlignment.spaceBetween,
//                                               children: [
//                                                 Row(
//                                                   children: [
//                                                     Text(
//                                                       '2019 BMW x 3  ACJ 1827',
//                                                       style: Theme.of(context)
//                                                           .textTheme
//                                                           .bodyLarge!
//                                                           .copyWith(
//                                                         fontFamily: 'Poppins',
//                                                         color: Colors.black,
//                                                         fontSize: 11.sp,
//                                                       ),
//                                                     ),
//                                                     Text('  Completed',style: GoogleFonts.poppins(textStyle: TextStyle(
//                                                         color: Colors.green,
//                                                         fontSize: 9.sp,
//                                                         fontWeight: FontWeight.w600

//                                                     )),)
//                                                   ],
//                                                 ),
//                                                 Image.asset(
//                                                   AppImages.arrow_circle_right,
//                                                   height: 5.h,
//                                                   width: 5.w,
//                                                 )
//                                               ],
//                                             ),
//                                             Container(
//                                               margin: EdgeInsets.only(top: 1.h),
//                                               decoration: BoxDecoration(
//                                                 border: Border(
//                                                   bottom: BorderSide(
//                                                       color: Color.fromRGBO(
//                                                           235, 223, 224, 1),
//                                                       width: 1.0), // Baby pink color
//                                                 ),
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               height: 1.h,
//                                             ),
//                                             Row(
//                                               mainAxisAlignment:
//                                               MainAxisAlignment.spaceBetween,
//                                               children: [
//                                                 Row(
//                                                   children: [
//                                                     Text(
//                                                       '2022 Toyota ACJ 1840',
//                                                       style: Theme.of(context)
//                                                           .textTheme
//                                                           .bodyLarge!
//                                                           .copyWith(
//                                                         fontFamily: 'Poppins',
//                                                         color: Colors.black,
//                                                         fontSize: 11.sp,
//                                                       ),
//                                                     ),
//                                                     Text('  Pending',style: GoogleFonts.poppins(textStyle: TextStyle(
//                                                         color: Colors.yellow,
//                                                         fontSize: 9.sp,
//                                                         fontWeight: FontWeight.w600

//                                                     )),)
//                                                   ],
//                                                 ),
//                                                 Image.asset(
//                                                   AppImages.arrow_circle_right,
//                                                   height: 5.h,
//                                                   width: 5.w,
//                                                 )
//                                               ],
//                                             ),

//                                           ],
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 30,
//                         ),

//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                           child: Container(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                               color: Color.fromRGBO(255, 255, 255, 1),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Color.fromRGBO(28, 28, 28, 0.1),
//                                   offset: Offset(0, 2),
//                                   blurRadius: 20,
//                                 ),
//                               ],
//                             ),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 SizedBox(
//                                   height: 20,
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(horizontal: 14.0),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     children: [
//                                       Container(
//                                         decoration: BoxDecoration(
//                                           color: Color.fromRGBO(240, 78, 94, 1),
//                                           borderRadius: BorderRadius.circular(8),
//                                         ),
//                                         child: Padding(
//                                           padding: const EdgeInsets.symmetric(
//                                               horizontal: 8, vertical: 4),
//                                           child: Row(children: [
//                                             Image.asset(
//                                               AppImages.box,
//                                               height: 1.5.h,
//                                             ),
//                                             Text(
//                                               '  Payment pending',
//                                               style: GoogleFonts.poppins(
//                                                 textStyle: TextStyle(
//                                                   fontSize: 8.sp,
//                                                   fontWeight: FontWeight.w500,
//                                                   color: Color.fromRGBO(255, 255, 255, 1),
//                                                 ),
//                                               ),
//                                             ),
//                                           ]),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                                 SizedBox(height: 2.h),
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(horizontal: 15.0),
//                                   child: Container(
//                                     height: 8.h,
//                                     decoration: BoxDecoration(
//                                       border: Border(
//                                         bottom: BorderSide(
//                                           color: Color.fromRGBO(
//                                             235,
//                                             223,
//                                             224,
//                                             1,
//                                           ), // Change this to your desired color
//                                           width: 0.5
//                                               .w, // Adjust the thickness of the bottom line
//                                         ),
//                                       ),
//                                     ),
//                                     child: Row(
//                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                       crossAxisAlignment: CrossAxisAlignment.center,
//                                       children: [
//                                         Text(
//                                           'Subtotal',
//                                           style: GoogleFonts.poppins(
//                                               textStyle: TextStyle(
//                                                 fontSize: 11.sp,
//                                                 color: Color.fromRGBO(159, 159, 159, 1),
//                                                 fontWeight: FontWeight.w500,
//                                               )),
//                                         ),
//                                         Text('\$2,259.00',
//                                             style: GoogleFonts.poppins(
//                                                 textStyle: TextStyle(
//                                                   fontSize: 11.sp,
//                                                   color: Color.fromRGBO(31, 31, 31, 1),
//                                                   fontWeight: FontWeight.w500,
//                                                 ))),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(horizontal: 15.0),
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                       border: Border(
//                                         bottom: BorderSide(
//                                           color: Color.fromRGBO(
//                                             235,
//                                             223,
//                                             224,
//                                             1,
//                                           ), // Change this to your desired color
//                                           width: 0.5
//                                               .w, // Adjust the thickness of the bottom line
//                                         ),
//                                       ),
//                                     ),
//                                     child: Row(
//                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                       crossAxisAlignment: CrossAxisAlignment.center,
//                                       children: [
//                                         Column(
//                                           children: [
//                                             SizedBox(
//                                               height: 1.h,
//                                             ),
//                                             Container(
//                                               child: Row(
//                                                 mainAxisAlignment:
//                                                 MainAxisAlignment.start,
//                                                 children: [
//                                                   Text(
//                                                     'Taxes        ',
//                                                     style: GoogleFonts.poppins(
//                                                         textStyle: TextStyle(
//                                                           fontSize: 11.sp,
//                                                           color:
//                                                           Color.fromRGBO(31, 31, 31, 1),
//                                                           fontWeight: FontWeight.w500,
//                                                         )),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               height: 1.h,
//                                             ),
//                                             Text(
//                                               'VAT (16%)',
//                                               style: GoogleFonts.poppins(
//                                                   textStyle: TextStyle(
//                                                     fontSize: 11.sp,
//                                                     color: Color.fromRGBO(159, 159, 159, 1),
//                                                     fontWeight: FontWeight.w500,
//                                                   )),
//                                             ),
//                                             SizedBox(
//                                               height: 2.h,
//                                             )
//                                           ],
//                                         ),
//                                         Text('\$0.00',
//                                             style: GoogleFonts.poppins(
//                                                 textStyle: TextStyle(
//                                                   fontSize: 11.sp,
//                                                   color: Color.fromRGBO(31, 31, 31, 1),
//                                                   fontWeight: FontWeight.w500,
//                                                 ))),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(horizontal: 15.0),
//                                   child: Container(
//                                     height: 8.h,
//                                     decoration: BoxDecoration(
//                                       border: Border(
//                                         bottom: BorderSide(
//                                           color: Color.fromRGBO(
//                                             235,
//                                             223,
//                                             224,
//                                             1,
//                                           ), // Change this to your desired color
//                                           width: 0.5
//                                               .w, // Adjust the thickness of the bottom line
//                                         ),
//                                       ),
//                                     ),
//                                     child: Row(
//                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                       crossAxisAlignment: CrossAxisAlignment.center,
//                                       children: [
//                                         Text(
//                                           'Total',
//                                           style: GoogleFonts.poppins(
//                                               textStyle: TextStyle(
//                                                 fontSize: 11.sp,
//                                                 color: Color.fromRGBO(31, 31, 31, 1),
//                                                 fontWeight: FontWeight.w500,
//                                               )),
//                                         ),
//                                         Text('\$2,259.00',
//                                             style: GoogleFonts.poppins(
//                                                 textStyle: TextStyle(
//                                                   fontSize: 13.sp,
//                                                   color: Color.fromRGBO(217, 50, 67, 1),
//                                                   fontWeight: FontWeight.w700,
//                                                 ))),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.all(16.0),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Text(
//                                         'Paid',
//                                         style: GoogleFonts.poppins(
//                                             textStyle: TextStyle(
//                                               fontSize: 11.sp,
//                                               color: Color.fromRGBO(159, 159, 159, 1),
//                                               fontWeight: FontWeight.w500,
//                                             )),
//                                       ),
//                                       Text(
//                                         '\$0.00',
//                                         style: GoogleFonts.poppins(
//                                             textStyle: TextStyle(
//                                               fontSize: 11.sp,
//                                               color: Color.fromRGBO(31, 31, 31, 1),
//                                               fontWeight: FontWeight.w500,
//                                             )),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 16.0, vertical: 10),
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Row(
//                                         mainAxisAlignment: MainAxisAlignment.start,
//                                         children: [
//                                           Text(
//                                             'Due Date',
//                                             style: GoogleFonts.poppins(
//                                               fontSize: 11.sp,
//                                               fontWeight: FontWeight.w500,
//                                               color: Color.fromRGBO(31, 31, 31, 1),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       SizedBox(
//                                         height: 10,
//                                       ),
//                                       Row(
//                                         mainAxisAlignment: MainAxisAlignment.start,
//                                         children: [
//                                           Text(
//                                             'Payment due on February 14, 2024',
//                                             style: GoogleFonts.poppins(
//                                                 textStyle: TextStyle(
//                                                     fontSize: 11.sp,
//                                                     fontWeight: FontWeight.w500,
//                                                     color:
//                                                     Color.fromRGBO(217, 50, 67, 1))),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 14,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(16.0),
//                           child: Container(
//                             decoration: BoxDecoration(
//                               color: Color.fromRGBO(217, 50, 67, 1),
//                               borderRadius: BorderRadius.circular(60),
//                             ),
//                             height: 8.h,
//                             width: double.infinity,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   'Choose Payment Method',
//                                   style: GoogleFonts.poppins(
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 15.sp,
//                                       color: Color.fromRGBO(255, 255, 255, 1)),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         // Padding(
//                         //   padding:
//                         //   const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
//                         //   child: Row(
//                         //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         //     children: [
//                         //       Text(
//                         //         'Attachments',
//                         //         style: GoogleFonts.poppins(
//                         //             fontSize: 15.sp,
//                         //             fontWeight: FontWeight.w600,
//                         //             color: Color.fromRGBO(31, 31, 31, 1)),
//                         //       ),
//                         //       Image.asset(
//                         //         AppImages.just,
//                         //         height: 5.h,
//                         //         width: 5.w,
//                         //       )
//                         //     ],
//                         //   ),
//                         // ),
//                         //
//                         // // Padding(
//                         // //   padding:
//                         // //   const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
//                         // //   child: Container(
//                         // //     padding: EdgeInsets.all(8.0), // Adjust padding as needed
//                         // //     decoration: BoxDecoration(
//                         // //       color: Colors.white, // Set a background color if needed
//                         // //       borderRadius: BorderRadius.circular(
//                         // //           20.0), // Adjust the border radius as needed
//                         // //       boxShadow: [
//                         // //         BoxShadow(
//                         // //           color: Color.fromRGBO(28, 28, 28, 0.1), // Shadow color
//                         // //           offset: Offset(0, 2), // Offset of the shadow
//                         // //           blurRadius: 20, // Blur radius of the shadow
//                         // //           spreadRadius: 0, // Spread radius of the shadow
//                         // //         ),
//                         // //       ],
//                         // //     ),
//                         // //     child: Row(
//                         // //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         // //       crossAxisAlignment: CrossAxisAlignment.center,
//                         // //       children: [
//                         // //         // Circular container with image
//                         // //         Container(
//                         // //           height: 6.h,
//                         // //           width: 10.w,
//                         // //           decoration: BoxDecoration(
//                         // //             color: Color.fromRGBO(252, 242, 242, 1),
//                         // //             borderRadius: BorderRadius.circular(12),
//                         // //           ),
//                         // //           child: Padding(
//                         // //             padding: const EdgeInsets.all(8.0),
//                         // //             child: Image.asset(
//                         // //               AppImages.pdf,
//                         // //             ),
//                         // //           ),
//                         // //         ),
//                         // //         // Expanded widget to push the text and the second image to the edges
//                         // //         Expanded(
//                         // //           child: Padding(
//                         // //             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                         // //             child: Text(
//                         // //               ' Insurance Certificate',
//                         // //               style: GoogleFonts.poppins(
//                         // //                 textStyle: TextStyle(
//                         // //                   fontSize: 13.sp,
//                         // //                   fontWeight: FontWeight.w500,
//                         // //                   color: Color.fromRGBO(31, 31, 31, 1),
//                         // //                 ),
//                         // //               ),
//                         // //             ),
//                         // //           ),
//                         // //         ),
//                         // //         // Circular container with image
//                         // //         ClipOval(
//                         // //           child: Container(
//                         // //             width:
//                         // //             30, // Adjust the width of the circular container
//                         // //             height:
//                         // //             30, // Adjust the height of the circular container
//                         // //             color: Color.fromRGBO(217, 50, 67,
//                         // //                 1), // Background color for the circular container
//                         // //             child: Center(
//                         // //               child: Image.asset(
//                         // //                 AppImages.cloud, // Replace with your image path
//                         // //                 width: 16.8, // Adjust width as needed
//                         // //                 height: 14.0, // Adjust height as needed
//                         // //               ),
//                         // //             ),
//                         // //           ),
//                         // //         ),
//                         // //       ],
//                         // //     ),
//                         // //   ),
//                         // // ),
//                         // SizedBox(
//                         //   height: 1.h,
//                         // ),
//                         // Padding(
//                         //   padding:
//                         //   const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
//                         //   child: Row(
//                         //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         //     children: [
//                         //       Text(
//                         //         'Reports',
//                         //         style: GoogleFonts.poppins(
//                         //             fontSize: 15.sp,
//                         //             fontWeight: FontWeight.w600,
//                         //             color: Color.fromRGBO(31, 31, 31, 1)),
//                         //       ),
//                         //       Image.asset(
//                         //         AppImages.just,
//                         //         height: 5.h,
//                         //         width: 5.w,
//                         //       )
//                         //     ],
//                         //   ),
//                         // ),
//                         // // Padding(
//                         // //   padding:
//                         // //   const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
//                         // //   child: Container(
//                         // //     padding: EdgeInsets.all(8.0), // Adjust padding as needed
//                         // //     decoration: BoxDecoration(
//                         // //       color: Colors.white, // Set a background color if needed
//                         // //       borderRadius: BorderRadius.circular(
//                         // //           20.0), // Adjust the border radius as needed
//                         // //       boxShadow: [
//                         // //         BoxShadow(
//                         // //           color: Color.fromRGBO(28, 28, 28, 0.1), // Shadow color
//                         // //           offset: Offset(0, 2), // Offset of the shadow
//                         // //           blurRadius: 20, // Blur radius of the shadow
//                         // //           spreadRadius: 0, // Spread radius of the shadow
//                         // //         ),
//                         // //       ],
//                         // //     ),
//                         // //     child: Row(
//                         // //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         // //       crossAxisAlignment: CrossAxisAlignment.center,
//                         // //       children: [
//                         // //         // Circular container with image
//                         // //         Container(
//                         // //           height: 6.h,
//                         // //           width: 10.w,
//                         // //           decoration: BoxDecoration(
//                         // //             color: Color.fromRGBO(252, 242, 242, 1),
//                         // //             borderRadius: BorderRadius.circular(2.w),
//                         // //           ),
//                         // //           child: Padding(
//                         // //             padding: const EdgeInsets.all(8.0),
//                         // //             child: Image.asset(
//                         // //               AppImages.document,
//                         // //               fit: BoxFit.cover, // Adjust as needed
//                         // //             ),
//                         // //           ),
//                         // //         ),
//                         // //         // Expanded widget to push the text and the second image to the edges
//                         // //         Expanded(
//                         // //           child: Padding(
//                         // //             padding: const EdgeInsets.symmetric(horizontal: 8),
//                         // //             child: Column(
//                         // //               children: [
//                         // //                 Text(
//                         // //                   'Inspection Report ABC 1234',
//                         // //                   style: GoogleFonts.poppins(
//                         // //                     textStyle: TextStyle(
//                         // //                       fontSize: 13.sp,
//                         // //                       fontWeight: FontWeight.w500,
//                         // //                       color: Color.fromRGBO(31, 31, 31, 1),
//                         // //                     ),
//                         // //                   ),
//                         // //                 ),
//                         // //                 Row(
//                         // //                   mainAxisAlignment: MainAxisAlignment.start,
//                         // //                   children: [
//                         // //                     Padding(
//                         // //                       padding: const EdgeInsets.symmetric(
//                         // //                           horizontal: 8.0),
//                         // //                       child: Text(
//                         // //                         'Created Date: 20/3/2024',
//                         // //                         style: GoogleFonts.poppins(
//                         // //                           fontWeight: FontWeight.w400,
//                         // //                           fontSize: 10.sp,
//                         // //                           color: Color.fromRGBO(84, 84, 84, 1),
//                         // //                         ),
//                         // //                       ),
//                         // //                     ),
//                         // //                   ],
//                         // //                 ),
//                         // //               ],
//                         // //             ),
//                         // //           ),
//                         // //         ),
//                         // //         // Circular container with image
//                         // //         ClipOval(
//                         // //           child: Container(
//                         // //             width:
//                         // //             30.0, // Adjust the width of the circular container
//                         // //             height:
//                         // //             30.0, // Adjust the height of the circular container
//                         // //             color: Color.fromRGBO(217, 50, 67,
//                         // //                 1), // Background color for the circular container
//                         // //             child: Center(
//                         // //               child: Image.asset(
//                         // //                 AppImages
//                         // //                     .arrow_right, // Replace with your image path
//                         // //                 width: 16.8, // Adjust width as needed
//                         // //                 height: 14.0, // Adjust height as needed
//                         // //               ),
//                         // //             ),
//                         // //           ),
//                         // //         ),
//                         // //       ],
//                         // //     ),
//                         //   ),
//                         // ),
//                         SizedBox(
//                           height: 1.h,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Obx(
//                       () =>
//                   controller.popUp.value == true
//                       ? OrderPopUpMenu()
//                       : SizedBox.shrink(),
//                 ),
//               ],
//             )),

//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:nanduba/controllers/order_detail_controller.dart';
// import 'package:nanduba/export.dart';
// import 'package:nanduba/views/Profile/Chose_payment/Chose_payment.dart';
// import 'package:provider/provider.dart';

// import '../../providers/estimate_provider.dart';
// import 'DetailCustomContainer.dart';
// import 'component/order_pop_up_menu.dart';

// class OrderDetailedScreen extends StatefulWidget {
//   const OrderDetailedScreen({super.key});

//   @override
//   State<OrderDetailedScreen> createState() => _OrderDetailedScreenState();
// }

// class _OrderDetailedScreenState extends State<OrderDetailedScreen> {
//   final OrderDetailController controller = Get.find<OrderDetailController>();

//   bool _isExpanded = false;
//   void _toggleExpand() {
//     setState(() {
//       _isExpanded = !_isExpanded;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromRGBO(255, 255, 255, 1),
//       body: SafeArea(
//         child: Column(
//           children: [
//             SizedBox(height: 30),
//             Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 4.w),
//                 child: myAppBar(
//                   title: "Order Details",
//                   icon: AppSvgs.more_vert,
//                   iconColor: AppColors.border3,
//                   onTogglePressed: () {
//                     print("tapped");
//                     controller.showPopUp();
//                   },
//                 )),
//             Expanded(
//                 child: Stack(
//               children: [
//                 SingleChildScrollView(
//                   child: GestureDetector(
//                     onTap: () {
//                       if (controller.popUp.value == true) {
//                         controller.popUp.value = false;
//                       }
//                     },
//                     child: Column(
//                       children: [
//                         SizedBox(height: 30),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                           child: Container(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(25),
//                               color: Color.fromRGBO(255, 255, 255, 1),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Color.fromRGBO(28, 28, 28, 0.1),
//                                   offset: Offset(0, 2),
//                                   blurRadius: 20,
//                                 ),
//                               ],
//                             ),
//                             height: 11.h,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 14.0),
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     children: [
//                                       Text(
//                                         '#1003',
//                                         style: GoogleFonts.poppins(
//                                           textStyle: TextStyle(
//                                             fontWeight: FontWeight.w600,
//                                             fontSize: 13.sp,
//                                           ),
//                                         ),
//                                       ),
//                                       Row(
//                                         children: [
//                                           Container(
//                                             decoration: BoxDecoration(
//                                               color: Color.fromRGBO(
//                                                   55, 125, 215, 1),
//                                               borderRadius:
//                                                   BorderRadius.circular(8),
//                                             ),
//                                             child: Padding(
//                                               padding:
//                                                   const EdgeInsets.symmetric(
//                                                       horizontal: 8.0,
//                                                       vertical: 4.0),
//                                               child: Text(
//                                                 'Unfulfilled',
//                                                 style: GoogleFonts.poppins(
//                                                   textStyle: TextStyle(
//                                                     fontSize: 8.sp,
//                                                     fontWeight: FontWeight.w500,
//                                                     color: Color.fromRGBO(
//                                                         255, 255, 255, 1),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                               width:
//                                                   10), // Space between the tags
//                                           Container(
//                                             decoration: BoxDecoration(
//                                               borderRadius:
//                                                   BorderRadius.circular(8),
//                                               color: Color.fromRGBO(
//                                                   240, 78, 94, 1),
//                                             ),
//                                             child: Padding(
//                                               padding:
//                                                   const EdgeInsets.symmetric(
//                                                       horizontal: 8.0,
//                                                       vertical: 4.0),
//                                               child: Text(
//                                                 'Payment pending',
//                                                 style: GoogleFonts.poppins(
//                                                   textStyle: TextStyle(
//                                                     fontSize: 8.sp,
//                                                     fontWeight: FontWeight.w500,
//                                                     color: Color.fromRGBO(
//                                                         255, 255, 255, 1),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       '    Toyota Zombia',
//                                       style: GoogleFonts.poppins(
//                                         textStyle: TextStyle(
//                                           fontWeight: FontWeight.w600,
//                                           fontSize: 10.sp,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(height: 1.h),
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 12.0),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         'February 13, 2024 at 7:25 pm from Estimates',
//                                         style: GoogleFonts.poppins(
//                                           textStyle: TextStyle(
//                                             fontWeight: FontWeight.w500,
//                                             fontSize: 9.sp,
//                                             color: Color.fromRGBO(
//                                                 159, 159, 159, 1),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                             height:
//                                 10), // Space between the container and the next element
//                         DetailCustomContainer(
//                           borderRadius: 6.w,
//                           vMargin: 1.h,
//                           hMargin: 5.w,
//                           hpadding: 3.w,
//                           vpadding: 2.h,
//                           child: ListView.builder(
//                             shrinkWrap: true,
//                             itemCount: 2, // Set itemCount to 2
//                             physics: NeverScrollableScrollPhysics(),
//                             padding: EdgeInsets.zero,
//                             itemBuilder: (context, index) {
//                               if (index == 0) {
//                                 // First Container
//                                 return Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Row(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Container(
//                                           height: 8.h,
//                                           width: 17.w,
//                                           decoration: BoxDecoration(
//                                             color: Color.fromRGBO(
//                                                 239, 239, 239, 1),
//                                             borderRadius:
//                                                 BorderRadius.circular(2.w),
//                                           ),
//                                           child: Padding(
//                                             padding: const EdgeInsets.all(5.0),
//                                             child: SizedBox(
//                                               child: Image.asset(
//                                                 AppImages.car_benz,
//                                                 fit: BoxFit.contain,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                         SizedBox(
//                                             width: 2
//                                                 .w), // Space between image and texts
//                                         Expanded(
//                                           child: Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: [
//                                               SizedBox(
//                                                 width: 65.w,
//                                                 child: Row(
//                                                   children: [
//                                                     Expanded(
//                                                       child: Text(
//                                                         'Tune Up - Scheduled Maintenance',
//                                                         style: Theme.of(context)
//                                                             .textTheme
//                                                             .bodyLarge!
//                                                             .copyWith(
//                                                               color: AppColors
//                                                                   .textColor,
//                                                               fontSize: 11.sp,
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .w500,
//                                                               height: 1.5,
//                                                             ),
//                                                       ),
//                                                     ),
//                                                     Image.asset(
//                                                       AppImages.toggle,
//                                                       height: 20,
//                                                       width: 20,
//                                                     )
//                                                   ],
//                                                 ),
//                                               ),
//                                               SizedBox(height: 1.h),
//                                               Text(
//                                                 "\$958.500",
//                                                 style: Theme.of(context)
//                                                     .textTheme
//                                                     .bodyLarge!
//                                                     .copyWith(
//                                                       color: AppColors.black,
//                                                       fontSize: 12.sp,
//                                                       fontWeight:
//                                                           FontWeight.w800,
//                                                     ),
//                                               ),
//                                               SizedBox(height: 1.5.h),
//                                               Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceBetween,
//                                                 children: [
//                                                   Text(
//                                                     "Qty: 1",
//                                                     style: Theme.of(context)
//                                                         .textTheme
//                                                         .bodyMedium!
//                                                         .copyWith(
//                                                           color: Color.fromRGBO(
//                                                               159, 159, 159, 1),
//                                                           fontWeight:
//                                                               FontWeight.w600,
//                                                           fontSize: 10.sp,
//                                                         ),
//                                                   ),
//                                                   GestureDetector(
//                                                     child: Row(
//                                                       children: [
//                                                         Text(
//                                                           "View Details  ",
//                                                           style:
//                                                               Theme.of(context)
//                                                                   .textTheme
//                                                                   .bodyLarge!
//                                                                   .copyWith(
//                                                                     color: AppColors
//                                                                         .primary,
//                                                                     fontSize:
//                                                                         10.sp,
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .w600,
//                                                                     decoration:
//                                                                         TextDecoration
//                                                                             .underline,
//                                                                     decorationColor:
//                                                                         AppColors
//                                                                             .primary,
//                                                                   ),
//                                                         ),
//                                                         Icon(Icons
//                                                             .keyboard_arrow_down_outlined)
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     SizedBox(height: 1.3.h),
//                                   ],
//                                 );
//                               } else if (index == 1) {
//                                 // Second Container
//                                 return Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Row(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Padding(
//                                           padding:
//                                               const EdgeInsets.only(top: 8.0),
//                                           child: Container(
//                                             height: 8.h,
//                                             width: 16.w,
//                                             decoration: BoxDecoration(
//                                               // Different color or other changes
//                                               borderRadius:
//                                                   BorderRadius.circular(2.w),
//                                             ),
//                                             child: Image.asset(
//                                               AppImages.Registration,
//                                               fit: BoxFit.fill,
//                                             ),
//                                           ),
//                                         ),
//                                         SizedBox(
//                                             width: 2
//                                                 .w), // Space between image and texts
//                                         Expanded(
//                                           child: Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: [
//                                               SizedBox(
//                                                 width: 65.w,
//                                                 child: Row(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment
//                                                           .spaceBetween,
//                                                   children: [
//                                                     Text(
//                                                       'Registration',
//                                                       style: Theme.of(context)
//                                                           .textTheme
//                                                           .bodyLarge!
//                                                           .copyWith(
//                                                             color: AppColors
//                                                                 .textColor,
//                                                             fontSize: 11.sp,
//                                                             fontWeight:
//                                                                 FontWeight.w500,
//                                                             height: 1,
//                                                           ),
//                                                     ),
//                                                     Image.asset(
//                                                       AppImages.toggle,
//                                                       height: 5.h,
//                                                       width: 5.w,
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                               Text(
//                                                 "\$500",
//                                                 style: Theme.of(context)
//                                                     .textTheme
//                                                     .bodyLarge!
//                                                     .copyWith(
//                                                       color: AppColors.black,
//                                                       fontSize: 12.sp,
//                                                       fontWeight:
//                                                           FontWeight.w800,
//                                                     ),
//                                               ),
//                                               SizedBox(height: 1.5.h),
//                                               Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceBetween,
//                                                 children: [
//                                                   Text(
//                                                     "Qty: 1",
//                                                     style: Theme.of(context)
//                                                         .textTheme
//                                                         .bodyMedium!
//                                                         .copyWith(
//                                                           color: Color.fromRGBO(
//                                                               159, 159, 159, 1),
//                                                           fontWeight:
//                                                               FontWeight.w600,
//                                                           fontSize: 10.sp,
//                                                         ),
//                                                   ),
//                                                   GestureDetector(
//                                                     child: Row(
//                                                       children: [
//                                                         Text(
//                                                           "View Details  ",
//                                                           style:
//                                                               Theme.of(context)
//                                                                   .textTheme
//                                                                   .bodyLarge!
//                                                                   .copyWith(
//                                                                     color: AppColors
//                                                                         .primary,
//                                                                     fontSize:
//                                                                         10.sp,
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .w600,
//                                                                     decoration:
//                                                                         TextDecoration
//                                                                             .underline,
//                                                                     decorationColor:
//                                                                         AppColors
//                                                                             .primary,
//                                                                   ),
//                                                         ),
//                                                         Icon(Icons
//                                                             .keyboard_arrow_down_outlined)
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     // SizedBox(height: 1.3.h),
//                                     // Padding(
//                                     //     padding: const EdgeInsets.symmetric(
//                                     //         horizontal: 0.0, vertical: 8),
//                                     //     child: Container(
//                                     //       height: 7.h,
//                                     //       width: double.infinity,
//                                     //       decoration: BoxDecoration(
//                                     //         color: Color.fromRGBO(255, 255, 255, 1),
//                                     //         borderRadius: BorderRadius.circular(16),
//                                     //         border: Border.all(
//                                     //             width: 1,
//                                     //             color: Color.fromRGBO(235, 223, 224, 1)),
//                                     //       ),
//                                     //       child: Column(
//                                     //         mainAxisAlignment: MainAxisAlignment.center,
//                                     //         crossAxisAlignment: CrossAxisAlignment.center,
//                                     //         children: [
//                                     //           Padding(
//                                     //             padding: const EdgeInsets.symmetric(
//                                     //                 horizontal: 15.0),
//                                     //             child: Row(
//                                     //               mainAxisAlignment:
//                                     //               MainAxisAlignment.spaceBetween,
//                                     //               children: [
//                                     //                 Text('Documents'),
//                                     //                 Image.asset(
//                                     //                   AppImages.Vector,
//                                     //                   height: 1.2.h,
//                                     //                 )
//                                     //               ],
//                                     //             ),
//                                     //           )
//                                     //         ],
//                                     //       ),
//                                     //     )),
//                                     // Padding(
//                                     //     padding: const EdgeInsets.symmetric(
//                                     //         horizontal: 0.0, vertical: 8),
//                                     //     child: Container(
//                                     //       height: 7.h,
//                                     //       width: double.infinity,
//                                     //       decoration: BoxDecoration(
//                                     //         color: Color.fromRGBO(255, 255, 255, 1),
//                                     //         borderRadius: BorderRadius.circular(16),
//                                     //         border: Border.all(
//                                     //             width: 1,
//                                     //             color: Color.fromRGBO(235, 223, 224, 1)),
//                                     //       ),
//                                     //       child: Column(
//                                     //         mainAxisAlignment: MainAxisAlignment.center,
//                                     //         crossAxisAlignment: CrossAxisAlignment.center,
//                                     //         children: [
//                                     //           Padding(
//                                     //             padding: const EdgeInsets.symmetric(
//                                     //                 horizontal: 15.0),
//                                     //             child: Row(
//                                     //               mainAxisAlignment:
//                                     //               MainAxisAlignment.spaceBetween,
//                                     //               children: [
//                                     //                 Text('Reports'),
//                                     //                 Image.asset(
//                                     //                   AppImages.Vector,
//                                     //                   height: 1.2.h,
//                                     //                 )
//                                     //               ],
//                                     //             ),
//                                     //           )
//                                     //         ],
//                                     //       ),
//                                     //     )),
//                                   ],
//                                 );
//                               } else {
//                                 // Fallback in case index is not 0 or 1
//                                 return SizedBox
//                                     .shrink(); // Return an empty widget
//                               }
//                             },
//                           ),
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                           child: Container(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                               color: Color.fromRGBO(255, 255, 255, 1),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Color.fromRGBO(28, 28, 28, 0.1),
//                                   offset: Offset(0, 2),
//                                   blurRadius: 20,
//                                 ),
//                               ],
//                             ),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 SizedBox(
//                                   height: 20,
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 18.0),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     children: [
//                                       Container(
//                                         decoration: BoxDecoration(
//                                           color:
//                                               Color.fromRGBO(108, 204, 52, 1),
//                                           borderRadius:
//                                               BorderRadius.circular(8),
//                                         ),
//                                         child: Padding(
//                                           padding: const EdgeInsets.symmetric(
//                                               horizontal: 8.0, vertical: 4.0),
//                                           child: Row(children: [
//                                             Image.asset(
//                                               AppImages.truck,
//                                               height: 1.2.h,
//                                             ),
//                                             Text(
//                                               ' Fulfilled',
//                                               style: GoogleFonts.poppins(
//                                                 textStyle: TextStyle(
//                                                   fontSize: 8.sp,
//                                                   fontWeight: FontWeight.w500,
//                                                   color: Color.fromRGBO(
//                                                       255, 255, 255, 1),
//                                                 ),
//                                               ),
//                                             ),
//                                           ]),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                                 SizedBox(height: 2.h),
//                                 Padding(
//                                   padding: const EdgeInsets.only(
//                                       left: 18.0, right: 10),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     children: [
//                                       Expanded(
//                                         child: Text(
//                                           'February 14, 2024 at 6:30 am - 4517 Washington',
//                                           style: GoogleFonts.poppins(
//                                             textStyle: TextStyle(
//                                               fontWeight: FontWeight.w500,
//                                               fontSize: 9.sp,
//                                               color: Color.fromRGBO(
//                                                   159, 159, 159, 1),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.all(18.0),
//                                   child: Container(
//                                     height: 10.h,
//                                     width: double.infinity,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(16),
//                                       color: Color.fromRGBO(252, 242, 242, 1),
//                                     ),
//                                     child: Padding(
//                                       padding: const EdgeInsets.symmetric(
//                                           horizontal: 16.0),
//                                       child: Column(
//                                         mainAxisAlignment: MainAxisAlignment
//                                             .center, // Center content vertically in the Column
//                                         crossAxisAlignment: CrossAxisAlignment
//                                             .center, // Center content horizontally in the Column (for alignment within the Column)
//                                         children: [
//                                           Row(
//                                             mainAxisAlignment: MainAxisAlignment
//                                                 .start, // Align content at the start of the Row
//                                             children: [
//                                               Text(
//                                                 'Tracking Number',
//                                                 style: GoogleFonts.poppins(
//                                                     fontWeight: FontWeight.w500,
//                                                     fontSize: 10.sp,
//                                                     color: Color.fromRGBO(
//                                                         84, 84, 84, 1)),
//                                               ),
//                                             ],
//                                           ),
//                                           SizedBox(
//                                             height: 1.h,
//                                           ),
//                                           Row(
//                                             mainAxisAlignment: MainAxisAlignment
//                                                 .start, // Align content at the start of the Row
//                                             children: [
//                                               Text(
//                                                 '123456789ABC',
//                                                 style: GoogleFonts.poppins(
//                                                     textStyle: TextStyle(
//                                                         fontSize: 13.sp,
//                                                         fontWeight:
//                                                             FontWeight.w600,
//                                                         color: Color.fromRGBO(
//                                                             217, 50, 67, 1))),
//                                               ),
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 16.0, vertical: 8),
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                       color: Color.fromRGBO(255, 255, 255, 1),
//                                       borderRadius: BorderRadius.circular(16),
//                                       border: Border.all(
//                                           width: 1,
//                                           color:
//                                               Color.fromRGBO(235, 223, 224, 1)),
//                                     ),
//                                     child: Theme(
//                                       data: Theme.of(context).copyWith(
//                                           dividerColor: Colors
//                                               .transparent), // Removes the divider line
//                                       child: ExpansionTile(
//                                         tilePadding: EdgeInsets.symmetric(
//                                             horizontal: 15.0),
//                                         collapsedBackgroundColor:
//                                             Colors.transparent,
//                                         backgroundColor: Colors.transparent,
//                                         title: Text('Document'),
//                                         trailing: Icon(
//                                             Icons.keyboard_arrow_right,
//                                             size: 4.h),
//                                         children: [
//                                           Padding(
//                                             padding: const EdgeInsets.symmetric(
//                                                 horizontal: 15.0),
//                                             child: Text(
//                                               'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque nisl eros, '
//                                               'pulvinar facilisis justo mollis, auctor consequat urna. Morbi a bibendum metus. '
//                                               'Donec scelerisque sollicitudin enim eu venenatis. Duis tincidunt laoreet ex, '
//                                               'in pretium orci vestibulum eget.',
//                                               style: TextStyle(
//                                                   color: Colors.black54),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 16.0, vertical: 8),
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                       color: Color.fromRGBO(255, 255, 255, 1),
//                                       borderRadius: BorderRadius.circular(16),
//                                       border: Border.all(
//                                           width: 1,
//                                           color:
//                                               Color.fromRGBO(235, 223, 224, 1)),
//                                     ),
//                                     child: Theme(
//                                       data: Theme.of(context).copyWith(
//                                           dividerColor: Colors
//                                               .transparent), // Removes the divider line
//                                       child: ExpansionTile(
//                                         tilePadding: EdgeInsets.symmetric(
//                                             horizontal: 15.0),
//                                         collapsedBackgroundColor:
//                                             Colors.transparent,
//                                         backgroundColor: Colors.transparent,
//                                         title: Text('Reports'),
//                                         trailing: Icon(
//                                             Icons.keyboard_arrow_right,
//                                             size: 4.h),
//                                         children: [
//                                           Padding(
//                                             padding: const EdgeInsets.symmetric(
//                                                 horizontal: 15.0),
//                                             child: Text(
//                                               'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque nisl eros, '
//                                               'pulvinar facilisis justo mollis, auctor consequat urna. Morbi a bibendum metus. '
//                                               'Donec scelerisque sollicitudin enim eu venenatis. Duis tincidunt laoreet ex, '
//                                               'in pretium orci vestibulum eget.',
//                                               style: TextStyle(
//                                                   color: Colors.black54),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: [
//                                     // Your existing components
//                                     // ...

//                                     Padding(
//                                       padding: const EdgeInsets.all(16.0),
//                                       child: Column(
//                                         children: [
//                                           Row(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: [
//                                               Container(
//                                                 height: 8.h,
//                                                 width: 16.w,
//                                                 decoration: BoxDecoration(
//                                                   borderRadius:
//                                                       BorderRadius.circular(
//                                                           2.w),
//                                                 ),
//                                                 child: Image.asset(
//                                                   AppImages.Registration,
//                                                   fit: BoxFit.fill,
//                                                 ),
//                                               ),
//                                               SizedBox(width: 2.w),
//                                               Expanded(
//                                                 child: Column(
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.start,
//                                                   children: [
//                                                     SizedBox(
//                                                       width: 60.w,
//                                                       child: Row(
//                                                         mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .spaceBetween,
//                                                         children: [
//                                                           Text(
//                                                             'Registration',
//                                                             style: Theme.of(
//                                                                     context)
//                                                                 .textTheme
//                                                                 .bodyLarge!
//                                                                 .copyWith(
//                                                                   color: AppColors
//                                                                       .textColor,
//                                                                   fontSize:
//                                                                       11.sp,
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .w500,
//                                                                   height: 1,
//                                                                 ),
//                                                           ),
//                                                           Image.asset(
//                                                               AppImages.toggle,
//                                                               height: 20,
//                                                               width: 20),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                     SizedBox(height: 1.h),
//                                                     Text(
//                                                       "Qty: 1",
//                                                       style: Theme.of(context)
//                                                           .textTheme
//                                                           .bodyMedium!
//                                                           .copyWith(
//                                                             color:
//                                                                 Color.fromRGBO(
//                                                                     159,
//                                                                     159,
//                                                                     159,
//                                                                     1),
//                                                             fontWeight:
//                                                                 FontWeight.w600,
//                                                             fontSize: 9.sp,
//                                                           ),
//                                                     ),
//                                                     SizedBox(height: 1.5.h),
//                                                     Row(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .spaceBetween,
//                                                       children: [
//                                                         Text(
//                                                           "\$500  ",
//                                                           style:
//                                                               Theme.of(context)
//                                                                   .textTheme
//                                                                   .bodyLarge!
//                                                                   .copyWith(
//                                                                     color: AppColors
//                                                                         .black,
//                                                                     fontSize:
//                                                                         11.sp,
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .w800,
//                                                                   ),
//                                                         ),
//                                                         GestureDetector(
//                                                           onTap: _toggleExpand,
//                                                           child: Row(
//                                                             children: [
//                                                               Text(
//                                                                 _isExpanded
//                                                                     ? "Hide Details "
//                                                                     : "View Details ",
//                                                                 style: Theme.of(
//                                                                         context)
//                                                                     .textTheme
//                                                                     .bodyLarge!
//                                                                     .copyWith(
//                                                                       color: AppColors
//                                                                           .primary,
//                                                                       fontSize:
//                                                                           9.sp,
//                                                                       fontWeight:
//                                                                           FontWeight
//                                                                               .w600,
//                                                                       decoration:
//                                                                           TextDecoration
//                                                                               .underline,
//                                                                       decorationColor:
//                                                                           AppColors
//                                                                               .primary,
//                                                                     ),
//                                                               ),
//                                                               Icon(Icons
//                                                                   .keyboard_arrow_down_outlined)
//                                                             ],
//                                                           ),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                           if (_isExpanded) ...[
//                                             SizedBox(
//                                               height: 1.h,
//                                             ),
//                                             Container(
//                                               margin: EdgeInsets.only(top: 1.h),
//                                               decoration: BoxDecoration(
//                                                 border: Border(
//                                                   bottom: BorderSide(
//                                                       color: Color.fromRGBO(
//                                                           235, 223, 224, 1),
//                                                       width:
//                                                           1.0), // Baby pink color
//                                                 ),
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               height: 1.h,
//                                             ),
//                                             Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .spaceBetween,
//                                               children: [
//                                                 Row(
//                                                   children: [
//                                                     Text.rich(
//                                                       TextSpan(
//                                                         text:
//                                                             '2019 BMW x 3 ', // The initial text
//                                                         style: Theme.of(context)
//                                                             .textTheme
//                                                             .bodyLarge!
//                                                             .copyWith(
//                                                               fontFamily:
//                                                                   'Poppins',
//                                                               color:
//                                                                   Colors.black,
//                                                               fontSize: 11.sp,
//                                                             ),
//                                                         children: [
//                                                           TextSpan(
//                                                             text:
//                                                                 'ACJ 1827', // The text you want to style differently
//                                                             style: TextStyle(
//                                                               color: Colors
//                                                                   .grey, // Change this color as needed
//                                                               fontWeight: FontWeight
//                                                                   .bold, // Optional: make it bold
//                                                             ),
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                     Text(
//                                                       '  Completed',
//                                                       style: GoogleFonts.poppins(
//                                                           textStyle: TextStyle(
//                                                               color:
//                                                                   Colors.green,
//                                                               fontSize: 9.sp,
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .w600)),
//                                                     )
//                                                   ],
//                                                 ),
//                                                 Image.asset(
//                                                   AppImages.arrow_circle_right,
//                                                   height: 5.h,
//                                                   width: 5.w,
//                                                 )
//                                               ],
//                                             ),
//                                             Container(
//                                               margin: EdgeInsets.only(top: 1.h),
//                                               decoration: BoxDecoration(
//                                                 border: Border(
//                                                   bottom: BorderSide(
//                                                       color: Color.fromRGBO(
//                                                           235, 223, 224, 1),
//                                                       width:
//                                                           1.0), // Baby pink color
//                                                 ),
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               height: 1.h,
//                                             ),
//                                             Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .spaceBetween,
//                                               children: [
//                                                 Text.rich(
//                                                   TextSpan(
//                                                     text:
//                                                         ' 2022 Toyota ', // The initial text
//                                                     style: Theme.of(context)
//                                                         .textTheme
//                                                         .bodyLarge!
//                                                         .copyWith(
//                                                           fontFamily: 'Poppins',
//                                                           color: Colors.black,
//                                                           fontSize: 11.sp,
//                                                         ),
//                                                     children: [
//                                                       TextSpan(
//                                                         text: 'ACJ 1840 ',
//                                                         style: TextStyle(
//                                                           color: Colors
//                                                               .grey, // Change this color as needed
//                                                           fontWeight: FontWeight
//                                                               .bold, // Optional: make it bold
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                                 Image.asset(
//                                                   AppImages.arrow_circle_right,
//                                                   height: 5.h,
//                                                   width: 5.w,
//                                                 )
//                                               ],
//                                             ),
//                                           ],
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 30,
//                         ),

//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                           child: Container(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                               color: Color.fromRGBO(255, 255, 255, 1),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Color.fromRGBO(28, 28, 28, 0.1),
//                                   offset: Offset(0, 2),
//                                   blurRadius: 20,
//                                 ),
//                               ],
//                             ),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 SizedBox(
//                                   height: 20,
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 14.0),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     children: [
//                                       Container(
//                                         decoration: BoxDecoration(
//                                           color: Color.fromRGBO(240, 78, 94, 1),
//                                           borderRadius:
//                                               BorderRadius.circular(8),
//                                         ),
//                                         child: Padding(
//                                           padding: const EdgeInsets.symmetric(
//                                               horizontal: 8, vertical: 4),
//                                           child: Row(children: [
//                                             Image.asset(
//                                               AppImages.box,
//                                               height: 1.5.h,
//                                             ),
//                                             Text(
//                                               '  Payment pending',
//                                               style: GoogleFonts.poppins(
//                                                 textStyle: TextStyle(
//                                                   fontSize: 8.sp,
//                                                   fontWeight: FontWeight.w500,
//                                                   color: Color.fromRGBO(
//                                                       255, 255, 255, 1),
//                                                 ),
//                                               ),
//                                             ),
//                                           ]),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                                 SizedBox(height: 2.h),
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 15.0),
//                                   child: Container(
//                                     height: 8.h,
//                                     decoration: BoxDecoration(
//                                       border: Border(
//                                         bottom: BorderSide(
//                                           color: Color.fromRGBO(
//                                             235,
//                                             223,
//                                             224,
//                                             1,
//                                           ), // Change this to your desired color
//                                           width: 0.5
//                                               .w, // Adjust the thickness of the bottom line
//                                         ),
//                                       ),
//                                     ),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       children: [
//                                         Text(
//                                           'Subtotal',
//                                           style: GoogleFonts.poppins(
//                                               textStyle: TextStyle(
//                                             fontSize: 11.sp,
//                                             color: Color.fromRGBO(
//                                                 159, 159, 159, 1),
//                                             fontWeight: FontWeight.w500,
//                                           )),
//                                         ),
//                                         Text('\$2,259.00',
//                                             style: GoogleFonts.poppins(
//                                                 textStyle: TextStyle(
//                                               fontSize: 11.sp,
//                                               color: AppColors.black,
//                                               fontWeight: FontWeight.w500,
//                                             ))),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 15.0),
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                       border: Border(
//                                         bottom: BorderSide(
//                                           color: Color.fromRGBO(
//                                             235,
//                                             223,
//                                             224,
//                                             1,
//                                           ), // Change this to your desired color
//                                           width: 0.5
//                                               .w, // Adjust the thickness of the bottom line
//                                         ),
//                                       ),
//                                     ),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       children: [
//                                         Column(
//                                           children: [
//                                             SizedBox(
//                                               height: 1.h,
//                                             ),
//                                             Container(
//                                               child: Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment.start,
//                                                 children: [
//                                                   Text(
//                                                     'Taxes        ',
//                                                     style: GoogleFonts.poppins(
//                                                         textStyle: TextStyle(
//                                                       fontSize: 11.sp,
//                                                       color: Color.fromRGBO(
//                                                           31, 31, 31, 1),
//                                                       fontWeight:
//                                                           FontWeight.w500,
//                                                     )),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               height: 1.h,
//                                             ),
//                                             Text(
//                                               'VAT (16%)',
//                                               style: GoogleFonts.poppins(
//                                                   textStyle: TextStyle(
//                                                 fontSize: 11.sp,
//                                                 color: Color.fromRGBO(
//                                                     159, 159, 159, 1),
//                                                 fontWeight: FontWeight.w500,
//                                               )),
//                                             ),
//                                             SizedBox(
//                                               height: 2.h,
//                                             )
//                                           ],
//                                         ),
//                                         Text('\$0.00',
//                                             style: GoogleFonts.poppins(
//                                                 textStyle: TextStyle(
//                                               fontSize: 11.sp,
//                                               color:
//                                                   Color.fromRGBO(31, 31, 31, 1),
//                                               fontWeight: FontWeight.w500,
//                                             ))),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 15.0),
//                                   child: Container(
//                                     height: 8.h,
//                                     decoration: BoxDecoration(
//                                       border: Border(
//                                         bottom: BorderSide(
//                                           color: Color.fromRGBO(
//                                             235,
//                                             223,
//                                             224,
//                                             1,
//                                           ), // Change this to your desired color
//                                           width: 0.5
//                                               .w, // Adjust the thickness of the bottom line
//                                         ),
//                                       ),
//                                     ),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       children: [
//                                         Text(
//                                           'Total',
//                                           style: GoogleFonts.poppins(
//                                               textStyle: TextStyle(
//                                             fontSize: 11.sp,
//                                             color:
//                                                 Color.fromRGBO(31, 31, 31, 1),
//                                             fontWeight: FontWeight.w500,
//                                           )),
//                                         ),
//                                         Text('\$2,259.00',
//                                             style: GoogleFonts.poppins(
//                                                 textStyle: TextStyle(
//                                               fontSize: 13.sp,
//                                               color: AppColors.black,
//                                               fontWeight: FontWeight.w700,
//                                             ))),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.all(16.0),
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Text(
//                                         'Paid',
//                                         style: GoogleFonts.poppins(
//                                             textStyle: TextStyle(
//                                           fontSize: 11.sp,
//                                           color:
//                                               Color.fromRGBO(159, 159, 159, 1),
//                                           fontWeight: FontWeight.w500,
//                                         )),
//                                       ),
//                                       Text(
//                                         '\$0.00',
//                                         style: GoogleFonts.poppins(
//                                             textStyle: TextStyle(
//                                           fontSize: 11.sp,
//                                           color: AppColors.black,
//                                           fontWeight: FontWeight.w500,
//                                         )),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 16.0, vertical: 10),
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.start,
//                                         children: [
//                                           Text(
//                                             'Due Date',
//                                             style: GoogleFonts.poppins(
//                                               fontSize: 11.sp,
//                                               fontWeight: FontWeight.w500,
//                                               color:
//                                                   Color.fromRGBO(31, 31, 31, 1),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       SizedBox(
//                                         height: 10,
//                                       ),
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.start,
//                                         children: [
//                                           Text(
//                                             'Payment due on February 14, 2024',
//                                             style: GoogleFonts.poppins(
//                                                 textStyle: TextStyle(
//                                                     fontSize: 11.sp,
//                                                     fontWeight: FontWeight.w500,
//                                                     color: Color.fromRGBO(
//                                                         217, 50, 67, 1))),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 14,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(16.0),
//                           child: GestureDetector(
//                             onTap: () {
//                               Get.to(
//                                   ChosePayment()); // Replace `NewScreen` with the actual screen you want to navigate to.
//                             },
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 color: Color.fromRGBO(217, 50, 67, 1),
//                                 borderRadius: BorderRadius.circular(60),
//                               ),
//                               height: 8.h,
//                               width: double.infinity,
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text(
//                                     'Choose Payment Method',
//                                     style: GoogleFonts.poppins(
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 15.sp,
//                                       color: Color.fromRGBO(255, 255, 255, 1),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                         // Padding(
//                         //   padding:
//                         //   const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
//                         //   child: Row(
//                         //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         //     children: [
//                         //       Text(
//                         //         'Attachments',
//                         //         style: GoogleFonts.poppins(
//                         //             fontSize: 15.sp,
//                         //             fontWeight: FontWeight.w600,
//                         //             color: Color.fromRGBO(31, 31, 31, 1)),
//                         //       ),
//                         //       Image.asset(
//                         //         AppImages.just,
//                         //         height: 5.h,
//                         //         width: 5.w,
//                         //       )
//                         //     ],
//                         //   ),
//                         // ),
//                         //
//                         // // Padding(
//                         // //   padding:
//                         // //   const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
//                         // //   child: Container(
//                         // //     padding: EdgeInsets.all(8.0), // Adjust padding as needed
//                         // //     decoration: BoxDecoration(
//                         // //       color: Colors.white, // Set a background color if needed
//                         // //       borderRadius: BorderRadius.circular(
//                         // //           20.0), // Adjust the border radius as needed
//                         // //       boxShadow: [
//                         // //         BoxShadow(
//                         // //           color: Color.fromRGBO(28, 28, 28, 0.1), // Shadow color
//                         // //           offset: Offset(0, 2), // Offset of the shadow
//                         // //           blurRadius: 20, // Blur radius of the shadow
//                         // //           spreadRadius: 0, // Spread radius of the shadow
//                         // //         ),
//                         // //       ],
//                         // //     ),
//                         // //     child: Row(
//                         // //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         // //       crossAxisAlignment: CrossAxisAlignment.center,
//                         // //       children: [
//                         // //         // Circular container with image
//                         // //         Container(
//                         // //           height: 6.h,
//                         // //           width: 10.w,
//                         // //           decoration: BoxDecoration(
//                         // //             color: Color.fromRGBO(252, 242, 242, 1),
//                         // //             borderRadius: BorderRadius.circular(12),
//                         // //           ),
//                         // //           child: Padding(
//                         // //             padding: const EdgeInsets.all(8.0),
//                         // //             child: Image.asset(
//                         // //               AppImages.pdf,
//                         // //             ),
//                         // //           ),
//                         // //         ),
//                         // //         // Expanded widget to push the text and the second image to the edges
//                         // //         Expanded(
//                         // //           child: Padding(
//                         // //             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                         // //             child: Text(
//                         // //               ' Insurance Certificate',
//                         // //               style: GoogleFonts.poppins(
//                         // //                 textStyle: TextStyle(
//                         // //                   fontSize: 13.sp,
//                         // //                   fontWeight: FontWeight.w500,
//                         // //                   color: Color.fromRGBO(31, 31, 31, 1),
//                         // //                 ),
//                         // //               ),
//                         // //             ),
//                         // //           ),
//                         // //         ),
//                         // //         // Circular container with image
//                         // //         ClipOval(
//                         // //           child: Container(
//                         // //             width:
//                         // //             30, // Adjust the width of the circular container
//                         // //             height:
//                         // //             30, // Adjust the height of the circular container
//                         // //             color: Color.fromRGBO(217, 50, 67,
//                         // //                 1), // Background color for the circular container
//                         // //             child: Center(
//                         // //               child: Image.asset(
//                         // //                 AppImages.cloud, // Replace with your image path
//                         // //                 width: 16.8, // Adjust width as needed
//                         // //                 height: 14.0, // Adjust height as needed
//                         // //               ),
//                         // //             ),
//                         // //           ),
//                         // //         ),
//                         // //       ],
//                         // //     ),
//                         // //   ),
//                         // // ),
//                         // SizedBox(
//                         //   height: 1.h,
//                         // ),
//                         // Padding(
//                         //   padding:
//                         //   const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
//                         //   child: Row(
//                         //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         //     children: [
//                         //       Text(
//                         //         'Reports',
//                         //         style: GoogleFonts.poppins(
//                         //             fontSize: 15.sp,
//                         //             fontWeight: FontWeight.w600,
//                         //             color: Color.fromRGBO(31, 31, 31, 1)),
//                         //       ),
//                         //       Image.asset(
//                         //         AppImages.just,
//                         //         height: 5.h,
//                         //         width: 5.w,
//                         //       )
//                         //     ],
//                         //   ),
//                         // ),
//                         // // Padding(
//                         // //   padding:
//                         // //   const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
//                         // //   child: Container(
//                         // //     padding: EdgeInsets.all(8.0), // Adjust padding as needed
//                         // //     decoration: BoxDecoration(
//                         // //       color: Colors.white, // Set a background color if needed
//                         // //       borderRadius: BorderRadius.circular(
//                         // //           20.0), // Adjust the border radius as needed
//                         // //       boxShadow: [
//                         // //         BoxShadow(
//                         // //           color: Color.fromRGBO(28, 28, 28, 0.1), // Shadow color
//                         // //           offset: Offset(0, 2), // Offset of the shadow
//                         // //           blurRadius: 20, // Blur radius of the shadow
//                         // //           spreadRadius: 0, // Spread radius of the shadow
//                         // //         ),
//                         // //       ],
//                         // //     ),
//                         // //     child: Row(
//                         // //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         // //       crossAxisAlignment: CrossAxisAlignment.center,
//                         // //       children: [
//                         // //         // Circular container with image
//                         // //         Container(
//                         // //           height: 6.h,
//                         // //           width: 10.w,
//                         // //           decoration: BoxDecoration(
//                         // //             color: Color.fromRGBO(252, 242, 242, 1),
//                         // //             borderRadius: BorderRadius.circular(2.w),
//                         // //           ),
//                         // //           child: Padding(
//                         // //             padding: const EdgeInsets.all(8.0),
//                         // //             child: Image.asset(
//                         // //               AppImages.document,
//                         // //               fit: BoxFit.cover, // Adjust as needed
//                         // //             ),
//                         // //           ),
//                         // //         ),
//                         // //         // Expanded widget to push the text and the second image to the edges
//                         // //         Expanded(
//                         // //           child: Padding(
//                         // //             padding: const EdgeInsets.symmetric(horizontal: 8),
//                         // //             child: Column(
//                         // //               children: [
//                         // //                 Text(
//                         // //                   'Inspection Report ABC 1234',
//                         // //                   style: GoogleFonts.poppins(
//                         // //                     textStyle: TextStyle(
//                         // //                       fontSize: 13.sp,
//                         // //                       fontWeight: FontWeight.w500,
//                         // //                       color: Color.fromRGBO(31, 31, 31, 1),
//                         // //                     ),
//                         // //                   ),
//                         // //                 ),
//                         // //                 Row(
//                         // //                   mainAxisAlignment: MainAxisAlignment.start,
//                         // //                   children: [
//                         // //                     Padding(
//                         // //                       padding: const EdgeInsets.symmetric(
//                         // //                           horizontal: 8.0),
//                         // //                       child: Text(
//                         // //                         'Created Date: 20/3/2024',
//                         // //                         style: GoogleFonts.poppins(
//                         // //                           fontWeight: FontWeight.w400,
//                         // //                           fontSize: 10.sp,
//                         // //                           color: Color.fromRGBO(84, 84, 84, 1),
//                         // //                         ),
//                         // //                       ),
//                         // //                     ),
//                         // //                   ],
//                         // //                 ),
//                         // //               ],
//                         // //             ),
//                         // //           ),
//                         // //         ),
//                         // //         // Circular container with image
//                         // //         ClipOval(
//                         // //           child: Container(
//                         // //             width:
//                         // //             30.0, // Adjust the width of the circular container
//                         // //             height:
//                         // //             30.0, // Adjust the height of the circular container
//                         // //             color: Color.fromRGBO(217, 50, 67,
//                         // //                 1), // Background color for the circular container
//                         // //             child: Center(
//                         // //               child: Image.asset(
//                         // //                 AppImages
//                         // //                     .arrow_right, // Replace with your image path
//                         // //                 width: 16.8, // Adjust width as needed
//                         // //                 height: 14.0, // Adjust height as needed
//                         // //               ),
//                         // //             ),
//                         // //           ),
//                         // //         ),
//                         // //       ],
//                         // //     ),
//                         //   ),
//                         // ),
//                         SizedBox(
//                           height: 1.h,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Obx(
//                   () => controller.popUp.value == true
//                       ? OrderPopUpMenu()
//                       : SizedBox.shrink(),
//                 ),
//               ],
//             )),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanduba/controllers/order_detail_controller.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/Profile/Chose_payment/Chose_payment.dart';
import 'package:provider/provider.dart';

import '../../providers/estimate_provider.dart';
import '../create_request/compare_estimates/request_estimate_item_detail/estimate_item_details.dart';
import 'DetailCustomContainer.dart';
import 'component/order_pop_up_menu.dart';

class OrderDetailedScreen extends StatefulWidget {
  const OrderDetailedScreen({super.key});

  @override
  State<OrderDetailedScreen> createState() => _OrderDetailedScreenState();
}

class _OrderDetailedScreenState extends State<OrderDetailedScreen> {
  final OrderDetailController controller = Get.find<OrderDetailController>();

  bool _isExpanded = false;
  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 30),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: myAppBar(
                  title: "Order Details",
                  icon: AppSvgs.more_vert,
                  iconColor: AppColors.border3,
                  onTogglePressed: () {
                    print("tapped");
                    controller.showPopUp();
                  },
                )),
            Expanded(
                child: Stack(
              children: [
                SingleChildScrollView(
                  child: GestureDetector(
                    onTap: () {
                      if (controller.popUp.value == true) {
                        controller.popUp.value = false;
                      }
                    },
                    child: Column(
                      children: [
                        SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Color.fromRGBO(255, 255, 255, 1),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(28, 28, 28, 0.1),
                                  offset: Offset(0, 2),
                                  blurRadius: 20,
                                ),
                              ],
                            ),
                            height: 11.h,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 14.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '#1003',
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 13.sp,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  55, 125, 215, 1),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0,
                                                      vertical: 4.0),
                                              child: Text(
                                                'Unfulfilled',
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    fontSize: 8.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color.fromRGBO(
                                                        255, 255, 255, 1),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                              width:
                                                  10), // Space between the tags
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: Color.fromRGBO(
                                                  240, 78, 94, 1),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0,
                                                      vertical: 4.0),
                                              child: Text(
                                                'Payment pending',
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    fontSize: 8.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color.fromRGBO(
                                                        255, 255, 255, 1),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      '    Toyota Zombia',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 10.sp,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 1.h),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'February 13, 2024 at 7:25 pm from Estimates',
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 9.sp,
                                            color: Color.fromRGBO(
                                                159, 159, 159, 1),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                            height:
                                10), // Space between the container and the next element
                        DetailCustomContainer(
                          borderRadius: 6.w,
                          vMargin: 1.h,
                          hMargin: 5.w,
                          hpadding: 3.w,
                          vpadding: 2.h,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 2, // Set itemCount to 2
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              if (index == 0) {
                                // First Container
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.to(() => EstimateServiceItemDetails(
                                              estimateDetail: 'Item detail',
                                            )); // Replace with your target page
                                      },
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 8.h,
                                            width: 17.w,
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  239, 239, 239, 1),
                                              borderRadius:
                                                  BorderRadius.circular(2.w),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: SizedBox(
                                                child: Image.asset(
                                                  AppImages.car_benz,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                              width: 2
                                                  .w), // Space between image and texts
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: 65.w,
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          'Tune Up - Scheduled Maintenance',
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyLarge!
                                                                  .copyWith(
                                                                    color: AppColors
                                                                        .textColor,
                                                                    fontSize:
                                                                        11.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    height: 1.5,
                                                                  ),
                                                        ),
                                                      ),
                                                      Image.asset(
                                                        AppImages.toggle,
                                                        height: 20,
                                                        width: 20,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: 1.h),
                                                InkWell(
                                                  onTap: () {},
                                                  child: Text(
                                                    "\$958.500",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyLarge!
                                                        .copyWith(
                                                          color:
                                                              AppColors.black,
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                        ),
                                                  ),
                                                ),
                                                SizedBox(height: 1.h),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Qty: 1",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium!
                                                          .copyWith(
                                                            color:
                                                                Color.fromRGBO(
                                                                    159,
                                                                    159,
                                                                    159,
                                                                    1),
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 10.sp,
                                                          ),
                                                    ),
                                                    GestureDetector(
                                                      child: Row(
                                                        children: [
                                                          Icon(Icons
                                                              .keyboard_arrow_down_outlined)
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 1.3.h),
                                  ],
                                );
                              } else if (index == 1) {
                                // Second Container
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: Container(
                                            height: 8.h,
                                            width: 16.w,
                                            decoration: BoxDecoration(
                                              // Different color or other changes
                                              borderRadius:
                                                  BorderRadius.circular(2.w),
                                            ),
                                            child: Image.asset(
                                              AppImages.Registration,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                            width: 2
                                                .w), // Space between image and texts
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 65.w,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Registration',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyLarge!
                                                          .copyWith(
                                                            color: AppColors
                                                                .textColor,
                                                            fontSize: 11.sp,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            height: 1,
                                                          ),
                                                    ),
                                                    Image.asset(
                                                      AppImages.toggle,
                                                      height: 5.h,
                                                      width: 5.w,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                "\$500",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge!
                                                    .copyWith(
                                                      color: AppColors.black,
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                    ),
                                              ),
                                              SizedBox(height: 1.5.h),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Qty: 1",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium!
                                                        .copyWith(
                                                          color: Color.fromRGBO(
                                                              159, 159, 159, 1),
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 10.sp,
                                                        ),
                                                  ),
                                                  GestureDetector(
                                                    child: Row(
                                                      children: [
                                                        Icon(Icons
                                                            .keyboard_arrow_down_outlined)
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    // SizedBox(height: 1.3.h),
                                    // Padding(
                                    //     padding: const EdgeInsets.symmetric(
                                    //         horizontal: 0.0, vertical: 8),
                                    //     child: Container(
                                    //       height: 7.h,
                                    //       width: double.infinity,
                                    //       decoration: BoxDecoration(
                                    //         color: Color.fromRGBO(255, 255, 255, 1),
                                    //         borderRadius: BorderRadius.circular(16),
                                    //         border: Border.all(
                                    //             width: 1,
                                    //             color: Color.fromRGBO(235, 223, 224, 1)),
                                    //       ),
                                    //       child: Column(
                                    //         mainAxisAlignment: MainAxisAlignment.center,
                                    //         crossAxisAlignment: CrossAxisAlignment.center,
                                    //         children: [
                                    //           Padding(
                                    //             padding: const EdgeInsets.symmetric(
                                    //                 horizontal: 15.0),
                                    //             child: Row(
                                    //               mainAxisAlignment:
                                    //               MainAxisAlignment.spaceBetween,
                                    //               children: [
                                    //                 Text('Documents'),
                                    //                 Image.asset(
                                    //                   AppImages.Vector,
                                    //                   height: 1.2.h,
                                    //                 )
                                    //               ],
                                    //             ),
                                    //           )
                                    //         ],
                                    //       ),
                                    //     )),
                                    // Padding(
                                    //     padding: const EdgeInsets.symmetric(
                                    //         horizontal: 0.0, vertical: 8),
                                    //     child: Container(
                                    //       height: 7.h,
                                    //       width: double.infinity,
                                    //       decoration: BoxDecoration(
                                    //         color: Color.fromRGBO(255, 255, 255, 1),
                                    //         borderRadius: BorderRadius.circular(16),
                                    //         border: Border.all(
                                    //             width: 1,
                                    //             color: Color.fromRGBO(235, 223, 224, 1)),
                                    //       ),
                                    //       child: Column(
                                    //         mainAxisAlignment: MainAxisAlignment.center,
                                    //         crossAxisAlignment: CrossAxisAlignment.center,
                                    //         children: [
                                    //           Padding(
                                    //             padding: const EdgeInsets.symmetric(
                                    //                 horizontal: 15.0),
                                    //             child: Row(
                                    //               mainAxisAlignment:
                                    //               MainAxisAlignment.spaceBetween,
                                    //               children: [
                                    //                 Text('Reports'),
                                    //                 Image.asset(
                                    //                   AppImages.Vector,
                                    //                   height: 1.2.h,
                                    //                 )
                                    //               ],
                                    //             ),
                                    //           )
                                    //         ],
                                    //       ),
                                    //     )),
                                  ],
                                );
                              } else {
                                // Fallback in case index is not 0 or 1
                                return SizedBox
                                    .shrink(); // Return an empty widget
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromRGBO(255, 255, 255, 1),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(28, 28, 28, 0.1),
                                  offset: Offset(0, 2),
                                  blurRadius: 20,
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(108, 204, 52, 1),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0, vertical: 4.0),
                                          child: Row(children: [
                                            Image.asset(
                                              AppImages.truck,
                                              height: 1.2.h,
                                            ),
                                            Text(
                                              ' Fulfilled',
                                              style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                  fontSize: 8.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromRGBO(
                                                      255, 255, 255, 1),
                                                ),
                                              ),
                                            ),
                                          ]),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 2.h),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 18.0, right: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'February 14, 2024 at 6:30 am - 4517 Washington',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 9.sp,
                                              color: Color.fromRGBO(
                                                  159, 159, 159, 1),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Container(
                                    height: 10.h,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: Color.fromRGBO(252, 242, 242, 1),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .center, // Center content vertically in the Column
                                        crossAxisAlignment: CrossAxisAlignment
                                            .center, // Center content horizontally in the Column (for alignment within the Column)
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .start, // Align content at the start of the Row
                                            children: [
                                              Text(
                                                'Tracking Number',
                                                style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 10.sp,
                                                    color: Color.fromRGBO(
                                                        84, 84, 84, 1)),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .start, // Align content at the start of the Row
                                            children: [
                                              Text(
                                                '123456789ABC',
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        fontSize: 13.sp,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Color.fromRGBO(
                                                            217, 50, 67, 1))),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 8),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                          width: 1,
                                          color:
                                              Color.fromRGBO(235, 223, 224, 1)),
                                    ),
                                    child: Theme(
                                      data: Theme.of(context).copyWith(
                                          dividerColor: Colors
                                              .transparent), // Removes the divider line
                                      child: ExpansionTile(
                                        tilePadding: EdgeInsets.symmetric(
                                            horizontal: 15.0),
                                        collapsedBackgroundColor:
                                            Colors.transparent,
                                        backgroundColor: Colors.transparent,
                                        title: Text('Document'),
                                        trailing: Icon(
                                            Icons.keyboard_arrow_right,
                                            size: 4.h),
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15.0),
                                            child: Text(
                                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque nisl eros, '
                                              'pulvinar facilisis justo mollis, auctor consequat urna. Morbi a bibendum metus. '
                                              'Donec scelerisque sollicitudin enim eu venenatis. Duis tincidunt laoreet ex, '
                                              'in pretium orci vestibulum eget.',
                                              style: TextStyle(
                                                  color: Colors.black54),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 8),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                          width: 1,
                                          color:
                                              Color.fromRGBO(235, 223, 224, 1)),
                                    ),
                                    child: Theme(
                                      data: Theme.of(context).copyWith(
                                          dividerColor: Colors
                                              .transparent), // Removes the divider line
                                      child: ExpansionTile(
                                        tilePadding: EdgeInsets.symmetric(
                                            horizontal: 15.0),
                                        collapsedBackgroundColor:
                                            Colors.transparent,
                                        backgroundColor: Colors.transparent,
                                        title: Text('Reports'),
                                        trailing: Icon(
                                            Icons.keyboard_arrow_right,
                                            size: 4.h),
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15.0),
                                            child: Text(
                                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque nisl eros, '
                                              'pulvinar facilisis justo mollis, auctor consequat urna. Morbi a bibendum metus. '
                                              'Donec scelerisque sollicitudin enim eu venenatis. Duis tincidunt laoreet ex, '
                                              'in pretium orci vestibulum eget.',
                                              style: TextStyle(
                                                  color: Colors.black54),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // Your existing components
                                    // ...

                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 8.h,
                                                width: 16.w,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          2.w),
                                                ),
                                                child: Image.asset(
                                                  AppImages.Registration,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              SizedBox(width: 2.w),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      width: 60.w,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            'Registration',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyLarge!
                                                                .copyWith(
                                                                  color: AppColors
                                                                      .textColor,
                                                                  fontSize:
                                                                      11.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  height: 1,
                                                                ),
                                                          ),
                                                          Image.asset(
                                                              AppImages.toggle,
                                                              height: 20,
                                                              width: 20),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(height: 1.h),
                                                    Text(
                                                      "Qty: 1",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium!
                                                          .copyWith(
                                                            color:
                                                                Color.fromRGBO(
                                                                    159,
                                                                    159,
                                                                    159,
                                                                    1),
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 9.sp,
                                                          ),
                                                    ),
                                                    SizedBox(height: 1.5.h),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "\$500  ",
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyLarge!
                                                                  .copyWith(
                                                                    color: AppColors
                                                                        .black,
                                                                    fontSize:
                                                                        11.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w800,
                                                                  ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: _toggleExpand,
                                                          child: Row(
                                                            children: [
                                                              Icon(Icons
                                                                  .keyboard_arrow_down_outlined)
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          if (_isExpanded) ...[
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 1.h),
                                              decoration: BoxDecoration(
                                                border: Border(
                                                  bottom: BorderSide(
                                                      color: Color.fromRGBO(
                                                          235, 223, 224, 1),
                                                      width:
                                                          1.0), // Baby pink color
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text.rich(
                                                      TextSpan(
                                                        text:
                                                            '2019 BMW x 3 ', // The initial text
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyLarge!
                                                            .copyWith(
                                                              fontFamily:
                                                                  'Poppins',
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 11.sp,
                                                            ),
                                                        children: [
                                                          TextSpan(
                                                            text:
                                                                'ACJ 1827', // The text you want to style differently
                                                            style: TextStyle(
                                                              color: Colors
                                                                  .grey, // Change this color as needed
                                                              fontWeight: FontWeight
                                                                  .bold, // Optional: make it bold
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Text(
                                                      '  Completed',
                                                      style: GoogleFonts.poppins(
                                                          textStyle: TextStyle(
                                                              color:
                                                                  Colors.green,
                                                              fontSize: 9.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)),
                                                    )
                                                  ],
                                                ),
                                                Image.asset(
                                                  AppImages.arrow_circle_right,
                                                  height: 5.h,
                                                  width: 5.w,
                                                )
                                              ],
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 1.h),
                                              decoration: BoxDecoration(
                                                border: Border(
                                                  bottom: BorderSide(
                                                      color: Color.fromRGBO(
                                                          235, 223, 224, 1),
                                                      width:
                                                          1.0), // Baby pink color
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text.rich(
                                                  TextSpan(
                                                    text:
                                                        ' 2022 Toyota ', // The initial text
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyLarge!
                                                        .copyWith(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.black,
                                                          fontSize: 11.sp,
                                                        ),
                                                    children: [
                                                      TextSpan(
                                                        text: 'ACJ 1840 ',
                                                        style: TextStyle(
                                                          color: Colors
                                                              .grey, // Change this color as needed
                                                          fontWeight: FontWeight
                                                              .bold, // Optional: make it bold
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Image.asset(
                                                  AppImages.arrow_circle_right,
                                                  height: 5.h,
                                                  width: 5.w,
                                                )
                                              ],
                                            ),
                                          ],
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromRGBO(255, 255, 255, 1),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(28, 28, 28, 0.1),
                                  offset: Offset(0, 2),
                                  blurRadius: 20,
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 14.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Color.fromRGBO(240, 78, 94, 1),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 4),
                                          child: Row(children: [
                                            Image.asset(
                                              AppImages.box,
                                              height: 1.5.h,
                                            ),
                                            Text(
                                              '  Payment pending',
                                              style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                  fontSize: 8.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromRGBO(
                                                      255, 255, 255, 1),
                                                ),
                                              ),
                                            ),
                                          ]),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 2.h),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  child: Container(
                                    height: 8.h,
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Color.fromRGBO(
                                            235,
                                            223,
                                            224,
                                            1,
                                          ), // Change this to your desired color
                                          width: 0.5
                                              .w, // Adjust the thickness of the bottom line
                                        ),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Subtotal',
                                          style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                            fontSize: 11.sp,
                                            color: Color.fromRGBO(
                                                159, 159, 159, 1),
                                            fontWeight: FontWeight.w500,
                                          )),
                                        ),
                                        Text('\$2,259.00',
                                            style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                              fontSize: 11.sp,
                                              color: AppColors.black,
                                              fontWeight: FontWeight.w500,
                                            ))),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Color.fromRGBO(
                                            235,
                                            223,
                                            224,
                                            1,
                                          ), // Change this to your desired color
                                          width: 0.5
                                              .w, // Adjust the thickness of the bottom line
                                        ),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Taxes        ',
                                                    style: GoogleFonts.poppins(
                                                        textStyle: TextStyle(
                                                      fontSize: 11.sp,
                                                      color: Color.fromRGBO(
                                                          31, 31, 31, 1),
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    )),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            Text(
                                              'VAT (16%)',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                fontSize: 11.sp,
                                                color: Color.fromRGBO(
                                                    159, 159, 159, 1),
                                                fontWeight: FontWeight.w500,
                                              )),
                                            ),
                                            SizedBox(
                                              height: 2.h,
                                            )
                                          ],
                                        ),
                                        Text('\$0.00',
                                            style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                              fontSize: 11.sp,
                                              color:
                                                  Color.fromRGBO(31, 31, 31, 1),
                                              fontWeight: FontWeight.w500,
                                            ))),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  child: Container(
                                    height: 8.h,
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Color.fromRGBO(
                                            235,
                                            223,
                                            224,
                                            1,
                                          ), // Change this to your desired color
                                          width: 0.5
                                              .w, // Adjust the thickness of the bottom line
                                        ),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Total',
                                          style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                            fontSize: 11.sp,
                                            color:
                                                Color.fromRGBO(31, 31, 31, 1),
                                            fontWeight: FontWeight.w500,
                                          )),
                                        ),
                                        Text('\$2,259.00',
                                            style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                              fontSize: 13.sp,
                                              color: AppColors.black,
                                              fontWeight: FontWeight.w700,
                                            ))),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Paid',
                                        style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                          fontSize: 11.sp,
                                          color:
                                              Color.fromRGBO(159, 159, 159, 1),
                                          fontWeight: FontWeight.w500,
                                        )),
                                      ),
                                      Text(
                                        '\$0.00',
                                        style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                          fontSize: 11.sp,
                                          color: AppColors.black,
                                          fontWeight: FontWeight.w500,
                                        )),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Due Date',
                                            style: GoogleFonts.poppins(
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.w500,
                                              color:
                                                  Color.fromRGBO(31, 31, 31, 1),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Payment due on February 14, 2024',
                                            style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                    fontSize: 11.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color.fromRGBO(
                                                        217, 50, 67, 1))),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: GestureDetector(
                            onTap: () {
                              Get.to(
                                  ChosePayment()); // Replace `NewScreen` with the actual screen you want to navigate to.
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(217, 50, 67, 1),
                                borderRadius: BorderRadius.circular(60),
                              ),
                              height: 8.h,
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Choose Payment Method',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15.sp,
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // Padding(
                        //   padding:
                        //   const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       Text(
                        //         'Attachments',
                        //         style: GoogleFonts.poppins(
                        //             fontSize: 15.sp,
                        //             fontWeight: FontWeight.w600,
                        //             color: Color.fromRGBO(31, 31, 31, 1)),
                        //       ),
                        //       Image.asset(
                        //         AppImages.just,
                        //         height: 5.h,
                        //         width: 5.w,
                        //       )
                        //     ],
                        //   ),
                        // ),
                        //
                        // // Padding(
                        // //   padding:
                        // //   const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                        // //   child: Container(
                        // //     padding: EdgeInsets.all(8.0), // Adjust padding as needed
                        // //     decoration: BoxDecoration(
                        // //       color: Colors.white, // Set a background color if needed
                        // //       borderRadius: BorderRadius.circular(
                        // //           20.0), // Adjust the border radius as needed
                        // //       boxShadow: [
                        // //         BoxShadow(
                        // //           color: Color.fromRGBO(28, 28, 28, 0.1), // Shadow color
                        // //           offset: Offset(0, 2), // Offset of the shadow
                        // //           blurRadius: 20, // Blur radius of the shadow
                        // //           spreadRadius: 0, // Spread radius of the shadow
                        // //         ),
                        // //       ],
                        // //     ),
                        // //     child: Row(
                        // //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // //       crossAxisAlignment: CrossAxisAlignment.center,
                        // //       children: [
                        // //         // Circular container with image
                        // //         Container(
                        // //           height: 6.h,
                        // //           width: 10.w,
                        // //           decoration: BoxDecoration(
                        // //             color: Color.fromRGBO(252, 242, 242, 1),
                        // //             borderRadius: BorderRadius.circular(12),
                        // //           ),
                        // //           child: Padding(
                        // //             padding: const EdgeInsets.all(8.0),
                        // //             child: Image.asset(
                        // //               AppImages.pdf,
                        // //             ),
                        // //           ),
                        // //         ),
                        // //         // Expanded widget to push the text and the second image to the edges
                        // //         Expanded(
                        // //           child: Padding(
                        // //             padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        // //             child: Text(
                        // //               ' Insurance Certificate',
                        // //               style: GoogleFonts.poppins(
                        // //                 textStyle: TextStyle(
                        // //                   fontSize: 13.sp,
                        // //                   fontWeight: FontWeight.w500,
                        // //                   color: Color.fromRGBO(31, 31, 31, 1),
                        // //                 ),
                        // //               ),
                        // //             ),
                        // //           ),
                        // //         ),
                        // //         // Circular container with image
                        // //         ClipOval(
                        // //           child: Container(
                        // //             width:
                        // //             30, // Adjust the width of the circular container
                        // //             height:
                        // //             30, // Adjust the height of the circular container
                        // //             color: Color.fromRGBO(217, 50, 67,
                        // //                 1), // Background color for the circular container
                        // //             child: Center(
                        // //               child: Image.asset(
                        // //                 AppImages.cloud, // Replace with your image path
                        // //                 width: 16.8, // Adjust width as needed
                        // //                 height: 14.0, // Adjust height as needed
                        // //               ),
                        // //             ),
                        // //           ),
                        // //         ),
                        // //       ],
                        // //     ),
                        // //   ),
                        // // ),
                        // SizedBox(
                        //   height: 1.h,
                        // ),
                        // Padding(
                        //   padding:
                        //   const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       Text(
                        //         'Reports',
                        //         style: GoogleFonts.poppins(
                        //             fontSize: 15.sp,
                        //             fontWeight: FontWeight.w600,
                        //             color: Color.fromRGBO(31, 31, 31, 1)),
                        //       ),
                        //       Image.asset(
                        //         AppImages.just,
                        //         height: 5.h,
                        //         width: 5.w,
                        //       )
                        //     ],
                        //   ),
                        // ),
                        // // Padding(
                        // //   padding:
                        // //   const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                        // //   child: Container(
                        // //     padding: EdgeInsets.all(8.0), // Adjust padding as needed
                        // //     decoration: BoxDecoration(
                        // //       color: Colors.white, // Set a background color if needed
                        // //       borderRadius: BorderRadius.circular(
                        // //           20.0), // Adjust the border radius as needed
                        // //       boxShadow: [
                        // //         BoxShadow(
                        // //           color: Color.fromRGBO(28, 28, 28, 0.1), // Shadow color
                        // //           offset: Offset(0, 2), // Offset of the shadow
                        // //           blurRadius: 20, // Blur radius of the shadow
                        // //           spreadRadius: 0, // Spread radius of the shadow
                        // //         ),
                        // //       ],
                        // //     ),
                        // //     child: Row(
                        // //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // //       crossAxisAlignment: CrossAxisAlignment.center,
                        // //       children: [
                        // //         // Circular container with image
                        // //         Container(
                        // //           height: 6.h,
                        // //           width: 10.w,
                        // //           decoration: BoxDecoration(
                        // //             color: Color.fromRGBO(252, 242, 242, 1),
                        // //             borderRadius: BorderRadius.circular(2.w),
                        // //           ),
                        // //           child: Padding(
                        // //             padding: const EdgeInsets.all(8.0),
                        // //             child: Image.asset(
                        // //               AppImages.document,
                        // //               fit: BoxFit.cover, // Adjust as needed
                        // //             ),
                        // //           ),
                        // //         ),
                        // //         // Expanded widget to push the text and the second image to the edges
                        // //         Expanded(
                        // //           child: Padding(
                        // //             padding: const EdgeInsets.symmetric(horizontal: 8),
                        // //             child: Column(
                        // //               children: [
                        // //                 Text(
                        // //                   'Inspection Report ABC 1234',
                        // //                   style: GoogleFonts.poppins(
                        // //                     textStyle: TextStyle(
                        // //                       fontSize: 13.sp,
                        // //                       fontWeight: FontWeight.w500,
                        // //                       color: Color.fromRGBO(31, 31, 31, 1),
                        // //                     ),
                        // //                   ),
                        // //                 ),
                        // //                 Row(
                        // //                   mainAxisAlignment: MainAxisAlignment.start,
                        // //                   children: [
                        // //                     Padding(
                        // //                       padding: const EdgeInsets.symmetric(
                        // //                           horizontal: 8.0),
                        // //                       child: Text(
                        // //                         'Created Date: 20/3/2024',
                        // //                         style: GoogleFonts.poppins(
                        // //                           fontWeight: FontWeight.w400,
                        // //                           fontSize: 10.sp,
                        // //                           color: Color.fromRGBO(84, 84, 84, 1),
                        // //                         ),
                        // //                       ),
                        // //                     ),
                        // //                   ],
                        // //                 ),
                        // //               ],
                        // //             ),
                        // //           ),
                        // //         ),
                        // //         // Circular container with image
                        // //         ClipOval(
                        // //           child: Container(
                        // //             width:
                        // //             30.0, // Adjust the width of the circular container
                        // //             height:
                        // //             30.0, // Adjust the height of the circular container
                        // //             color: Color.fromRGBO(217, 50, 67,
                        // //                 1), // Background color for the circular container
                        // //             child: Center(
                        // //               child: Image.asset(
                        // //                 AppImages
                        // //                     .arrow_right, // Replace with your image path
                        // //                 width: 16.8, // Adjust width as needed
                        // //                 height: 14.0, // Adjust height as needed
                        // //               ),
                        // //             ),
                        // //           ),
                        // //         ),
                        // //       ],
                        // //     ),
                        //   ),
                        // ),
                        SizedBox(
                          height: 1.h,
                        ),
                      ],
                    ),
                  ),
                ),
                Obx(
                  () => controller.popUp.value == true
                      ? OrderPopUpMenu()
                      : SizedBox.shrink(),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
