// import 'package:nanduba/constants/textfontstyle.dart';
// import 'package:nanduba/export.dart';

// class EstimatesDetails extends StatefulWidget {
//   const EstimatesDetails({super.key});

//   @override
//   State<EstimatesDetails> createState() => _CompareEstimatesScreenState();
// }

// class _CompareEstimatesScreenState extends State<EstimatesDetails> {
//   final List<Map<String, dynamic>> estimates = [
//     {
//       'image': 'assets/images/shop1.png',
//       'name': 'Carlaw Tire & Auto Service Centre',
//       'price': '\$800.00',
//       'rating': 4.5,
//       'reviews': '1.5k ratings',
//       'location': '45 Pondfield Rd W #1C',
//     },
//     {
//       'image': 'assets/images/shop2.png',
//       'name': 'Almer\'s Tire & Auto Workshop',
//       'price': '\$1000.00',
//       'rating': 4.5,
//       'reviews': '1.5k ratings',
//       'location': 'Seattle, Washington, USA',
//     },
//     {
//       'image': 'assets/images/shop3.png',
//       'name': 'Khawar Tire & Auto Service Centre',
//       'price': '\$850.00',
//       'rating': 4.8,
//       'reviews': '1.5k ratings',
//       'location': 'Seattle, Washington, USA',
//     },
//     {
//       'image': 'assets/images/shop4.png',
//       'name': 'Almer\'s Tire & Auto Workshop',
//       'price': '\$1000.00',
//       'rating': 4.5,
//       'reviews': '1.5k ratings',
//       'location': 'Seattle, Washington, USA',
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Column(
//           children: [
//             // Custom AppBar
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
//               child: CustomAppbar(
//                 title: "Compare Estimates",
//                 isPop: true,
//               ),
//             ),

//             2.height,

//             // Estimates List
//             Expanded(
//               child: ListView.builder(
//                 padding: const EdgeInsets.symmetric(horizontal: 18),
//                 itemCount: estimates.length,
//                 itemBuilder: (context, index) {
//                   final estimate = estimates[index];
//                   return EstimateCard(
//                     image: estimate['image'],
//                     name: estimate['name'],
//                     price: estimate['price'],
//                     rating: estimate['rating'],
//                     reviews: estimate['reviews'],
//                     location: estimate['location'],
//                     onViewTap: () {
//                       // Handle view details
//                     },
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // Reusable Estimate Card Widget
// class EstimateCard extends StatelessWidget {
//   final String image;
//   final String name;
//   final String price;
//   final double rating;
//   final String reviews;
//   final String location;
//   final VoidCallback? onViewTap;

//   const EstimateCard({
//     super.key,
//     required this.image,
//     required this.name,
//     required this.price,
//     required this.rating,
//     required this.reviews,
//     required this.location,
//     this.onViewTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(bottom: 2.h),
//       padding: EdgeInsets.all(3.w),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.1),
//             spreadRadius: 1,
//             blurRadius: 5,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Shop Image
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(8),
//                 child: Container(
//                   width: 70,
//                   height: 70,
//                   color: Colors.grey[200],
//                   child: Icon(
//                     Icons.store,
//                     size: 40,
//                     color: Colors.grey[400],
//                   ),
//                   // Uncomment when you have actual images
//                   // child: Image.asset(
//                   //   image,
//                   //   fit: BoxFit.cover,
//                   // ),
//                 ),
//               ),

//               3.width,

//               // Shop Details
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Expanded(
//                           child: Text(
//                             name,
//                             style: Textfontstyle.TextStyle18w700c212121poppins
//                                 .copyWith(
//                               fontSize: 12.sp,
//                               fontWeight: FontWeight.w600,
//                             ),
//                             maxLines: 2,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ),
//                         Icon(
//                           Icons.more_vert,
//                           color: const Color(0xFFE83E52),
//                           size: 20,
//                         ),
//                       ],
//                     ),

//                     SizedBox(height: 0.5.h),

//                     // Price
//                     Text(
//                       price,
//                       style:
//                           Textfontstyle.TextStyle18w700c212121poppins.copyWith(
//                         fontSize: 16.sp,
//                         fontWeight: FontWeight.w700,
//                         color: const Color(0xFFE83E52),
//                       ),
//                     ),

//                     SizedBox(height: 0.5.h),

//                     // Rating
//                     Container(
//                       padding: EdgeInsets.symmetric(
//                           horizontal: 2.w, vertical: 0.3.h),
//                       decoration: BoxDecoration(
//                         color: Colors.amber,
//                         borderRadius: BorderRadius.circular(6),
//                       ),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Text(
//                             rating.toString(),
//                             style: Textfontstyle.TextStyle14w400midgreyinter
//                                 .copyWith(
//                               fontSize: 10.sp,
//                               color: Colors.white,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                           SizedBox(width: 0.5.w),
//                           Icon(
//                             Icons.star,
//                             color: Colors.white,
//                             size: 12,
//                           ),
//                         ],
//                       ),
//                     ),

//                     SizedBox(height: 0.3.h),

//                     // Reviews
//                     Text(
//                       reviews,
//                       style: Textfontstyle.TextStyle14w400midgreyinter.copyWith(
//                         fontSize: 9.sp,
//                         color: Colors.grey[600],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),

//           1.5.height,

//           // Location and View Button
//           Row(
//             children: [
//               Icon(
//                 Icons.location_on_outlined,
//                 color: const Color(0xFFE83E52),
//                 size: 16,
//               ),
//               SizedBox(width: 1.w),
//               Expanded(
//                 child: Text(
//                   location,
//                   style: Textfontstyle.TextStyle14w400midgreyinter.copyWith(
//                     fontSize: 10.sp,
//                     color: Colors.grey[600],
//                   ),
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ),

//               SizedBox(width: 2.w),

//               // View Button
//               GestureDetector(
//                 onTap: onViewTap,
//                 child: Container(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 6.w,
//                     vertical: 1.h,
//                   ),
//                   decoration: BoxDecoration(
//                     color: const Color(0xFFE83E52),
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Text(
//                     "View",
//                     style: Textfontstyle.TextStyle14w400midgreyinter.copyWith(
//                       fontSize: 11.sp,
//                       color: Colors.white,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
