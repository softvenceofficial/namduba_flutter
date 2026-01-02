// import 'package:nanduba/export.dart';

// class EngineServiceBottomSheet extends StatefulWidget {
//   const EngineServiceBottomSheet(
//       {super.key,
//       required this.prefixSvgImage,
//       required this.title,
//       required this.index});
//   final String prefixSvgImage;
//   final String title;
//   final int index;

//   @override
//   State<EngineServiceBottomSheet> createState() =>
//       _EngineServiceBottomSheetState();
// }

// class _EngineServiceBottomSheetState extends State<EngineServiceBottomSheet> {
//   int quantity = 1;

//   Future<void> _showModalBottomSheet(BuildContext context) async {
//     await showModalBottomSheet(
//       backgroundColor: AppColors.white,
//       context: context,
//       isScrollControlled: true,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20.sp)),
//       ),
//       builder: (BuildContext context) {
//         return Padding(
//           padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
//           child: Padding(
//             padding: EdgeInsets.only(
//                 bottom: MediaQuery.of(context).viewInsets.bottom),
//             child: Wrap(
//               children: [
//                 Align(
//                   alignment: Alignment.topRight,
//                   child: GestureDetector(
//                     onTap: () {
//                       AppCustomNavigator.pop(context);
//                       setState(() {
//                         isBorder[widget.index] = false;
//                       });
//                     },
//                     child: SvgPicture.asset(
//                       AppSvgs.closeCircle,
//                       color: AppColors.primary,
//                       height: 2.5.h,
//                     ),
//                   ),
//                 ),
//                 4.height,
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     CustomHeading(
//                       title: widget.title,
//                       suffixText: AppText.addNotes,
//                       isSuffixSvg: true,
//                       suffixSvg: AppSvgs.addNotes,
//                       onTap: () {},
//                     ),
//                     SizedBox(height: 1.h),
//                     Text(
//                       'One disadvantage of Lorem Ipsum is that in Latin certain letters appear more frequently impression.',
//                       style: Theme.of(context).textTheme.bodySmall?.copyWith(
//                             fontWeight: FontWeight.w500,
//                             color: AppColors.midDarkGrey,
//                             fontSize: 9.sp,
//                           ),
//                     ),
//                     SizedBox(height: 2.h),
//                     CustomTextField(
//                       name: 'searchVehicle',
//                       hintText: AppText.searchVehicle,
//                       prefixIcon: SvgPicture.asset(
//                         AppSvgs.searchIcon,
//                         fit: BoxFit.scaleDown,
//                       ),
//                       suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded),
//                     ),
//                     Container(
//                       width: double.infinity,
//                       height: 28.h,
//                       decoration: BoxDecoration(
//                         border: Border.all(color: AppColors.border),
//                         borderRadius: BorderRadius.circular(20.sp),
//                       ),
//                       child: SingleChildScrollView(
//                         child: Padding(
//                           padding: EdgeInsets.symmetric(
//                               vertical: 1.h, horizontal: 4.w),
//                           child: Column(
//                             children: [
//                               for (int i = 0; i < 10; i++) ...{
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Row(
//                                       children: [
//                                         Image.asset(
//                                           AppImages.logo,
//                                           height: 2.5.h,
//                                         ),
//                                         SizedBox(width: 3.w),
//                                         Text('2012 Chevrolet Cruze'),
//                                       ],
//                                     ),
//                                     Radio<int>(
//                                       value: 1,
//                                       groupValue: null,
//                                       onChanged: (int? value) {},
//                                     )
//                                   ],
//                                 ),
//                                 i != 9
//                                     //TODO: for last vale=>  list.length-1
//                                     ? const Divider(
//                                         color: AppColors.border,
//                                       )
//                                     : const SizedBox.shrink(),
//                               }
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     1.5.height,
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                           decoration: BoxDecoration(
//                               border: Border.all(color: AppColors.border),
//                               borderRadius: BorderRadius.circular(20.sp),
//                               color: AppColors.secondary),
//                           height: 6.h,
//                           child: Row(
//                             children: [
//                               IconButton(
//                                 icon: const Icon(
//                                   Icons.remove,
//                                   color: AppColors.primary,
//                                 ),
//                                 onPressed: () => setState(() {
//                                   if (quantity > 1) quantity--;
//                                 }),
//                               ),
//                               Text('$quantity'),
//                               IconButton(
//                                 icon: const Icon(
//                                   Icons.add,
//                                   color: AppColors.primary,
//                                 ),
//                                 onPressed: () => setState(() {
//                                   quantity++;
//                                 }),
//                               ),
//                             ],
//                           ),
//                         ),
//                         4.width,
//                         Expanded(
//                           child: CustomButton(
//                               label: AppText.addItem,
//                               height: 6.h,
//                               onPressed: () {}),
//                         )
//                       ],
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );

//     // Update state when the bottom sheet is dismissed
//     setState(() {
//       isBorder[widget.index] = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: CustomTile(
//         prefixSvgImage: widget.prefixSvgImage,
//         title: widget.title,
//         isButton: false,
//         svgButton: AppSvgs.addCircle,
//         isBorder: isBorder[widget.index],
//         onTap: () {
//           setState(() {
//             isBorder[widget.index] = true;
//           });
//           _showModalBottomSheet(context);
//         },
//       ),
//     );
//   }
// }
