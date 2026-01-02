// import 'package:get/get.dart';
// import 'package:nanduba/controllers/order_detail_controller.dart';
// import 'package:nanduba/providers/view_request_provider.dart';
// import 'package:nanduba/views/contact_us/contact_us_screen.dart';
// import 'package:nanduba/views/create_request/view_requests/view_requests.dart';
// import 'package:nanduba/views/leave_feedback/feedback_screen.dart';

// import '../../../export.dart';
// import '../../add_vehicle/review_details/component/vehicle_type_sheet.dart';
// import '../../create_request/view_requests/component/triangle_painter.dart';

// class OrderPopUpMenu extends StatelessWidget {
//    OrderPopUpMenu({super.key});

//   final OrderDetailController controller= Get.find<OrderDetailController>();

//   @override
//   Widget build(BuildContext context) {
//     return  Positioned(
//         top: 0,
//         right: 4.w,
//         child: Visibility(
//           maintainAnimation: true,
//           maintainState: true,
//           visible: controller.popUp.value,
//           child: AnimatedOpacity(
//             duration:
//             Duration(milliseconds: 200),
//             opacity:controller.popUp.value==true ? 1 : 0,
//             child: Stack(
//               clipBehavior: Clip.none,
//               alignment: Alignment.topRight,
//               children: [
//                 Container(
//                   alignment: Alignment.center,
//                   padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(3.w),
//                       boxShadow: [
//                         BoxShadow(
//                             color: AppColors.shadow,
//                             blurRadius: 20,
//                             offset: Offset(0, 2)
//                         )
//                       ]

//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       GestureDetector(
//                         onTap: ()async{
//                           await  showModalBottomSheet(
//                               backgroundColor: AppColors.white,
//                               context: context,
//                               useSafeArea: true,
//                               isScrollControlled: true,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.vertical(top: Radius.circular(20.sp)),
//                               ),
//                               builder: (BuildContext context){
//                                 return VehicleTypeSheet();
//                               });
//                         },
//                         child: Row(
//                           children: [
//                             Container(
//                               height: 5.h,
//                               width: 10.5.w,
//                               alignment: Alignment.center,
//                               decoration: BoxDecoration(
//                                   color: AppColors.secondary,
//                                   borderRadius: BorderRadius.circular(10)
//                               ),
//                               child: SvgPicture.asset(AppSvgs.download),

//                             ),
//                             3.width,
//                             Text("Download Invoice",
//                                 style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                                   color: AppColors.textColor,
//                                   fontWeight: FontWeight.w500,
//                                 )),
//                           ],
//                         ),
//                       ),
//                       2.height,
//                       GestureDetector(
//                         onTap: (){
//                           Get.to(ContactUsScreen());
//                         },
//                         child: Row(
//                           children: [
//                             Container(
//                               height: 5.h,
//                               width: 10.5.w,
//                               alignment: Alignment.center,
//                               decoration: BoxDecoration(
//                                   color: AppColors.secondary,
//                                   borderRadius: BorderRadius.circular(10)
//                               ),
//                               child: SvgPicture.asset(AppSvgs.contact),

//                             ),                          3.width,
//                             Text("Contact Support",
//                                 style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                                   color: AppColors.textColor,
//                                   fontWeight: FontWeight.w500,
//                                 )),
//                           ],
//                         ),
//                       ),
//                       2.height,
//                       GestureDetector(
//                         onTap: (){
//                           Get.to(FeedbackScreen());
//                         },
//                         child: Row(
//                           children: [
//                             Container(
//                               height: 5.h,
//                               width: 10.5.w,
//                               alignment: Alignment.center,
//                               decoration: BoxDecoration(
//                                   color: AppColors.secondary,
//                                   borderRadius: BorderRadius.circular(10)
//                               ),
//                               child: SvgPicture.asset(AppSvgs.contact),

//                             ),                          3.width,
//                             Text("Leave Feedback",
//                                 style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                                   color: AppColors.textColor,
//                                   fontWeight: FontWeight.w500,
//                                 )),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Positioned(
//                   top: -14,
//                   right: 8,
//                   child: CustomPaint(
//                     size: Size(40, 20),
//                     painter: TrianglePainter(),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ));

//   }
// }

// import 'package:get/get.dart';
// import 'package:nanduba/controllers/order_detail_controller.dart';
// import 'package:nanduba/providers/view_request_provider.dart';
// import 'package:nanduba/views/contact_us/contact_us_screen.dart';
// import 'package:nanduba/views/create_request/view_requests/view_requests.dart';
// import 'package:nanduba/views/leave_feedback/feedback_screen.dart';

// import '../../../export.dart';
// import '../../add_vehicle/review_details/component/vehicle_type_sheet.dart';
// import '../../create_request/view_requests/component/triangle_painter.dart';

// class OrderPopUpMenu extends StatelessWidget {
//   OrderPopUpMenu({super.key});

