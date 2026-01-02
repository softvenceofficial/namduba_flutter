// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:nanduba/export.dart';
// import 'package:nanduba/views/Order_detail/Order_detailed_screen.dart';

// class OrderDetails extends StatefulWidget {
//   const OrderDetails({super.key});

//   @override
//   State<OrderDetails> createState() => _OrderDetailsState();
// }

// class _OrderDetailsState extends State<OrderDetails> {

//   int selectedButtonIndex = 0;

//   final List<Map<String, dynamic>> orders = [
//     {
//       'image': AppImages.Car_headlights,
//       'title': '19 20 21 22 ACURA ILX Genuine',
//       'Sub': 'Headlamp Right 68088868AD',
//       'date': 'Ordered On March 11, 2024',
//       'status': 'Confirmed',
//       'statusColor': Color.fromRGBO(230, 250, 239, 1), // Green
//       'statusTextColor':
//       Color.fromRGBO(0, 199, 92, 1), // White text for green background
//     },
//     {
//       'image': AppImages.Car_headlights,
//       'title': '19 20 21 22 ACURA ILX Genuine',
//       'Sub': 'Headlamp Right 68088868AD',
//       'date': 'Ordered On March 11, 2024',
//       'status': 'In Progress',
//       'statusColor': Color.fromRGBO(253, 248, 240, 1), // Orange
//       'statusTextColor':
//       Color.fromRGBO(255, 153, 0, 1), // White text for orange background
//     },
//     {
//       'image': AppImages.Car_headlights,
//       'title': 'Motor Vehicle Registration and',
//       'Sub': '2 Others',

//       'date': 'Ordered On March 11, 2024',
//       'status': 'Delivered',
//       'statusColor': Color.fromRGBO(241, 248, 255, 1), // Red
//       'statusTextColor':
//       Color.fromRGBO(22, 126, 230, 1), // White text for red background
//     },
//     {
//       'image': AppImages.Car_headlights,
//       'title': '19 20 21 22 ACURA ILX Genuine',
//       'Sub': 'Headlamp Right 68088868AD',
//       'date': 'Ordered On March 11, 2024',
//       'status': 'Delivered',
//       'statusColor': Color.fromRGBO(241, 248, 255, 1), // Red
//       'statusTextColor':
//       Color.fromRGBO(22, 126, 230, 1), // White text for red background
//     },
//   ];

