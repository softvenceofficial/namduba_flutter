import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanduba/controllers/seller_shop_info_controller.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/leave_feedback/feedback_screen.dart';
import 'package:nanduba/views/shop/shop_details.dart';

import '../../widgets/core/my_text.dart';
import '../feedback/feedback_open_page.dart';

class SellerShopInfo extends StatefulWidget {
  const SellerShopInfo({super.key});

  @override
  State<SellerShopInfo> createState() => _SellerShopInfoState();
}

class _SellerShopInfoState extends State<SellerShopInfo> {
  final SellerShopInfoController shopController =
      Get.put(SellerShopInfoController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
            child: Column(
              children: [
                myAppBar(
                  title: "Shop",
                  icon: AppSvgs.cart,
                  iconColor: AppColors.midGrey,
                  noCon: true,
                ),
                2.height,
                CustomContainer(
                  hpadding: 4.w,
                  vpadding: 2.3.h,
                  isBorder: true,
                  borderRadius: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 10.w,
                        backgroundColor: AppColors.black,
                        backgroundImage: AssetImage(AppImages.honda),
                      ),
                      2.width,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            text: "John Trial",
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                          1.height,
                          MyText(
                            text: "Auto Shop, Parts",
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.grey,
                          ),
                          1.height,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                AppSvgs.location,
                                color: AppColors.primary,
                                height: 2.h,
                              ),
                              1.width,
                              SizedBox(
                                width: 25.w,
                                child: MyText(
                                  text: "Seattle, Washington, USA",
                                  fontSize: 10.sp,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.midDarkGrey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      CustomButton(
                          labelFontSize: 9.sp,
                          height: 5.h,
                          width: 30.w,
                          label: 'Send Request',
                          onPressed: () {
                            Get.to(() => ComplianceScreen(
                                  showForIndex: 0,
                                  sheet: true,
                                  showForTitle:
                                      AppText.motorVehicleRegistration,
                                ));
                          })
                    ],
                  ),
                ),
                2.height,
                TabBar(
                  labelColor: AppColors.primary,
                  unselectedLabelColor: AppColors.black,
                  indicatorColor: AppColors.primary,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: [
                    Tab(text: 'Shop'),
                    Tab(text: 'About'),
                    Tab(text: 'Feedback'),
                  ],
                ),
                2.height,
                Expanded(
                  child: TabBarView(
                    children: [
                      _shop(),
                      _about(),
                      _feedback(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _shop() {
    return Column(
      children: [
        2.height,
        CustomTextField(
          name: 'search',
          enableBorder: AppColors.kEnableBorderGrey,
          prefixIcon: SvgPicture.asset(
            AppSvgs.searchIcon,
            fit: BoxFit.scaleDown,
          ),
          controller: shopController.searchController,
          hintText: AppText.search,
          showShadow: true,
          onEditComplete: () {
            FocusScope.of(context).unfocus();
          },
        ),
        2.height,
        Align(
          alignment: Alignment.centerLeft,
          child: Obx(() => MyText(
                text: 'Featured items (${shopController.filteredCars.length})',
                color: AppColors.black,
                fontWeight: FontWeight.w600,
                fontSize: 15.sp,
              )),
        ),
        1.height,
        Expanded(
          child: Obx(() => GridView.builder(
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 3.w,
                  childAspectRatio: 2 / 3,
                ),
                itemCount: shopController.filteredCars.length,
                itemBuilder: (context, index) {
                  var car = shopController.filteredCars[index];
                  return GestureDetector(
                    onTap: () {
                      // Navigate to car details
                      Get.to(() => ShopDetail());
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: index > 0 ? 0.w : 0.w),
                      child: CustomProductContainer(
                        image: car["image"],
                        title: car["name"],
                        price: car["info"],
                        rating: '',
                      ),
                    ),
                  );
                },
              )),
        ),
      ],
    );
  }

  Widget _about() {
    return Column(
      children: [
        SizedBox(height: 2.h),
        Align(
          alignment: Alignment.centerLeft,
          child: MyText(
            text: 'About us',
            color: AppColors.black,
            fontWeight: FontWeight.w600,
            fontSize: 15.sp,
          ),
        ),
        SizedBox(height: 2.h),
        Expanded(
          child: CustomContainer(
            vpadding: 2.h,
            hpadding: 3.w,
            child: SingleChildScrollView(
              child: TextFormField(
                readOnly: true,
                maxLines: null,
                minLines: 1,
                initialValue:
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. \n Lorem Ipsum is simply dummy text of the printing and typesetting industry. \n Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w400,
                )),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 2.h, // Adjust vertical padding as needed
                    horizontal: 3.w, // Adjust horizontal padding as needed
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _feedback() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: 8,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(top: index == 0 ? 0 : 2.h),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(FeedbackOpenPage(
                        name: 'Martin Oedegaard',
                        type: 'Feedback',
                      ));
                    },
                    child: CustomContainer(
                        hpadding: 4.w,
                        vpadding: 2.h,
                        borderRadius: 22,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 3.h,
                                        backgroundColor: AppColors.primary,
                                        backgroundImage:
                                            AssetImage(AppImages.honda),
                                      ),
                                      2.width,
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          MyText(
                                            text: "Martin Odegaard",
                                            color: AppColors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          0.5.height,
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                size: 15,
                                                color: AppColors.yellow,
                                              ),
                                              Icon(
                                                Icons.star,
                                                size: 15,
                                                color: AppColors.yellow,
                                              ),
                                              Icon(
                                                Icons.star,
                                                size: 15,
                                                color: AppColors.yellow,
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 6.0),
                                  child: MyText(
                                    text: "2 days ago",
                                    color: AppColors.midDarkGrey,
                                    fontSize: 8.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            2.height,
                            Align(
                              alignment: Alignment.centerLeft,
                              child: MyText(
                                text:
                                    "It was a very nice service. Lorem Ipsum dummy text of the printing and typesetting industry.",
                                color: AppColors.grey,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        )),
                  ),
                );
              }),
        )
      ],
    );
  }
}