//   final OrderDetailController controller = Get.find<OrderDetailController>();

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       top: 0,
//       right: 4.w,
//       child: Visibility(
//         maintainAnimation: true,
//         maintainState: true,
//         visible: controller.popUp.value,
//         child: AnimatedOpacity(
//           duration: Duration(milliseconds: 200),
//           opacity: controller.popUp.value == true ? 1 : 0,
//           child: Stack(
//             clipBehavior: Clip.none,
//             alignment: Alignment.topRight,
//             children: [
//               Container(
//                 alignment: Alignment.center,
//                 padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(3.w),
//                   boxShadow: [
//                     BoxShadow(
//                       color: AppColors.shadow,
//                       blurRadius: 20,
//                       offset: Offset(0, 2),
//                     ),
//                   ],
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Removed GestureDetector from here
//                     Row(
//                       children: [
//                         Container(
//                           height: 5.h,
//                           width: 10.5.w,
//                           alignment: Alignment.center,
//                           decoration: BoxDecoration(
//                             color: AppColors.secondary,
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: SvgPicture.asset(AppSvgs.download),
//                         ),
//                         3.width,
//                         Text(
//                           "Download Invoice",
//                           style:
//                               Theme.of(context).textTheme.bodyMedium!.copyWith(
//                                     color: AppColors.textColor,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                         ),
//                       ],
//                     ),
//                     2.height,
//                     // Added GestureDetector here
//                     GestureDetector(
//                       onTap: () {
//                         Get.to(ContactUsScreen());
//                       },
//                       child: Row(
//                         children: [
//                           Container(
//                             height: 5.h,
//                             width: 10.5.w,
//                             alignment: Alignment.center,
//                             decoration: BoxDecoration(
//                               color: AppColors.secondary,
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: SvgPicture.asset(AppSvgs.contact),
//                           ),
//                           3.width,
//                           Text(
//                             "Contact Support",
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .bodyMedium!
//                                 .copyWith(
//                                   color: AppColors.textColor,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     2.height,
//                     GestureDetector(
//                       onTap: () {
//                         Get.to(FeedbackScreen());
//                       },
//                       child: Row(
//                         children: [
//                           Container(
//                             height: 5.h,
//                             width: 10.5.w,
//                             alignment: Alignment.center,
//                             decoration: BoxDecoration(
//                               color: AppColors.secondary,
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: SvgPicture.asset(AppSvgs.contact),
//                           ),
//                           3.width,
//                           Text(
//                             "Leave Feedback",
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .bodyMedium!
//                                 .copyWith(
//                                   color: AppColors.textColor,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Positioned(
//                 top: -14,
//                 right: 8,
//                 child: CustomPaint(
//                   size: Size(40, 20),
//                   painter: TrianglePainter(),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:get/get.dart';
import 'package:nanduba/controllers/order_detail_controller.dart';
import 'package:nanduba/providers/view_request_provider.dart';
import 'package:nanduba/views/contact_us/contact_us_screen.dart';
import 'package:nanduba/views/create_request/view_requests/view_requests.dart';
import 'package:nanduba/views/leave_feedback/feedback_screen.dart';

import '../../../export.dart';
import '../../add_vehicle/review_details/component/vehicle_type_sheet.dart';
import '../../create_request/view_requests/component/triangle_painter.dart';

class OrderPopUpMenu extends StatelessWidget {
  OrderPopUpMenu({super.key});

  final OrderDetailController controller = Get.find<OrderDetailController>();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 4.w,
      child: Visibility(
        maintainAnimation: true,
        maintainState: true,
        visible: controller.popUp.value,
        child: AnimatedOpacity(
          duration: Duration(milliseconds: 200),
          opacity: controller.popUp.value == true ? 1 : 0,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topRight,
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(3.w),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadow,
                      blurRadius: 20,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Removed GestureDetector from here
                    Row(
                      children: [
                        Container(
                          height: 5.h,
                          width: 10.5.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.secondary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: SvgPicture.asset(AppSvgs.download),
                        ),
                        3.width,
                        Text(
                          "Download Invoice",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: AppColors.textColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ],
                    ),
                    2.height,
                    // Added GestureDetector here
                    GestureDetector(
                      onTap: () {
                        Get.to(ContactUsScreen());
                      },
                      child: Row(
                        children: [
                          Container(
                            height: 5.h,
                            width: 10.5.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColors.secondary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: SvgPicture.asset(AppSvgs.contact),
                          ),
                          3.width,
                          Text(
                            "Contact Support",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ],
                      ),
                    ),
                    2.height,
                    GestureDetector(
                      onTap: () {
                        Get.to(FeedbackScreen());
                      },
                      child: Row(
                        children: [
                          Container(
                            height: 5.h,
                            width: 10.5.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColors.secondary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: SvgPicture.asset(AppSvgs.contact),
                          ),
                          3.width,
                          Text(
                            "Leave Feedback",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: -14,
                right: 8,
                child: CustomPaint(
                  size: Size(40, 20),
                  painter: TrianglePainter(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
