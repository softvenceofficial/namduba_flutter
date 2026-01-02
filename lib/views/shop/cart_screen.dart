import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/shop/checkout.dart';

import '../../controllers/sale_car_parts_controller.dart';
import '../../widgets/core/my_text.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> with TickerProviderStateMixin {
  final SaleCarPartsController saleCarPartsController = Get.find<SaleCarPartsController>();

  // List of AnimationControllers and Animations
  late List<AnimationController> _controllers;
  late List<Animation<Offset>> _offsetAnimations;

  // List to manage cart items
  List<String> cartItems = ["Front Bumper", "Rear Bumper", "Side Mirror", "Car Door"];

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(cartItems.length,
            (index) => AnimationController(vsync: this, duration: Duration(milliseconds: 300)));
    _offsetAnimations = _controllers.map((controller) =>
        Tween<Offset>(begin: Offset.zero, end: Offset(-0.2, 0)).animate(controller)).toList();
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void deleteItem(int index) {
    setState(() {
      cartItems.removeAt(index);
      _controllers.removeAt(index).dispose();
      _offsetAnimations.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.0.w, vertical: 2.h),
          child: Column(
            children: [
              CustomAppbar(title: "Cart"),
              2.height,
              Expanded(
                child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(top: index != 0 ? 2.h : 0),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(22),
                              ),
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: GestureDetector(
                                onTap: () => deleteItem(index),
                                child: SvgPicture.asset(AppSvgs.trash, color: Colors.white, height: 3.h,),
                              ),
                            ),
                          ),
                          SlideTransition(
                            position: _offsetAnimations[index],
                            child: GestureDetector(
                              onHorizontalDragUpdate: (details) {
                                if (details.primaryDelta! < -4) {
                                  _controllers[index].forward();
                                } else if (details.primaryDelta! > 4) {
                                  _controllers[index].reverse();
                                }
                              },
                              child: CustomContainer(
                                hpadding: 8,
                                vpadding: 7,
                                borderRadius: 20,
                                width: Get.width,
                                child: Row(
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
                                    SizedBox(width: 14),
                                    Expanded(
                                      child: Column(
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
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              MyText(
                                                text: "K110.00",
                                                color: AppColors.primary,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(right: 5.0),
                                                child: SizedBox(
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          saleCarPartsController.decrementItem();
                                                        },
                                                        child: Container(
                                                          padding: EdgeInsets.all(4.sp),
                                                          decoration: BoxDecoration(
                                                            color: AppColors.secondary,
                                                            borderRadius: BorderRadius.circular(9),
                                                          ),
                                                          child: Icon(
                                                            CupertinoIcons.minus,
                                                            size: 14,
                                                            color: AppColors.bottomNav,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 10),
                                                      Obx(
                                                            () => MyText(
                                                          text: saleCarPartsController.itemCount.value.toString(),
                                                          color: AppColors.black,
                                                          fontSize: 13.sp,
                                                          fontWeight: FontWeight.w600,
                                                        ),
                                                      ),
                                                      SizedBox(width: 10),
                                                      InkWell(
                                                        onTap: () {
                                                          saleCarPartsController.incrementItem();
                                                        },
                                                        child: Container(
                                                          padding: EdgeInsets.all(4.sp),
                                                          decoration: BoxDecoration(
                                                            color: AppColors.secondary,
                                                            borderRadius: BorderRadius.circular(9),
                                                          ),
                                                          child: Icon(
                                                            CupertinoIcons.plus,
                                                            size: 14,
                                                            color: AppColors.bottomNav,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
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
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 8.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  text: "Total Amount",
                  color: AppColors.grey,
                  fontSize: 7.6.sp,
                  fontWeight: FontWeight.w600,
                ),
                MyText(
                  text: "K" + "295.00",
                  color: AppColors.primary,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            GestureDetector(
              onTap: (){
                Get.off(Checkout());
              },
              child: Container(
                height: 5.4.h,
                // width: 40.w,
                padding: EdgeInsets.all(2.w),
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(30)
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MyText(
                      text: "  Checkout",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                    SizedBox(width: 16,),
                    Container(
                      height: 3.6.h,
                      width: 3.6.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle
                      ),
                      alignment: Alignment.center,
                      child: MyText(
                        text: "3",
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primary,
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
  }
}

