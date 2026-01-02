import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/inbox/chat_list/chat_list.dart';
import 'package:nanduba/views/inbox/chat_screen/chat_screen.dart';
import 'package:nanduba/views/shop/about_vehicle_detail.dart';
import 'package:nanduba/views/shop/checkout.dart';
import 'package:nanduba/views/shop/seller_shop_info.dart';
import 'package:nanduba/views/shop/widgets/image_swiper.dart';

class ShopDetail extends StatefulWidget {
  const ShopDetail({super.key});

  @override
  State<ShopDetail> createState() => _ShopDetailState();
}

class _ShopDetailState extends State<ShopDetail> {
  final ScrollController _scrollController = ScrollController();
  bool _isCarVisible = true;
  int currentSlide = 0;
  int selectedButtonIndex = 0;
  bool? isSelected;
  bool _isPersonalizeVisible =
      false; // New state variable for container visibility

  Widget getTabSvg(int slide) {
    switch (slide) {
      case 0:
      case 1:
      case 2:
        return SvgPicture.asset(AppSvgs.car, width: 100.0);
      default:
        return const SizedBox();
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (_isCarVisible) {
          setState(() {
            _isCarVisible = false;
          });
        }
      } else if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (!_isCarVisible) {
          setState(() {
            _isCarVisible = true;
          });
        }
      }
    });
  }
  // void _togglePersonalizeVisibility() {
  //   setState(() {
  //     _isPersonalizeVisible = !_isPersonalizeVisible;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          child: Column(
            children: [
              CustomAppbar(
                title: "Audi A1 Sportback",
              ),
              2.height,
              CustomContainer(
                // vpadding: 1.h,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        SwipeableImage(
                          itemCount: 3,
                          currentSlide: currentSlide,
                          onChange: (value) {
                            setState(() {
                              currentSlide = value;
                            });
                          },
                          closeGesture: () {},
                          buttonOnpressed: () {},
                          tabSvg: getTabSvg(currentSlide),
                          isIndicator: false,
                        ),
                        Positioned(
                          right: 12,
                          left: 12,
                          top: 12,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 1,
                              ),
                              const FavSliderIcon(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.sp),
                      child: Column(
                        children: [
                          if (_isCarVisible) ...{
                            Text(
                              "Audi A1 Sportback Hatchback",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w800,
                                  ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            1.height,
                            Text(
                              "173,025 Km",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w800,
                                  ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            1.height,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  AppSvgs.location,
                                  fit: BoxFit.scaleDown,
                                  width: 5.w,
                                ),
                                SizedBox(width: 1.w),
                                Text(
                                  "Seattle, Washington, USA",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        fontSize: 10.sp,
                                      ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            2.height,

                            // 1.height,
                            // Row(
                            //   children: [
                            //     Expanded(
                            //       child: Text(
                            //         "One disadvantage of Lorem Ipsum is that in Latin certain letters appear more frequently than others which creates a distinct visual impression.",
                            //         style: Theme.of(context)
                            //             .textTheme
                            //             .bodySmall
                            //             ?.copyWith(),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: CustomButton(
                                    borderColor: AppColors.transparent,
                                    label: "Cash",
                                    labelFontSize: 9.sp,
                                    onPressed: () {
                                      setState(() {
                                        selectedButtonIndex = 0;
                                      });
                                    },
                                    height: 5.h,
                                    backgroundColor: selectedButtonIndex == 0
                                        ? AppColors.primary
                                        : AppColors.lightGrey,
                                    foregroundColor: selectedButtonIndex == 0
                                        ? AppColors.white
                                        : AppColors.grey,
                                  ),
                                ),
                                2.width,
                                Expanded(
                                  child: CustomButton(
                                    borderColor: AppColors.transparent,
                                    label: "Finance",
                                    labelFontSize: 9.sp,
                                    onPressed: () {
                                      setState(() {
                                        selectedButtonIndex = 1;
                                      });
                                    },
                                    height: 5.h,
                                    backgroundColor: selectedButtonIndex == 1
                                        ? AppColors.primary
                                        : AppColors.lightGrey,
                                    foregroundColor: selectedButtonIndex == 1
                                        ? AppColors.white
                                        : AppColors.grey,
                                  ),
                                ),
                              ],
                            ),
                          },
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      2.height,
                      // // Row(
                      // //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // //   children: [
                      // //     Text(
                      // //       "Details",
                      // //       style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      // //             fontWeight: FontWeight.w700,
                      // //           ),
                      // //     ),
                      // //     Row(
                      // //       children: [
                      // //         Text(
                      // //           "Hide",
                      // //           style: Theme.of(context)
                      // //               .textTheme
                      // //               .bodyMedium
                      // //               ?.copyWith(),
                      // //         ),
                      // //         CupertinoSwitch(
                      // //           activeColor: AppColors.primary,
                      // //           value: _switchValue,
                      // //           onChanged: (value) {
                      // //             setState(() {
                      // //               _switchValue = value;
                      // //             });
                      // //           },
                      // //         ),
                      // //       ],
                      // //     )
                      // //   ],
                      // // ),
                      // 2.height,
                      // if (_switchValue)
                      if (selectedButtonIndex == 1) ...{
                        CustomContainer(
                            child: Padding(
                          padding: EdgeInsets.all(8.sp),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Text(
                              //   "Financing",
                              //   style:
                              //       Theme.of(context).textTheme.bodyLarge?.copyWith(
                              //             fontWeight: FontWeight.w700,
                              //           ),
                              // ),
                              // Text(
                              //   "Est. Monthly Payment",
                              //   style:
                              //       Theme.of(context).textTheme.bodyLarge?.copyWith(),
                              // ),
                              // Row(
                              //   children: [
                              //     Text(
                              //       "K 6,461",
                              //       style: Theme.of(context)
                              //           .textTheme
                              //           .bodyLarge
                              //           ?.copyWith(
                              //               fontWeight: FontWeight.w700,
                              //               fontSize: 16.sp),
                              //     ),
                              //     SizedBox(width: 2.w),
                              //     Text(
                              //       "12 mo. term/K 20k down",
                              //       style: Theme.of(context)
                              //           .textTheme
                              //           .bodyMedium
                              //           ?.copyWith(),
                              //     ),
                              //   ],
                              // ),
                              // 3.height,
                              // SizedBox(height: 2.h),
                              if (!_isPersonalizeVisible)
                                CustomButton(
                                  borderColor: isSelected == null
                                      ? AppColors.lightGrey
                                      : isSelected!
                                          ? AppColors.primary
                                          : AppColors.lightGrey,
                                  backgroundColor: Colors.transparent,
                                  foregroundColor: AppColors.primary,
                                  labelFontSize: 12.sp,
                                  label:
                                      "${AppText.personalizeInstallment} >\t\t\t\t\tK 6,461/mo",
                                  onPressed: () {
                                    setState(() {
                                      isSelected = true;
                                      _isPersonalizeVisible =
                                          !_isPersonalizeVisible;
                                    });
                                  },
                                ),
                              if (_isPersonalizeVisible)
                                CustomContainer(
                                  blurRadius: 0,
                                  child: Padding(
                                    padding: EdgeInsets.all(8.sp),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  isSelected = null;
                                                  _isPersonalizeVisible =
                                                      !_isPersonalizeVisible;
                                                });
                                              },
                                              icon: const Icon(
                                                  Icons.cancel_outlined,
                                                  color: AppColors.primary),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "Car Price",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                color: AppColors.grey,
                                              ),
                                        ),
                                        const CustomTextField(
                                            name: "Car Price",
                                            hintText: "K 6461"),
                                        SizedBox(height: 1.h),
                                        Text(
                                          "Down Payment",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                color: AppColors.grey,
                                              ),
                                        ),
                                        const CustomTextField(
                                            name: "Down Payment",
                                            hintText: "k20"),
                                        SizedBox(height: 1.h),
                                        Text(
                                          "Term",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                color: AppColors.grey,
                                              ),
                                        ),
                                        const CustomTextField(
                                            name: "Term",
                                            hintText: "12 Months",
                                            suffixIcon:
                                                Icon(Icons.arrow_drop_down)),
                                        SizedBox(height: 1.h),
                                        Text(
                                          "Interest Rate",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                color: AppColors.grey,
                                              ),
                                        ),
                                        const CustomTextField(
                                            name: "Interest Rate",
                                            hintText: "10%"),
                                        SizedBox(height: 1.h),
                                        Text(
                                          "Fees",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                color: AppColors.grey,
                                              ),
                                        ),
                                        const CustomTextField(
                                            name: "Fees", hintText: "\$1000"),
                                        SizedBox(height: 1.h),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Est. Monthly Payment",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall
                                                  ?.copyWith(
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                            ),
                                            SizedBox(width: 2.w),
                                            Text(
                                              "\$295.00",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.copyWith(
                                                    fontWeight: FontWeight.w700,
                                                    color: AppColors.primary,
                                                    fontSize: 13.sp,
                                                  ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 2.h),
                                        CustomButton(
                                            label: "Apply Now",
                                            onPressed: () {}),
                                      ],
                                    ),
                                  ),
                                ),
                              SizedBox(height: 2.h),
                              CustomButton(
                                borderColor: isSelected == null
                                    ? AppColors.lightGrey
                                    : !isSelected!
                                        ? AppColors.primary
                                        : AppColors.lightGrey,
                                backgroundColor: Colors.transparent,
                                foregroundColor: AppColors.primary,
                                label: "Compare Finance deals",
                                onPressed: () {
                                  setState(() {
                                    _isPersonalizeVisible = false;
                                    isSelected = false;
                                    _compareFinanceBottomSheet(context);
                                  });
                                },
                              ),
                            ],
                          ),
                        )),
                        2.height,
                      },
                      GestureDetector(
                        onTap: () {
                          Get.to(() => AboutVehicleDetail());
                        },
                        child: CustomContainer(
                          child: Padding(
                            padding: EdgeInsets.all(8.sp),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "About vehicle",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        fontWeight: FontWeight.w800,
                                      ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "See full details",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(color: AppColors.primary),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: AppColors.primary,
                                      size: 1.5.h,
                                    ),
                                  ],
                                ),
                                3.height,
                                Text(
                                  'Seller\'s notes',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.w800,
                                      ),
                                ),
                                1.5.height,
                                Text(
                                  'RUNS AND DRIVEN GREAT NO ISSUES AT ALL GREAT',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      2.height,
                      CustomContainer(
                        child: Padding(
                          padding: EdgeInsets.all(8.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Vehicle Specs",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.w800,
                                    ),
                              ),
                              1.height,
                              _buildRow("Year", "2022"),
                              1.height,
                              _buildRow("Make", "Audi"),
                              1.height,
                              _buildRow("Model", "Q7"),
                              1.height,
                              _buildRow("Mileage", "49000"),
                              1.height,
                              _buildRow("VIN", "BAC, 1412"),
                              1.height,
                              _buildRow("Interior Color", "Brown"),
                              1.height,
                              _buildRow("For Sale By", "Dealer"),
                              1.height,
                              _buildRow("Number of Cylinders", "6"),
                              1.height,
                              _buildRow("Exterior Color", "Silver"),
                              1.height,
                              _buildRow("Fuel Type", "Petrol"),
                              1.height,
                              _buildRow("Drive Type", "AWD", isdivider: false),

                              // Row(
                              //   mainAxisAlignment:
                              //       MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     Text(
                              //       "Year",
                              //       style: Theme.of(context)
                              //           .textTheme
                              //           .bodyMedium
                              //           ?.copyWith(),
                              //     ),
                              //     Text(
                              //       "2022",
                              //       style: Theme.of(context)
                              //           .textTheme
                              //           .bodyMedium
                              //           ?.copyWith(
                              //             fontWeight: FontWeight.w700,
                              //           ),
                              //     ),
                              //   ],
                              // ),
                              // 1.height,
                              // Row(
                              //   mainAxisAlignment:
                              //       MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     Text(
                              //       "Make",
                              //       style: Theme.of(context)
                              //           .textTheme
                              //           .bodyMedium
                              //           ?.copyWith(),
                              //     ),
                              //     Text(
                              //       "Audi",
                              //       style: Theme.of(context)
                              //           .textTheme
                              //           .bodyMedium
                              //           ?.copyWith(
                              //             fontWeight: FontWeight.w700,
                              //           ),
                              //     ),
                              //   ],
                              // ),
                              // 1.height,
                            ],
                          ),
                        ),
                      ),
                      2.height,
                      CustomContainer(
                        child: Padding(
                          padding: EdgeInsets.all(8.sp),
                          child: GestureDetector(
                            onTap: () {
                              Get.to(() => SellerShopInfo());
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "About Seller",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        fontWeight: FontWeight.w800,
                                      ),
                                ),
                                1.height,
                                Text(
                                  "John Trial",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.w800,
                                      ),
                                ),
                                1.height,
                                Row(
                                  children: [
                                    Icon(
                                      CupertinoIcons.location,
                                      color: AppColors.primary,
                                      size: 4.w,
                                    ),
                                    SizedBox(width: 2.w),
                                    Expanded(
                                      child: Text(
                                        "Seattle, Washington, USA",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                              fontSize: 10.sp,
                                            ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                                1.height,
                                CustomButton(
                                  backgroundColor: Colors.transparent,
                                  foregroundColor: AppColors.primary,
                                  label: "Message dealer",
                                  onPressed: () {
                                    Get.to(() => ChatScreenMain());
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      2.height,
                      CustomContainer(
                        vpadding: 1.h,
                        hpadding: 2.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _buildRow('Item number', '38621534564157631',
                                isdivider: false),
                          ],
                        ),
                      ),
                      2.height,
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedButtonIndex == 0 ? "\$295.00" : "K 6,461/mo",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
            ),
            CustomButton(
                height: 6.h,
                width: 50.w,
                label: "Order Now",
                onPressed: () {
                  selectedButtonIndex == 0
                      ? AppCustomNavigator.push(context, Checkout())
                      : _showBottomSheet();
                })
          ],
        ),
      ),
    );
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(8.sp),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Request Finance",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.cancel_outlined,
                        color: AppColors.primary),
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: Divider(
                  height: 1,
                  color: Colors.grey[400],
                ),
              ),
              SizedBox(height: 2.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Car Name",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 1.h),
                  Text(
                    "Audi A1 Sportback Hatchback",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    "Car Amount",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 1.h),
                  Text(
                    "\$279.00",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    "Payment Period (In Months)",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 1.h),
                  const CustomTextField(
                      name: "Select",
                      hintText: "Select",
                      suffixIcon: Icon(Icons.arrow_drop_down)),
                  SizedBox(height: 2.h),
                  Text(
                    "Down Payment)",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 1.h),
                  const CustomTextField(
                    name: "Enter",
                    hintText: "Enter",
                  ),
                  SizedBox(height: 2.h),
                  CustomButton(label: "Submit", onPressed: () {})
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  // void _showDialog() {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         clipBehavior: Clip.hardEdge,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.all(Radius.circular(20.sp)),
  //         ),
  //         content: ConstrainedBox(
  //           constraints: BoxConstraints(maxHeight: 85.h),
  //           child: SingleChildScrollView(
  //             child: Padding(
  //               padding: EdgeInsets.all(8.0.sp),
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.stretch,
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Text(
  //                     "About Vehicle",
  //                     style: Theme.of(context).textTheme.bodyMedium?.copyWith(
  //                           fontWeight: FontWeight.w800,
  //                         ),
  //                   ),
  //                   SizedBox(height: 1.h),
  //                   _buildRow("Year", "2022"),
  //                   1.height,
  //                   _buildRow("Make", "Audi"),
  //                   1.height,
  //                   _buildRow("Interior Color", "Black"),
  //                   1.height,
  //                   _buildRow("Exterior Color", "Silver"),
  //                   1.height,
  //                   _buildRow("Engine", "Electrical Engines"),
  //                   1.height,
  //                   _buildRow("Fuel Type", "Petrol"),
  //                   1.height,
  //                   _buildRow("Condition", "Good"),
  //                   1.height,
  //                   _buildRow("Transmission", "Automatic"),
  //                   1.height,
  //                   _buildRow("VIN", "BAC, 1412"),
  //                   1.height,
  //                   _buildRow("Stock Number", "KM245L"),
  //                   1.height,
  //                   _buildRow("Mileage", "40 km/1"),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ),
  //         backgroundColor: Colors.white,
  //         surfaceTintColor: Colors.white,
  //         contentPadding: EdgeInsets.zero,
  //         insetPadding: EdgeInsets.symmetric(horizontal: 20),
  //       );
  //     },
  //   );
  // }

  Widget _buildRow(String label, String value, {bool isdivider = true}) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 35.w,
              child: Text(
                label,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: AppColors.arrowGrey),
              ),
            ),
            5.width,
            Text(
              value,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ],
        ),
        if (isdivider)
          const Divider(
            color: AppColors.lightGrey,
          )
      ],
    );
  }

  Future<void> _compareFinanceBottomSheet(BuildContext context) async {
    await showModalBottomSheet(
      backgroundColor: AppColors.white,
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.sp)),
      ),
      builder: (BuildContext context) {
        return SafeArea(
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setModalState) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Compare Finance Offers',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(fontWeight: FontWeight.w800),
                            ),
                            GestureDetector(
                              onTap: () {
                                AppCustomNavigator.pop(context);
                              },
                              child: SvgPicture.asset(
                                AppSvgs.closeCircle,
                                color: AppColors.primary,
                                height: 2.5.h,
                              ),
                            ),
                          ],
                        ),
                        5.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Car Name',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 9.sp),
                            ),
                            Text(
                              'Audi A1 Sportback',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 9.sp),
                            ),
                          ],
                        ),
                        2.height,
                        Divider(
                          color: AppColors.lightGrey,
                        ),
                        2.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Car Amount',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 9.sp),
                            ),
                            Text(
                              '100.00',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 9.sp),
                            ),
                          ],
                        ),
                        2.height,
                        Divider(
                          color: AppColors.lightGrey,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Payment period (In Months)',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 9.sp),
                            ),
                            SizedBox(
                                width: 15.w,
                                child: DropdownButtonFormField(
                                  alignment: AlignmentDirectional.centerEnd,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none)),
                                  items:
                                      ['3', '6', '9', '12'].map((String val) {
                                    return DropdownMenuItem(
                                      value: val,
                                      child: Text(
                                        val,
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (Object? value) {},
                                )
                                // CustomDropdown(
                                //     name: 'name',
                                //     hintText: '',
                                //     items:
                                //         ['3', '6', '9', '12'].map((String value) {
                                //       return DropdownMenuItem<String>(
                                //         value: value,
                                //         child: Text(
                                //           value,
                                //           style: Theme.of(context)
                                //               .textTheme
                                //               .bodyMedium,
                                //         ),
                                //       );
                                //     }).toList()),
                                )
                          ],
                        ),
                        Divider(
                          color: AppColors.lightGrey,
                        ),
                        3.height,
                        CustomButton(
                            label: 'Get Quotes',
                            onPressed: () {
                              Get.back();
                            })
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