//   void showFilterBottomSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (context) {
//         return FilterBottomSheetContent();
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SafeArea(
//           child: Column(children: [
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: myAppBar(
//                 title: 'My Orders',
//                 icon: AppSvgs.filter2,
//                 isSearch: false,
//                 isToggle: true,
//                 onTogglePressed: () {
//                   showFilterBottomSheet(context);
//                 },
//               ),
//             ),
//             SizedBox(
//               height: 1.h,
//             ),
//             Padding(
//               padding:  EdgeInsets.symmetric(horizontal: 16),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   CustomButton(
//                     borderColor: AppColors.white,
//                     label: "All",
//                     labelFontSize: 10.sp,
//                     onPressed: () {
//                       setState(() {
//                         selectedButtonIndex = 0;
//                       });
//                     },
//                     height: 5.h,
//                     width: 25.w,
//                     backgroundColor: selectedButtonIndex == 0
//                         ? AppColors.primary
//                         : Colors.transparent,
//                     foregroundColor: selectedButtonIndex == 0
//                         ? AppColors.white
//                         : AppColors.grey,
//                   ),
//                   CustomButton(
//                     borderColor: AppColors.white,
//                     label: "Products",
//                     labelFontSize: 10.sp,
//                     onPressed: () {
//                       setState(() {
//                         selectedButtonIndex = 1;
//                       });
//                     },
//                     height: 5.h,
//                     width: 28.w,
//                     backgroundColor: selectedButtonIndex == 1
//                         ? AppColors.primary
//                         : Colors.transparent,
//                     foregroundColor: selectedButtonIndex == 1
//                         ? AppColors.white
//                         : AppColors.grey,
//                   ),
//                   CustomButton(
//                     borderColor: AppColors.white,
//                     label: "Services",
//                     labelFontSize: 10.sp,
//                     onPressed: () {
//                       setState(() {
//                         selectedButtonIndex = 2;
//                       });
//                     },
//                     height: 5.h,
//                     width: 25.w,
//                     backgroundColor: selectedButtonIndex == 2
//                         ? AppColors.primary
//                         : Colors.transparent,
//                     foregroundColor: selectedButtonIndex == 2
//                         ? AppColors.white
//                         : AppColors.grey,
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: orders.length,
//                 itemBuilder: (context, index) {
//                   final order = orders[index];
//                   return InkWell(
//                     onTap: (){
//                       Get.to(OrderDetailedScreen());
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
//                       child: Container(
//                         padding: const EdgeInsets.all(10.0),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(20.0),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Color.fromRGBO(28, 28, 28, 0.1).withOpacity(
//                                   0.1),
//                               spreadRadius: 2,
//                               blurRadius: 5,
//                               offset: Offset(0, 3),
//                             ),
//                           ],
//                         ),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Container(
//                               width: 80,
//                               height: 80,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(16),
//                                 color: Color.fromRGBO(246, 246, 246, 1),
//                               ),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Image.asset(
//                                   order['image'],
//                                   width: 58,
//                                   height: 58,
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               width: 3.w,
//                             ),
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.only(top: 5.0),
//                                     child: Text(
//                                       order['title'],
//                                       style: GoogleFonts.poppins(
//                                         textStyle: TextStyle(
//                                           fontWeight: FontWeight.w500,
//                                           fontSize: 10.sp,
//                                           color: Color.fromRGBO(31, 31, 31, 1),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(height: 0.5.h),
//                                   Text(
//                                     order['Sub'] ??
//                                         '', // Provide default value if null
//                                     style: GoogleFonts.poppins(
//                                       textStyle: TextStyle(
//                                         fontWeight: FontWeight.w500,
//                                         fontSize: 10.sp,
//                                         color: Color.fromRGBO(31, 31, 31, 1),
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(height: 1.h),
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment
//                                         .spaceBetween,
//                                     children: [
//                                       Text(
//                                         order['date'],
//                                         style: GoogleFonts.poppins(
//                                           textStyle: TextStyle(
//                                             fontSize: 10.sp,
//                                             fontWeight: FontWeight.w500,
//                                             color: Color.fromRGBO(84, 84, 84, 1),
//                                           ),
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.symmetric(
//                                             horizontal: 5.0),
//                                         child: Image.asset(
//                                           AppImages.arrow_circle_right,
//                                           height: 18,
//                                           width: 18,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   SizedBox(
//                                     height: 1.h,
//                                   ),
//                                   Container(
//                                     padding: const EdgeInsets.symmetric(
//                                       horizontal: 8.0,
//                                       vertical: 4.0,
//                                     ),
//                                     decoration: BoxDecoration(
//                                       color: order[
//                                       'statusColor'], // Directly use the color
//                                       borderRadius: BorderRadius.circular(8.0),
//                                     ),
//                                     child: Text(
//                                       order['status'],
//                                       style: TextStyle(
//                                           color: order[
//                                           'statusTextColor'],
//                                           // Use the text color for contrast
//                                           fontWeight: FontWeight.w500,
//                                           fontSize: 9.sp),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 1.h,
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             )
//           ]),
//         ));
//   }
// }

// class FilterBottomSheetContent extends StatefulWidget {
//   @override
//   _FilterBottomSheetContentState createState() =>
//       _FilterBottomSheetContentState();
// }

// class _FilterBottomSheetContentState extends State<FilterBottomSheetContent> {
//   int? selectedYear = 2024; // Default selected year
//   final int allOption = -1; // Special value for the "All" option

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 70.h,
//       width: Get.width,
//       padding: EdgeInsets.symmetric(horizontal: 16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           2.height,
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 'Filters',
//                 style: GoogleFonts.poppins(textStyle: TextStyle(
//                   fontSize: 14.sp,
//                   fontWeight: FontWeight.w600,
//                   color: Color.fromRGBO(31, 31, 31, 1),
//                 ),
//                 ),
//               ),
//               GestureDetector(
//                   onTap: (){
//                     Navigator.pop(context);
//                   },
//                   child: SvgPicture.asset(AppSvgs.closeCircle,color: AppColors.primary,))
//             ],
//           ),
//           2.height,
//           Row(
//             children: [
//               Expanded(
//                 child: Container(
//                   decoration: BoxDecoration(
//                     border: Border(
//                       bottom: BorderSide(
//                         color: Color.fromRGBO(235, 223, 224, 1),
//                         width: 1.0, // Border width
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 20,),

//           Text(
//             'Filter By Order Date',
//             style: GoogleFonts.poppins(textStyle: TextStyle(
//               fontSize: 14.sp,
//               fontWeight: FontWeight.w600,
//               color: Color.fromRGBO(31, 31, 31, 1),
//             ),
//             ),
//           ),
//           3.height,
//           Expanded(
//             child: ListView.builder(
//               padding: EdgeInsets.zero,
//               itemCount: 9, // 1 for "All" + 8 years
//               itemBuilder: (context, index) {
//                 if (index == 0) {
//                   // "All" option
//                   return Row(
//                     mainAxisAlignment: MainAxisAlignment.start, // Align children to the start
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.zero, // Remove any padding
//                         child: Radio<int>(
//                           value: allOption,
//                           groupValue: selectedYear,
//                           onChanged: (int? value) {
//                             setState(() {
//                               selectedYear = value;
//                             });
//                           },
//                           activeColor: Colors.red,
//                           materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, // Reduce touch target size
//                         ),
//                       ),
//                       // Use Transform.translate to adjust the text position
//                       Transform.translate(
//                         offset: Offset(-5, 0), // Adjust this offset to move text closer to radio
//                         child: Text(
//                           "All",
//                           style: GoogleFonts.poppins(
//                             textStyle: TextStyle(
//                               fontSize: 10.sp,
//                               fontWeight: FontWeight.w400,
//                             )
//                           ),
//                         ),
//                       ),
//                     ],
//                   );

//                 } else {
//                   // Year options
//                   int year = 2024 - (index - 1); // Adjust index for year calculation
//                   return Row(
//                     children: [
//                       Radio<int>(
//                         value: year,
//                         groupValue: selectedYear,
//                         onChanged: (int? value) {
//                           setState(() {
//                             selectedYear = value;
//                           });
//                         },
//                         activeColor: Colors.red,
//                         materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, // Reduce touch target size
//                       ),
//                       Transform.translate(
//                         offset: Offset(-5, 0), // Adjust this offset to fine-tune the spacing
//                         child: Text(
//                           year.toString(),
//                           style: GoogleFonts.poppins(
//                               textStyle: TextStyle(
//                                 fontSize: 10.sp,
//                                 fontWeight: FontWeight.w400,
//                               )
//                           ),
//                         ),
//                       ),
//                     ],
//                   );

//                 }
//               },
//             ),
//           ),
//           3.height,
//           SizedBox(
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                CustomButton(
//                    width: 40.w,
//                    label: "Apply", onPressed: (){
//                  Get.back();
//                }),
//                Spacer(),
//                CustomButton(
//                  width: 40.w,
//                    label: "Clear",
//                    onPressed: (){
//                      Get.back();
//                    },
//                  foregroundColor: AppColors.primary,
//                  backgroundColor: Colors.white,
//                ),
//               ],
//             ),
//           ),
//           SizedBox(height: 20,)
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/Order_detail/Order_detailed_screen.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  int selectedButtonIndex = 0;

  final List<Map<String, dynamic>> orders = [
    {
      'image': AppImages.Car_headlights,
      'title': '19 20 21 22 ACURA ILX Genuine',
      'Sub': 'Headlamp Right 68088868AD',
      'date': 'Ordered On March 11, 2024',
      'status': 'Confirmed',
      'statusColor': Color.fromRGBO(230, 250, 239, 1), // Green
      'statusTextColor':
          Color.fromRGBO(0, 199, 92, 1), // White text for green background
    },
    {
      'image': AppImages.Car_headlights,
      'title': '19 20 21 22 ACURA ILX Genuine',
      'Sub': 'Headlamp Right 68088868AD',
      'date': 'Ordered On March 11, 2024',
      'status': 'In Progress',
      'statusColor': Color.fromRGBO(253, 248, 240, 1), // Orange
      'statusTextColor':
          Color.fromRGBO(255, 153, 0, 1), // White text for orange background
    },
    {
      'image': AppImages.Car_headlights,
      'title': 'Motor Vehicle Registration and',
      // 'Sub': '2 Others',

      'date': 'Ordered On March 11, 2024',
      'status': 'Delivered',
      'statusColor': Color.fromRGBO(241, 248, 255, 1), // Red
      'statusTextColor':
          Color.fromRGBO(22, 126, 230, 1), // White text for red background
    },
    {
      'image': AppImages.Car_headlights,
      'title': '19 20 21 22 ACURA ILX Genuine',
      'Sub': 'Headlamp Right 68088868AD',
      'date': 'Ordered On March 11, 2024',
      'status': 'Delivered',
      'statusColor': Color.fromRGBO(241, 248, 255, 1), // Red
      'statusTextColor':
          Color.fromRGBO(22, 126, 230, 1), // White text for red background
    },
  ];

  void showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return FilterBottomSheetContent();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: myAppBar(
            title: 'My Orders',
            icon: AppSvgs.filter2,
            isSearch: false,
            isToggle: true,
            onTogglePressed: () {
              showFilterBottomSheet(context);
            },
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                borderColor: AppColors.white,
                label: "All",
                labelFontSize: 10.sp,
                onPressed: () {
                  setState(() {
                    selectedButtonIndex = 0;
                  });
                },
                height: 5.h,
                width: 25.w,
                backgroundColor: selectedButtonIndex == 0
                    ? AppColors.primary
                    : Colors.transparent,
                foregroundColor:
                    selectedButtonIndex == 0 ? AppColors.white : AppColors.grey,
              ),
              CustomButton(
                borderColor: AppColors.white,
                label: "Products",
                labelFontSize: 10.sp,
                onPressed: () {
                  setState(() {
                    selectedButtonIndex = 1;
                  });
                },
                height: 5.h,
                width: 28.w,
                backgroundColor: selectedButtonIndex == 1
                    ? AppColors.primary
                    : Colors.transparent,
                foregroundColor:
                    selectedButtonIndex == 1 ? AppColors.white : AppColors.grey,
              ),
              CustomButton(
                borderColor: AppColors.white,
                label: "Services",
                labelFontSize: 10.sp,
                onPressed: () {
                  setState(() {
                    selectedButtonIndex = 2;
                  });
                },
                height: 5.h,
                width: 25.w,
                backgroundColor: selectedButtonIndex == 2
                    ? AppColors.primary
                    : Colors.transparent,
                foregroundColor:
                    selectedButtonIndex == 2 ? AppColors.white : AppColors.grey,
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];
              return InkWell(
                onTap: () {
                  Get.to(OrderDetailedScreen());
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color:
                              Color.fromRGBO(28, 28, 28, 0.1).withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Color.fromRGBO(246, 246, 246, 1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              order['image'],
                              width: 58,
                              height: 58,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Text(
                                  order['title'],
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10.sp,
                                      color: Color.fromRGBO(31, 31, 31, 1),
                                    ),
                                  ),
                                ),
                              ),
                              if (order['Sub'] != null) SizedBox(height: 0.5.h),
                              if (order['Sub'] != null)
                                Text(
                                  order['Sub'] ??
                                      '', // Provide default value if null
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10.sp,
                                      color: Color.fromRGBO(31, 31, 31, 1),
                                    ),
                                  ),
                                ),
                              SizedBox(height: 1.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    order['date'],
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(84, 84, 84, 1),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    child: Image.asset(
                                      AppImages.arrow_circle_right,
                                      height: 18,
                                      width: 18,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                  vertical: 4.0,
                                ),
                                decoration: BoxDecoration(
                                  color: order[
                                      'statusColor'], // Directly use the color
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Text(
                                  order['status'],
                                  style: TextStyle(
                                      color: order['statusTextColor'],
                                      // Use the text color for contrast
                                      fontWeight: FontWeight.w500,
                                      fontSize: 9.sp),
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ]),
    ));
  }
}

