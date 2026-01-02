import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/shop/cart_screen.dart';

import '../../../controllers/sale_car_parts_controller.dart';
import '../../../widgets/core/my_text.dart';

class AddtoCartBottom extends StatelessWidget {
  const AddtoCartBottom({super.key});

  @override
  Widget build(BuildContext context) {

    final SaleCarPartsController saleCarPartsController = Get.find<SaleCarPartsController>();

    return  Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 8.sp),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyText(
            text:  "K 295.00",
            color: AppColors.primary,
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
          ),
          Container(
            height: 6.h,
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
            margin: EdgeInsets.only(right: 25),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: AppColors.border
              ),
              borderRadius: BorderRadius.circular(30)
            ),
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: (){
                    saleCarPartsController.decrementItem();
                  },
                    child: Icon(CupertinoIcons.minus, size: 20, color: AppColors.bottomNav,)
                ),
                SizedBox(width: 23,),
                Obx(
                    ()=> MyText(
                    text:  saleCarPartsController.itemCount.value.toString(),
                    color: AppColors.black,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 23,),
                InkWell(
                  onTap: (){
                    saleCarPartsController.incrementItem();
                  },
                    child: Icon(CupertinoIcons.plus, size: 20, color: AppColors.bottomNav,)),
              ],
            ),
          ),
          InkWell(
            onTap: (){
              Get.off(CartScreen());
            },
            child: Container(
              height: 6.h,
              width: 6.h,
              decoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: SvgPicture.asset(AppSvgs.cart, color: Colors.white, height: 2.4.h,),
            ),
          )
        ],
      ),
    );
  }
}
