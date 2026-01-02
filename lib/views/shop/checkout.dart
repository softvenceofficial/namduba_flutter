import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/create_request/thank_you_order/thank_you_order.dart';
import 'package:nanduba/views/payment/choose_method.dart';

import '../../controllers/sale_car_parts_controller.dart';
import '../../widgets/core/my_text.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  final SaleCarPartsController saleCarPartsController = Get.find<SaleCarPartsController>();

  List<String> cartItems = ["Front Bumper", "Rear Bumper", "Side Mirror", "Car Door"];
  int selectedAddressIndex = 0;

  List<String> addresses = [
    "Davy Nanduba Dn124900\niShop ZAMBIA, Unit E\nKendal House, Victoria Way\nBurgess Hill, West Sussex RH15 9NF\nUnited Kingdom\n1444243935",
    "Another Address, Someplace, City, Country, ZIP Code",
    "Third Address, Someplace Else, City, Country, ZIP Code",
  ];

  void deleteItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  void _showAddressBottomSheet() {
    Get.bottomSheet(
      Container(
        height: 50.h,
        width: Get.width,
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            2.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MyText(
                  text: "Change Address",
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                  decoration: TextDecoration.underline,
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: SvgPicture.asset(
                    AppSvgs.closeCircle,
                    height: 3.h,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            2.height,
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: addresses.length,
                itemBuilder: (context, index) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Radio<int>(
                        value: index,
                        groupValue: selectedAddressIndex,
                        onChanged: (int? value) {
                          setState(() {
                            selectedAddressIndex = value!;
                          });
                          Get.back(); // Close the bottom sheet after selection
                        },
                        activeColor: AppColors.primary,
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top: 11),
                          child: MyText(
                            text: addresses[index],
                            fontSize: 11.5.sp,
                            fontWeight: FontWeight.w400,
                            textAlign: TextAlign.start,
                            color: AppColors.textColor,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 8.sp),
            child: Column(
              children: [
                CustomAppbar(title: "Checkout"),
                2.height,
                // Display List of Cart Items
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),  // Prevents the internal scrolling of the ListView
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(top: index != 0 ? 2.h : 0),
                      child: CustomContainer(
                        hpadding: 8,
                        vpadding: 8,
                        borderRadius: 20,
                        width: Get.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 8.h,
                                    width: 8.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                        image: AssetImage(AppImages.honda),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      MyText(
                                        text: cartItems[index],
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.black,
                                      ),
                                      0.8.height,
                                      MyText(
                                        text: "K295.00",
                                        color: AppColors.primary,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 6.0),
                              child: SizedBox(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Obx(() => MyText(
                                      text: "x${saleCarPartsController.itemCount.value}",
                                      color: AppColors.bottomNav,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w600,
                                    )),
                                    SizedBox(width: 6),
                                    InkWell(
                                      onTap: () {
                                        deleteItem(index);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(6.sp),
                                        decoration: BoxDecoration(
                                          color: AppColors.secondary,
                                          borderRadius: BorderRadius.circular(9),
                                        ),
                                        child: SvgPicture.asset(
                                          AppSvgs.trash,
                                          color: AppColors.primary,
                                          height: 2.4.h,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                2.height,
                // Address Section
                CustomContainer(
                  vpadding: 2.h,
                  hpadding: 4.w,
                  borderRadius: 20,
                  width: Get.width,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyText(
                            text: "Post to",
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.grey,
                          ),
                          InkWell(
                            onTap: _showAddressBottomSheet,
                            child: MyText(
                              text: "Change Address",
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primary,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                      1.height,
                      Align(
                        alignment: Alignment.centerLeft,
                        child: MyText(
                          text: addresses[selectedAddressIndex],
                          fontSize: 11.5.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textColor,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
                2.height,
                // Payment Section
                CustomContainer(
                  vpadding: 2.h,
                  hpadding: 4.w,
                  borderRadius: 20,
                  width: Get.width,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: MyText(
                          text: "Pay with",
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.grey,
                        ),
                      ),
                      1.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 1.8.h, horizontal: .7.h),
                                  decoration: BoxDecoration(
                                    color: AppColors.secondary,
                                    borderRadius: BorderRadius.circular(9),
                                  ),
                                  child: SvgPicture.asset(
                                    AppSvgs.visa,
                                    color: AppColors.primary,
                                    height: 1.3.h,
                                  ),
                                ),
                                SizedBox(width: 5),
                                MyText(
                                  text: "********0822",
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.black,
                                )
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              Get.to(ChooseMethods());
                            },
                            child: MyText(
                              text: "Change",
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primary,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                2.height,
                // Pricing Section
                CustomContainer(
                  vpadding: 2.h,
                  hpadding: 4.w,
                  borderRadius: 20,
                  width: Get.width,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      0.2.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          MyText(
                            text: "Subtotal",
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.midDarkGrey,
                          ),
                          MyText(
                            text: "\$1,900.0",
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black,
                          ),
                        ],
                      ),
                      2.height,
                      Divider(
                        height: 1,
                        thickness: 1,
                        color: AppColors.border,
                      ),
                      2.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          MyText(
                            text: "Shipping",
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.midDarkGrey,
                          ),
                          MyText(
                            text: "\$45.00",
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black,
                          ),
                        ],
                      ),
                      2.height,
                      Divider(
                        height: 1,
                        thickness: 1,
                        color: AppColors.border,
                      ),
                      2.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          MyText(
                            text: "Total",
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.midDarkGrey,
                          ),
                          MyText(
                            text: "\$1,945.00",
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primary,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                4.height,
                // Place Order Button
                InkWell(
                  onTap: () => Get.to(() => ThankYouOrder()),
                  child: CustomContainer(
                    borderRadius: 30,
                    vpadding: 1.6.h,
                    hpadding: 2.5.h,
                    color: AppColors.primary,
                    child: Center(
                      child: MyText(
                        text: "Confirm and pay",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
                2.height,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
