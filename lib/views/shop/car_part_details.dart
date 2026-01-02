import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanduba/controllers/sale_car_parts_controller.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/feedback/feedback_page.dart';
import 'package:nanduba/views/inbox/chat_screen/chat_screen.dart';
import 'package:nanduba/views/shop/seller_shop_info.dart';
import 'package:nanduba/views/shop/widgets/addTo_cart_bottom.dart';
import 'package:nanduba/views/shop/widgets/image_swiper.dart';
import 'package:nanduba/widgets/core/my_text.dart';

class CarPartDetails extends StatefulWidget {
  const CarPartDetails({super.key});

  @override
  State<CarPartDetails> createState() => _CarPartDetailsState();
}

class _CarPartDetailsState extends State<CarPartDetails> {
  final SaleCarPartsController partVM = Get.find<SaleCarPartsController>();

  int imageSlide = 0;
  int currentSlide = 0;
  bool _switchValue = false;

  Widget getTabSvg(int slide) {
    switch (slide) {
      case 0:
      case 1:
      case 2:
        return Image.asset(AppImages.front_bumper,
            width: 200.0); // Ensure 'imageKey' is the correct key
      default:
        return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          child: Column(
            children: [
              myAppBar(
                title: "Front Bumper",
                icon: AppSvgs.message,
                onTogglePressed: () {
                  Get.to(() => ChatScreenMain());
                },
              ),
              2.height,
              CustomContainer(
                  hpadding: 4.w,
                  vpadding: 2.h,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            CupertinoIcons.check_mark_circled_solid,
                            size: 20,
                            color: AppColors.green,
                          ),
                          2.width,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText(
                                text: "Fits your 2021 BMW X3",
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.black,
                              ),
                              Obx(
                                () => partVM.readMore.value == true
                                    ? SizedBox(
                                        width: 70.w,
                                        child: MyText(
                                          text:
                                              "Position on vehicle: Rear Axle, Important Fit Position on vehicle: Rear Axle, Important Fit ",
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.black,
                                        ),
                                      )
                                    : SizedBox(
                                        width: 70.w,
                                        child: MyText(
                                          text:
                                              "Position on vehicle: Rear Axle, Important Fit ",
                                          fontSize: 11.sp,
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.black,
                                        ),
                                      ),
                              ),
                              2.height,
                              GestureDetector(
                                onTap: () {
                                  partVM.readMore.value =
                                      !partVM.readMore.value;
                                },
                                child: Obx(
                                  () => MyText(
                                    text: partVM.readMore.value == true
                                        ? "Read less"
                                        : "Read more",
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.underline,
                                    color: AppColors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  )),
              2.height,
              Stack(
                children: [
                  CustomContainer(
                    vpadding: 1.h,
                    borderRadius: 20,
                    child: SwipeableImage(
                      itemCount: 3,
                      currentSlide: imageSlide,
                      onChange: (value) {
                        setState(() {
                          imageSlide = value;
                        });
                      },
                      closeGesture: () {},
                      buttonOnpressed: () {},
                      tabSvg: getTabSvg(imageSlide),
                      isIndicator: false,
                      child: Positioned(
                          right: 2, left: 2, top: 0, child: SizedBox()),
                    ),
                  ),
                  Positioned(
                    right: 12,
                    left: 12,
                    top: 12,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 0.5.h,
                            horizontal: 2.w,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.yellow,
                            borderRadius: BorderRadius.circular(20.sp),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.star_rounded,
                                color: AppColors.white,
                                size: 5.w,
                              ),
                              SizedBox(width: 1.w),
                              Text(
                                "4.0",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.w800,
                                      color: AppColors.white,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        const FavSliderIcon(),
                      ],
                    ),
                  ),
                ],
              ),
              2.height,
              CustomContainer(
                  hpadding: 4.w,
                  vpadding: 2.h,
                  borderRadius: 20,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: MyText(
                          text: "Front Bumper",
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black,
                        ),
                      ),
                      1.height,
                      Align(
                        alignment: Alignment.centerLeft,
                        child: MyText(
                          text:
                              "One disadvantage of Lorem Ipsum is that in Latin certain letters appear more frequently than others which creates a distinct visual impression.",
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.midGrey,
                        ),
                      ),
                    ],
                  )),
              2.height,
              GestureDetector(
                onTap: () {
                  Get.to(SellerShopInfo());
                },
                child: CustomContainer(
                    hpadding: 4.w,
                    vpadding: 2.h,
                    borderRadius: 20,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: MyText(
                            text: "Seller Info",
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                        ),
                        1.height,
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 7.8.w,
                              backgroundColor: AppColors.black,
                              backgroundImage: AssetImage(AppImages.honda),
                            ),
                            2.width,
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText(
                                  text: "Shop Name Here",
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.black,
                                ),
                                1.height,
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 0.5.h,
                                    horizontal: 2.w,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.yellow,
                                    borderRadius: BorderRadius.circular(20.sp),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.star_rounded,
                                        color: AppColors.white,
                                        size: 3.5.w,
                                      ),
                                      SizedBox(width: 1.w),
                                      Text(
                                        "4.0",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              fontSize: 7.5.sp,
                                              fontWeight: FontWeight.w800,
                                              color: AppColors.white,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        2.height,
                        CustomButton(
                          label: "Contact Seller",
                          onPressed: () {
                            Get.to(ChatScreenMain());
                          },
                          foregroundColor: AppColors.primary,
                          backgroundColor: Colors.white,
                        )
                      ],
                    )),
              ),
              2.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyText(
                    text: "Reviews (120)",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(FeedbackPage());
                    },
                    child: MyText(
                      text: "See all",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.midDarkGrey,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
              2.height,
              SwipeableContainer(
                itemCount: 3,
                currentSlide: currentSlide,
                onChange: (value) {
                  setState(() {
                    currentSlide = value;
                  });
                },
                closeGesture: () {},
                buttonOnpressed: () {},
              )
              // CustomContainer(
              //     hpadding: 3.w,
              //     vpadding: 1.h,
              //     child: Column(
              //       children: [
              //         Row(
              //           children: [
              //             CircleAvatar(
              //               radius: 8.w,
              //               backgroundColor: AppColors.black,
              //               backgroundImage: AssetImage(AppImages.honda),
              //             ),
              //             2.width,
              //             Column(
              //               mainAxisAlignment: MainAxisAlignment.start,
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 MyText(
              //                   text: "John Doe",
              //                   fontSize: 12.sp,
              //                   fontWeight: FontWeight.w600,
              //                   color: AppColors.black,
              //                 ),
              //                 0.5.height,
              //                 SizedBox(
              //                   child: Row(
              //                     mainAxisSize: MainAxisSize.min,
              //                     children: [
              //                       Icon(
              //                         Icons.star_rounded,
              //                         color: AppColors.yellow,
              //                         size: 6.5.w,
              //                       ),
              //                       Icon(
              //                         Icons.star_rounded,
              //                         color: AppColors.yellow,
              //                         size: 6.5.w,
              //                       ),
              //                       Icon(
              //                         Icons.star_rounded,
              //                         color: AppColors.yellow,
              //                         size: 6.5.w,
              //                       ),
              //                       Icon(
              //                         Icons.star_rounded,
              //                         color: AppColors.yellow,
              //                         size: 6.5.w,
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ],
              //         ),
              //         1.height,
              //         Align(
              //           alignment: Alignment.centerLeft,
              //           child: MyText(
              //             text: "One disadvantage of Lorem Ipsum is that in Latin certain letters appear more frequently than others which creates a distinct visual impression.",
              //             fontSize: 10.sp,
              //             fontWeight: FontWeight.w400,
              //             color: AppColors.midGrey,
              //           ),
              //         ),
              //
              //
              //       ],
              //     )
              // ),
            ],
          ),
        ),
      )),
      bottomNavigationBar: AddtoCartBottom(),
    );
  }
}
