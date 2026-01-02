import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/order_detail/Order_detailed_screen.dart';
import 'package:nanduba/views/create_request/compare_estimates/request_estimate_item_detail/estimate_item_details.dart';
import 'package:nanduba/widgets/core/my_text.dart';

class PurchaseHistoryOrders extends StatefulWidget {
  const PurchaseHistoryOrders({super.key});

  @override
  State<PurchaseHistoryOrders> createState() => _PurchaseHistoryOrdersState();
}

class _PurchaseHistoryOrdersState extends State<PurchaseHistoryOrders> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Column(
        children: [
          1.height,
          ListView.builder(
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(top: index == 0 ? 0 : 2.h),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => EstimateServiceItemDetails(
                            estimateDetail: 'Item detail',
                          ));
                    },
                    child: CustomContainer(
                        hpadding: 1.3.w,
                        vpadding: 1.3.w,
                        borderRadius: 20,
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 10.h,
                                  width: 10.h,
                                  margin: EdgeInsets.only(right: 8),
                                  decoration: BoxDecoration(
                                    color: AppColors.midLightGrey,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Image.asset(
                                      AppImages.car_benz,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    0.6.height,
                                    MyText(
                                      text:
                                          "19 20 21 22 ACURA ILX Genuine Headlamp Right 68088868AD",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10.sp,
                                    ),
                                    1.height,
                                    MyText(
                                      text: "Ordered on Nov 13, 2023",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10.sp,
                                      color: AppColors.grey,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 5.0),
                                      child: Align(
                                        alignment: Alignment.bottomRight,
                                        child: Image.asset(
                                          AppImages
                                              .arrow_circle_right, // Replace with your image path
                                          width:
                                              2.2.h, // Adjust width as needed
                                          height:
                                              2.2.h, // Adjust height as needed
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                              ],
                            ),
                            // Align(
                            //   alignment: Alignment.centerRight,
                            //   child:  Image.asset(
                            //     AppImages.arrow_circle_right, // Replace with your image path
                            //     width: 2.2.h, // Adjust width as needed
                            //     height: 2.2.h, // Adjust height as needed
                            //   ),
                            // ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 1.3.w, vertical: 0.5.h),
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(230, 250, 239, 1),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Text(
                                  "Confirmed",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: AppColors.green,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10.sp,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            2.height,
                          ],
                        )),
                  ),
                );
              })
        ],
      ),
    );
  }
}
