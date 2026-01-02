// import 'package:flutter/material.dart';
// import 'package:nanduba/constants/colors.dart';
// import 'package:nanduba/export.dart';
//
// class CardWidget extends StatelessWidget {
//   final String number;
//   final String name;
//   final String expiry;
//   final String image;
//   final Color color;
//
//   CardWidget({
//     required this.number,
//     required this.name,
//     required this.expiry,
//     required this.image, required this.color,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 5),
//       decoration: BoxDecoration(
//      color: color,
//         borderRadius: BorderRadius.circular(5.w),
//         // image: DecorationImage(image: AssetImage(image),fit: BoxFit.cover)
//
//       ),
//       child: Padding(
//         padding:  EdgeInsets.symmetric(horizontal: 3.w,vertical: 2.5.h),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             Text(
//               number,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Card Holder Name',
//                       style: TextStyle(
//                         color: Colors.white.withOpacity(0.8),
//                         fontSize: 12,
//                       ),
//                     ),
//                     Text(
//                       name,
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Expiry Date',
//                       style: TextStyle(
//                         color: Colors.white.withOpacity(0.8),
//                         fontSize: 12,
//                       ),
//                     ),
//                     Text(
//                       expiry,
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:nanduba/constants/colors.dart';
import 'package:nanduba/export.dart';

class CardWidget extends StatelessWidget {
  final String number;
  final String name;
  final String expiry;
  final String image;
  final Color color;

  CardWidget({
    required this.number,
    required this.name,
    required this.expiry,
    required this.image, required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 168,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5.w),
        // image: DecorationImage(image: AssetImage(image),fit: BoxFit.cover)

      ),
      child: Stack(
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 3.w,vertical: 2.5.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  number,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Card Holder Name',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Expiry Date',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          expiry,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            right: -15,
            top: -20,
            child: Container(
              height: 79,
              width: 79,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                shape: BoxShape.circle
              ),
            ),
          ),
          Positioned(
            right: 80,
            top: 20,
            child: Container(
              height: 23,
              width: 23,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                shape: BoxShape.circle
              ),
            ),
          ),
          Positioned(
            left: -15,
            bottom: -10,
            child: Container(
              height: 77,
              width: 77,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white.withOpacity(0.2),
                    width: 8

                  ),
                  shape: BoxShape.circle
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 30,
            child: Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.84),
                  shape: BoxShape.circle
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 15,
            child: Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.47),
                  shape: BoxShape.circle
              ),
            ),
          ),

        ],
      ),
    );
  }
}