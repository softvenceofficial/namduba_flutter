// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:nanduba/export.dart';

// class DetailCustomContainer extends StatelessWidget {
//   final Widget child;
//   final double? height;
//   final double? width;
//   final double? vMargin;
//   final double? hMargin;
//   final double? vpadding;
//   final double? hpadding;
//   final double? spreadRadius;
//   final double? blurRadius;
//   final double? borderRadius;
//   final Color? color;
//   final bool? isBorder;
//   final String? statusText;
//   final Color? statusColor;
//   final String? addressText;
//   final Color? addressTextColor;

//   const DetailCustomContainer({
//     super.key,
//     required this.child,
//     this.height,
//     this.width,
//     this.vMargin,
//     this.hMargin,
//     this.vpadding,
//     this.hpadding,
//     this.spreadRadius,
//     this.blurRadius,
//     this.borderRadius,
//     this.color,
//     this.isBorder = false,
//     this.statusText = 'Unfulfilled',
//     this.statusColor = const Color.fromRGBO(55, 125, 215, 1),
//     this.addressText = 'Ship to customer - 4517 Washington',
//     this.addressTextColor = const Color.fromRGBO(159, 159, 159, 1),
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: height,
//       width: width,
//       margin: EdgeInsets.symmetric(
//         vertical: vMargin ?? 0.h,
//         horizontal: hMargin ?? 0.w,
//       ),
//       padding: EdgeInsets.symmetric(
//         vertical: vpadding ?? 0.h,
//         horizontal: hpadding ?? 0.w,
//       ),
//       decoration: BoxDecoration(
//         color: color ?? AppColors.white,
//         boxShadow: [
//           BoxShadow(
//             color: AppColors.shadow,
//             spreadRadius: spreadRadius ?? 2,
//             blurRadius: blurRadius ?? 10,
//           ),
//         ],
//         borderRadius: BorderRadius.circular(borderRadius ?? 3.5.w),
//         border: isBorder == true ? Border.all(color: AppColors.midPink) : null,
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             width: 25.w,
//             decoration: BoxDecoration(
//               color: statusColor ?? const Color.fromRGBO(55, 125, 215, 1),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 2),
//               child: Row(
//                 children: [
//                   Icon(
//                     CupertinoIcons.arrow_counterclockwise,
//                     color: Colors.white,

//                     size: 1.4.h,
//                   ),
//                   Text(
//                     '  $statusText',
//                     style: GoogleFonts.poppins(
//                       textStyle: TextStyle(
//                         fontSize: 8.sp,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(height: 1.5.h),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 0.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Text(
//                   addressText ?? 'Ship to customer - 4517 Washington',
//                   style: GoogleFonts.poppins(
//                     textStyle: TextStyle(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 9.sp,
//                       color: addressTextColor ?? Color.fromRGBO(159, 159, 159, 1),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 2.h),
//           child, // Include the passed child widget
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:nanduba/export.dart';

// class DetailCustomContainer extends StatelessWidget {
//   final Widget child;
//   final double? height;
//   final double? width;
//   final double? vMargin;
//   final double? hMargin;
//   final double? vpadding;
//   final double? hpadding;
//   final double? spreadRadius;
//   final double? blurRadius;
//   final double? borderRadius;
//   final Color? color;
//   final bool? isBorder;
//   final String? statusText;
//   final Color? statusColor;
//   final String? addressText;
//   final Color? addressTextColor;

