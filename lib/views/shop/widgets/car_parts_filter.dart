import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanduba/constants/colors.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/widgets/core/filter_checks.dart';
import 'package:nanduba/widgets/core/my_text.dart';

import '../../../controllers/sale_car_parts_controller.dart';

class CarPartsFilter extends StatelessWidget {
  const CarPartsFilter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SaleCarPartsController saleCarPartsController =
        Get.find<SaleCarPartsController>();

    List<String> filters = [
      "All",
      "Brakes",
      "Tires",
      "WindScreen",
      'Engine',
      "Body Parts",
      'Suspension',
      'Steering',
      'Cooling'
    ];

    List<String> brands = [
      "Audi",
      "Honda",
      "BMW",
      "Mercedes",
      'Bugatti',
      "McLaren",
    ];

    return Container(
      height: 70.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            2.5.height,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                    text: "Filters",
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      CupertinoIcons.xmark_circle,
                      color: AppColors.primary,
                      size: 25,
                    ),
                  ),
                ],
              ),
            ),
            2.height,
            Divider(
              thickness: 1,
              color: AppColors.border,
              height: 1,
            ),
            2.height,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0.w),
              child: CustomTextField(
                name: "Search products...",
                hintText: "Search products...",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                  color: AppColors.verylightGreen,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                )),
                prefixIcon: Padding(
                  padding: EdgeInsets.all(3.sp),
                  child: SvgPicture.asset(
                    AppSvgs.searchIcon,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                hintStyle: GoogleFonts.poppins(
                    textStyle: TextStyle(
                  color: AppColors.verylightGreen,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                )),
              ),
            ),
            2.height,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0.w),
              child: CustomDropdown(
                name: "Select Vehicle",
                hintText: "Select Vehicle",
                hintStyle: GoogleFonts.poppins(
                    textStyle: TextStyle(
                  color: AppColors.verylightGreen,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                )),
                items: [
                  DropdownMenuItem(
                    child: Text("asdasd"),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text("asdasd"),
                    value: 2,
                  ),
                  DropdownMenuItem(
                    child: Text("asdasd"),
                    value: 3,
                  ),
                ],
              ),
            ),
            3.height,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0.w),
              child: Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                  text: "Filter by categories",
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                ),
              ),
            ),
            1.height,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 1.w,
                  childAspectRatio: 2.9,
                ),
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      //AppCustomNavigator.push(context,  RentCars(car: rentCarProvider.carDetails.first,));
                    },
                    child: FilterChecks(
                      title: filters[index],
                    ),
                  );
                },
              ),
            ),
            2.height,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0.w),
              child: Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                  text: "Filter by Brands",
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                ),
              ),
            ),
            1.height,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 1.w,
                  childAspectRatio: 2.9,
                ),
                itemCount: brands.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      //AppCustomNavigator.push(context,  RentCars(car: rentCarProvider.carDetails.first,));
                    },
                    child: FilterChecks(
                      title: brands[index],
                    ),
                  );
                },
              ),
            ),
            2.height,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0.w),
              child: Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                  text: "Filter by Price",
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                ),
              ),
            ),
            1.height,
            Obx(
              () => Slider.adaptive(
                min: 10,
                max: 1000,
                thumbColor: AppColors.primary,
                activeColor: AppColors.primary,
                value: saleCarPartsController.expense.toDouble(),
                onChanged: (value) {
                  saleCarPartsController.expense.value = value.toInt();
                },
              ),
            ),
            Obx(
              () => Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0.w),
                child: Align(
                  alignment: Alignment.topRight,
                  child: MyText(
                    text: "k10-${saleCarPartsController.expense.value}",
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ),
            2.height,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomButton(
                    label: 'Apply',
                    labelFontSize: 14.sp,
                    labelFontWeight: FontWeight.w600,
                    borderRadius: 30,
                    width: 44.w,
                    height: 6.6.h,
                    backgroundColor: AppColors.primary,
                    onPressed: () {},
                  ),
                  CustomButton(
                    label: 'Clear',
                    labelFontSize: 14.sp,
                    foregroundColor: AppColors.primary,
                    labelFontWeight: FontWeight.w600,
                    borderRadius: 30,
                    width: 44.w,
                    height: 6.6.h,
                    backgroundColor: AppColors.white,
                    borderColor: AppColors.primary,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            2.height
          ],
        ),
      ),
    );
  }
}
