// import 'package:nanduba/export.dart';

// class Engine extends StatefulWidget {
//   const Engine({super.key});

//   @override
//   State<Engine> createState() => _EngineState();
// }

// class _EngineState extends State<Engine> {
//   late List<String> prefixSvgImage;
//   late List<String> title;
//   @override
//   void initState() {
//     super.initState();
//     isBorder = List.generate(4, (index) => false);
//     prefixSvgImage = [
//       AppSvgs.engine,
//       AppSvgs.oilChange,
//       AppSvgs.engineOverhaul,
//       AppSvgs.engineReplacement
//     ];
//     title = [
//       AppText.engineService,
//       AppText.oilChange,
//       AppText.engineOverhaul,
//       AppText.engineReplacement
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
//               child: const CustomAppbar(
//                 title: '${AppText.service}s',
//               ),
//             ),
//             Expanded(
//                 child: Column(
//               children: [
//                 for (int i = 0; i < prefixSvgImage.length; i++)
//                   SingleChildScrollView(
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 4.w),
//                       child: EngineServiceBottomSheet(
//                         prefixSvgImage: prefixSvgImage[i],
//                         title: title[i],
//                         index: i,
//                       ),
//                     ),
//                   ),
//               ],
//             )),
//             CustomContainer(
//               vpadding: 2.h,
//               vMargin: 2.h,
//               width: 90.w,
//               spreadRadius: 0,
//               blurRadius: 0,
//               borderRadius: 15.sp,
//               color: AppColors.secondary,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SvgPicture.asset(AppSvgs.bag),
//                   2.width,
//                   Text(
//                     '1 ${AppText.servicesAdded}',
//                     style: Theme.of(context)
//                         .textTheme
//                         .bodyMedium
//                         ?.copyWith(fontWeight: FontWeight.w600),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