//   const DetailCustomContainer({
//     super.key,
//     required this.child,
//     this.height,
//     this.width,
//     this.vMargin,
//     this.hMargin,
//     this.vpadding,
//     this.hpadding,
//     this.spreadRadius,
//     this.blurRadius,
//     this.borderRadius,
//     this.color,
//     this.isBorder = false,
//     this.statusText = 'Unfulfilled',
//     this.statusColor = const Color.fromRGBO(55, 125, 215, 1),
//     this.addressText = 'Ship to customer - 4517 Washington',
//     this.addressTextColor = const Color.fromRGBO(159, 159, 159, 1),
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: height,
//       width: width,
//       margin: EdgeInsets.symmetric(
//         vertical: vMargin ?? 0.h,
//         horizontal: hMargin ?? 0.w,
//       ),
//       padding: EdgeInsets.symmetric(
//         vertical: vpadding ?? 0.h,
//         horizontal: hpadding ?? 0.w,
//       ),
//       decoration: BoxDecoration(
//         color: color ?? AppColors.white,
//         boxShadow: [
//           BoxShadow(
//             color: AppColors.shadow,
//             spreadRadius: spreadRadius ?? 2,
//             blurRadius: blurRadius ?? 10,
//           ),
//         ],
//         borderRadius: BorderRadius.circular(borderRadius ?? 3.5.w),
//         border: isBorder == true ? Border.all(color: AppColors.midPink) : null,
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             width: 25.w,
//             decoration: BoxDecoration(
//               color: statusColor ?? const Color.fromRGBO(55, 125, 215, 1),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
//               child: Row(
//                 children: [
//                   Icon(
//                     CupertinoIcons.arrow_counterclockwise,
//                     color: Colors.white,
//                     size: 1.4.h,
//                   ),
//                   Text(
//                     '  $statusText',
//                     style: GoogleFonts.poppins(
//                       textStyle: TextStyle(
//                         fontSize: 8.sp,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(height: 1.5.h),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 0.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Text(
//                   addressText ?? 'Ship to customer - 4517 Washington',
//                   style: GoogleFonts.poppins(
//                     textStyle: TextStyle(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 9.sp,
//                       color:
//                           addressTextColor ?? Color.fromRGBO(159, 159, 159, 1),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 2.h),
//           child, // Include the passed child widget
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanduba/export.dart';

class DetailCustomContainer extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  final double? vMargin;
  final double? hMargin;
  final double? vpadding;
  final double? hpadding;
  final double? spreadRadius;
  final double? blurRadius;
  final double? borderRadius;
  final Color? color;
  final bool? isBorder;
  final String? statusText;
  final Color? statusColor;
  final String? addressText;
  final Color? addressTextColor;

  const DetailCustomContainer({
    super.key,
    required this.child,
    this.height,
    this.width,
    this.vMargin,
    this.hMargin,
    this.vpadding,
    this.hpadding,
    this.spreadRadius,
    this.blurRadius,
    this.borderRadius,
    this.color,
    this.isBorder = false,
    this.statusText = 'Unfulfilled',
    this.statusColor = const Color.fromRGBO(55, 125, 215, 1),
    this.addressText = 'Ship to customer - 4517 Washington',
    this.addressTextColor = const Color.fromRGBO(159, 159, 159, 1),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.symmetric(
        vertical: vMargin ?? 0.h,
        horizontal: hMargin ?? 0.w,
      ),
      padding: EdgeInsets.symmetric(
        vertical: vpadding ?? 0.h,
        horizontal: hpadding ?? 0.w,
      ),
      decoration: BoxDecoration(
        color: color ?? AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            spreadRadius: spreadRadius ?? 2,
            blurRadius: blurRadius ?? 10,
          ),
        ],
        borderRadius: BorderRadius.circular(borderRadius ?? 3.5.w),
        border: isBorder == true ? Border.all(color: AppColors.midPink) : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 25.w,
            decoration: BoxDecoration(
              color: statusColor ?? const Color.fromRGBO(55, 125, 215, 1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
              child: Row(
                children: [
                  Icon(
                    CupertinoIcons.arrow_counterclockwise,
                    color: Colors.white,
                    size: 1.4.h,
                  ),
                  Text(
                    '  $statusText',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 1.5.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  addressText ?? 'Ship to customer - 4517 Washington',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 9.sp,
                      color:
                          addressTextColor ?? Color.fromRGBO(159, 159, 159, 1),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 2.h),
          child, // Include the passed child widget
        ],
      ),
    );
  }
}