class FilterBottomSheetContent extends StatefulWidget {
  @override
  _FilterBottomSheetContentState createState() =>
      _FilterBottomSheetContentState();
}

class _FilterBottomSheetContentState extends State<FilterBottomSheetContent> {
  int? selectedYear = 2024; // Default selected year
  final int allOption = -1; // Special value for the "All" option

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      width: Get.width,
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          2.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Filters',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(31, 31, 31, 1),
                  ),
                ),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(
                    AppSvgs.closeCircle,
                    color: AppColors.primary,
                  ))
            ],
          ),
          2.height,
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color.fromRGBO(235, 223, 224, 1),
                        width: 1.0, // Border width
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Filter By Order Date',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(31, 31, 31, 1),
              ),
            ),
          ),
          3.height,
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: 9, // 1 for "All" + 8 years
              itemBuilder: (context, index) {
                if (index == 0) {
                  // "All" option
                  return Row(
                    mainAxisAlignment:
                        MainAxisAlignment.start, // Align children to the start
                    children: [
                      Padding(
                        padding: EdgeInsets.zero, // Remove any padding
                        child: Radio<int>(
                          value: allOption,
                          groupValue: selectedYear,
                          onChanged: (int? value) {
                            setState(() {
                              selectedYear = value;
                            });
                          },
                          activeColor: Colors.red,
                          materialTapTargetSize: MaterialTapTargetSize
                              .shrinkWrap, // Reduce touch target size
                        ),
                      ),
                      // Use Transform.translate to adjust the text position
                      Transform.translate(
                        offset: Offset(-5,
                            0), // Adjust this offset to move text closer to radio
                        child: Text(
                          "All",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                          )),
                        ),
                      ),
                    ],
                  );
                } else {
                  // Year options
                  int year =
                      2024 - (index - 1); // Adjust index for year calculation
                  return Row(
                    children: [
                      Radio<int>(
                        value: year,
                        groupValue: selectedYear,
                        onChanged: (int? value) {
                          setState(() {
                            selectedYear = value;
                          });
                        },
                        activeColor: Colors.red,
                        materialTapTargetSize: MaterialTapTargetSize
                            .shrinkWrap, // Reduce touch target size
                      ),
                      Transform.translate(
                        offset: Offset(-5,
                            0), // Adjust this offset to fine-tune the spacing
                        child: Text(
                          year.toString(),
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                          )),
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
          3.height,
          SizedBox(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                    width: 40.w,
                    label: "Apply",
                    onPressed: () {
                      Get.back();
                    }),
                Spacer(),
                CustomButton(
                  width: 40.w,
                  label: "Clear",
                  onPressed: () {
                    Get.back();
                  },
                  foregroundColor: AppColors.primary,
                  backgroundColor: Colors.white,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
