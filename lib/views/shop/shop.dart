import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:nanduba/controllers/rent_car_controller.dart';
import 'package:nanduba/controllers/sale_car_parts_controller.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/add_vehicle/enter_regNo/add_vehicle.dart';
import 'package:nanduba/views/shop/car_part_details.dart';
import 'package:nanduba/views/shop/rent_cars.dart';
import 'package:nanduba/views/shop/shop_details.dart';
import 'package:nanduba/views/shop/widgets/car_parts_filter.dart';
import 'package:nanduba/widgets/core/car_parts_container.dart';

import '../../widgets/core/my_text.dart';
import '../add_vehicle/vehicle_profile/vehicle_profile.dart';

class CarSales extends StatefulWidget {
  final int? selectedIndex;
  const CarSales({super.key, this.selectedIndex = 0});

  @override
  State<CarSales> createState() => _CarSalesState();
}

class _CarSalesState extends State<CarSales> {
  int selectedButtonIndex = 0;
  int subSelectedButtonIndex = 0;
  int _selectedCon = 0;
  int _selectedIndex = 0;
  int rentalIndex = 0;
  int partsIndex = 0;
  bool isEmpty = false;
  final RentCarController rentCarController = Get.find<RentCarController>();

  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> filteredCars = [];
  List<Map<String, dynamic>> filteredParts = [];
  List<Map<String, String>> filteredRent = [];

  List<Map<String, dynamic>> parts = [
    {
      "name": "Front Bumper",
      "price": "500.00",
      "fit": true,
      "image": AppImages.front_bumper,
    },
    {
      "name": "Tyre",
      "price": "1500.00",
      "fit": true,
      "image": AppImages.tyre,
    },
    {
      "name": "Spark Plug",
      "price": "400.00",
      "fit": true,
      "image": AppImages.Plug,
    },
    {
      "name": "Tyre",
      "price": "2500.00",
      "fit": true,
      "image": AppImages.tyre,
    },
    {
      "name": "Front Bumper",
      "price": "2500.00",
      "fit": true,
      "image": AppImages.front_bumper,
    },
    {
      "name": "Tyre",
      "price": "12500.00",
      "fit": true,
      "image": AppImages.tyre,
    },
    {
      "name": "Spark Plug",
      "price": "4200.00",
      "fit": true,
      "image": AppImages.Plug,
    },
    {
      "name": "Tyre",
      "price": "25200.00",
      "fit": true,
      "image": AppImages.tyre,
    },
  ];
  List<Map<String, dynamic>> cars = [
    {
      "name": "BMW",
      "price": "500.00",
      "rating": "2.5",
      "image": AppImages.bmw,
    },
    {
      "name": "Corolla",
      "price": "300.00",
      "rating": "3.5",
      "image": AppImages.Car_Benz,
    },
    {
      "name": "BMW",
      "price": "400.00",
      "rating": "2.8",
      "image": AppImages.bmw,
    },
    {
      "name": "Benz",
      "price": "700.00",
      "rating": "4.5",
      "image": AppImages.Car_Benz,
    },
    {
      "name": "Truck",
      "price": "800.00",
      "rating": "4.0",
      "image": AppImages.truck2,
    },
  ];
  List<String> carAndTrucks = [
    'Classic',
    'Convertibles',
    'Hatchback',
    'Hybrids',
    'Sedans',
    'SUVs',
    'Trucks',
    'Vans',
  ];
  List<String> carAndTrucksSvg = [
    AppSvgs.carIcon,
    AppSvgs.carIcon,
    AppSvgs.carIcon,
    AppSvgs.carIcon,
    AppSvgs.carIcon,
    AppSvgs.carIcon,
    AppSvgs.carIcon,
    AppSvgs.carIcon,
  ];
  // List<String> motorbikes = [
  //   'Cruiser',
  //   'Standards',
  //   'Touring',
  //   'Sport Bike',
  //   'Off-Road',
  //   'Custom',
  // ];
  // List<String> motorbikesSvg = [
  //   AppSvgs.carIcon,
  //   AppSvgs.carIcon,
  //   AppSvgs.carIcon,
  //   AppSvgs.carIcon,
  //   AppSvgs.carIcon,
  //   AppSvgs.carIcon,
  // ];
  final ScrollController _scrollController = ScrollController();
  bool _isHorizontalScrollVisible = true;

  void _filterCars(String? query) {
    setState(() {
      if (query!.isEmpty) {
        filteredCars = cars;
      } else {
        filteredCars = cars
            .where((car) =>
                car['name'].toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void _filterParts(String? query) {
    setState(() {
      if (query!.isEmpty) {
        filteredParts = parts;
      } else {
        filteredParts = parts
            .where((part) =>
                part['name'].toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void _filterRents(String? query) {
    setState(() {
      if (query!.isEmpty) {
        filteredRent = rentCarController.carDetails;
      } else {
        filteredRent = rentCarController.carDetails
            .where((rent) =>
                rent['carName']!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void _showCarPartsFilter() {
    showModalBottomSheet(
      context: context,
      isDismissible: true,
      isScrollControlled: true,
      enableDrag: true,
      builder: (BuildContext context) {
        return const CarPartsFilter();
      },
    );
  }

  @override
  void initState() {
    super.initState();
    filteredCars = cars;
    filteredParts = parts;
    filteredRent = rentCarController.carDetails;
    selectedButtonIndex = widget.selectedIndex ?? 0;
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (_isHorizontalScrollVisible) {
          setState(() {
            _isHorizontalScrollVisible = false;
          });
        }
      } else if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (!_isHorizontalScrollVisible) {
          setState(() {
            _isHorizontalScrollVisible = true;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          child: Column(
            children: [
              const ShopTopBar(),
              if (_isHorizontalScrollVisible) 2.height,
              if (_isHorizontalScrollVisible) _buildCategoryButtons(),
              if (_isHorizontalScrollVisible) 2.height,
              if (selectedButtonIndex == 0) _buildSubCategoryButtons(),
              if (selectedButtonIndex == 2 && !_isHorizontalScrollVisible)
                2.height,
              _buildSearchField(),
              2.height,
              if (selectedButtonIndex == 0 && subSelectedButtonIndex == 0)
                _buildCarSalesView(),
              if (selectedButtonIndex == 0 && subSelectedButtonIndex == 1)
                _buildCarRentalsView(),
              if (selectedButtonIndex == 2) _buildCarPartsView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildCustomButton(
          label: "Parts",
          index: 2,
        ),
        _buildCustomButton(
          label: "Vehicles",
          index: 0,
        ),
        // _buildCustomButton(
        //   label: "Rentals",
        //   index: 1,
        // ),
      ],
    );
  }

  Widget _buildCustomButton({
    required String label,
    required int index,
  }) {
    return CustomButton(
      borderColor: AppColors.transparent,
      label: label,
      labelFontSize: 9.sp,
      onPressed: () {
        setState(() {
          selectedButtonIndex = index;
        });
      },
      height: 5.h,
      width: 45.w,
      backgroundColor: selectedButtonIndex == index
          ? AppColors.primary
          : AppColors.lightGrey,
      foregroundColor:
          selectedButtonIndex == index ? AppColors.white : AppColors.grey,
    );
  }

  Widget _buildSubCategoryButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Spacer(),
        _buildSubCategoryButton("Buy", 0),
        4.width,
        _buildSubCategoryButton("Rent", 1),
        Spacer(),
      ],
    );
  }

  Widget _buildSubCategoryButton(String label, int index) {
    return TextButton(
      onPressed: () {
        setState(() {
          subSelectedButtonIndex = index;
          _selectedIndex = 0;
        });
      },
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.transparent,
              fontWeight: FontWeight.w700,
              fontSize: 9.sp,
              shadows: [
                Shadow(
                    color: subSelectedButtonIndex == index
                        ? AppColors.primary
                        : AppColors.grey,
                    offset: Offset(0, -5))
              ],
              decoration: TextDecoration.underline,
              decorationColor: subSelectedButtonIndex == index
                  ? AppColors.primary
                  : AppColors.transparent,
              decorationThickness: 4,
            ),
      ),
    );
  }

  Widget _buildSearchField() {
    return CustomTextField(
      name: 'search',
      controller: _searchController,
      enableBorder: AppColors.kEnableBorderGrey,
      prefixIcon: SvgPicture.asset(
        AppSvgs.searchIcon,
        fit: BoxFit.scaleDown,
      ),
      suffixIcon: GestureDetector(
        onTap: _showCarPartsFilter,
        child: Padding(
          padding: EdgeInsets.all(8.sp),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.sp),
              color: AppColors.primary,
            ),
            child: SvgPicture.asset(
              AppSvgs.filter,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
      ),
      hintStyle: Theme.of(context)
          .textTheme
          .bodyMedium
          ?.copyWith(letterSpacing: 0, color: AppColors.grey.withOpacity(0.7)),
      hintText: subSelectedButtonIndex == 0 && selectedButtonIndex == 0
          ? AppText.findYourNextRide
          : subSelectedButtonIndex == 1 && selectedButtonIndex == 0
              ? AppText.searchrent
              : selectedButtonIndex == 2
                  ? AppText.searchparts
                  : AppText.searchrent,
      showShadow: true,
      onChanged: subSelectedButtonIndex == 0 && selectedButtonIndex == 0
          ? _filterCars
          : subSelectedButtonIndex == 1 && selectedButtonIndex == 0
              ? _filterRents
              : selectedButtonIndex == 2
                  ? _filterParts
                  : _filterRents,
      onEditComplete: () {
        FocusScope.of(context).unfocus();
      },
    );
  }

  Widget _buildCarSalesView() {
    return Expanded(
      child: SizedBox(
        child: Column(
          children: [
            if (_isHorizontalScrollVisible)
              _buildHorizontalScrollView(carAndTrucks, carAndTrucksSvg
                  // subSelectedButtonIndex == 0 ? carAndTrucks : motorbikes,
                  // subSelectedButtonIndex == 0
                  //     ? carAndTrucksSvg
                  //     : motorbikesSvg

                  ),
            _buildGridView(
                filteredCars.length, const ShopDetail(), filteredCars),
          ],
        ),
      ),
    );
  }

  Widget _buildHorizontalScrollView(List<String> items, List<String> svg) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: items.map((item) {
          int index = items.indexOf(item);
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: CustomServiceContainer(
              serviceType: item,
              assetPath: svg[index],
              isSvg: true,
              selected: _selectedIndex == index,
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildGridView(int itemCount, Widget destination, List<dynamic> cars) {
    return Expanded(
      child: GridView.builder(
        controller: _scrollController,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 3.w,
          childAspectRatio: 2 / 3,
        ),
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.to(() => destination);
            },
            child: CustomProductContainer(
              image: cars[index]['image'],
              title: cars[index]['name'],
              price: cars[index]['price'],
              rating: cars[index]['rating'],
            ),
          );
        },
      ),
    );
  }

  Widget _buildCarRentalsView() {
    return Expanded(
      child: SizedBox(
        child: Column(
          children: [
            if (_isHorizontalScrollVisible)
              _buildHorizontalScrollView([
                AppText.all,
                AppText.sedan,
                AppText.suv,
                AppText.service,
              ], [
                AppSvgs.all,
                AppSvgs.sedan,
                AppSvgs.suv,
                AppSvgs.serviceIcon,
              ]),
            Expanded(
              child: GridView.builder(
                controller: _scrollController,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 3.w,
                  childAspectRatio: 2 / 3,
                ),
                itemCount: filteredRent.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => RentCars(
                            car: filteredRent[index],
                          ));
                    },
                    child: CustomProductContainer(
                      image: filteredRent[index]['carPic']!,
                      title: filteredRent[index]['carName']!,
                      price: '110.00/Day',
                      rating: '4.5',
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCarPartsView() {
    final SaleCarPartsController saleCarPartsController =
        Get.find<SaleCarPartsController>();
    return Expanded(
      child: SizedBox(
        child: Column(
          children: [
            // SizedBox(
            //   height: 8.0.h,
            //   child: ListView.builder(
            //       shrinkWrap: true,
            //       scrollDirection: Axis.horizontal,
            //       itemCount: saleCarPartsController.carDetails.length,
            //       itemBuilder: (context, index) {
            //         return GestureDetector(
            //           onTap: () {
            //             setState(() {
            //               _selectedCon = index; // Update the selected index
            //             });
            //           },
            //           child: CarPartsContainer(
            //             carPic: saleCarPartsController.carDetails[index]
            //                 ['carPic']!,
            //             carName: saleCarPartsController.carDetails[index]
            //                 ['carName']!,
            //             carModel: saleCarPartsController.carDetails[index]
            //                 ['model']!,
            //             isSelected: _selectedCon == index,
            //           ),
            //         );
            //       }),
            // ),
            if (_isHorizontalScrollVisible)
              CarPartsContainerWithChange(
                carPic: isEmpty ? '' : AppImages.honda,
                carName: isEmpty ? '' : '2017 BMW x 3 ACC 1812',
                carModel: isEmpty ? '' : 'Diesel SUV 18ds Drive',
                onChange: () {
                  Get.bottomSheet(
                    isDismissible: true,
                    isScrollControlled: true,
                    Container(
                      height: 60.h,
                      width: 100.w,
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
                            children: [
                              MyText(
                                text: 'Change Vehicle',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textColor,
                              ),
                              InkWell(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Icon(
                                    CupertinoIcons.xmark_circle,
                                    size: 25,
                                    color: AppColors.primary,
                                  ))
                            ],
                          ),
                          2.height,
                          CustomTextField(
                            name: 'Search for vehicle',
                            enableBorder: AppColors.kEnableBorderGrey,
                            prefixIcon: SvgPicture.asset(
                              AppSvgs.searchIcon,
                              fit: BoxFit.scaleDown,
                            ),
                            // controller: shopController.searchController,
                            hintText: AppText.search,
                            showShadow: true,
                            onEditComplete: () {
                              FocusScope.of(context).unfocus();
                            },
                          ),
                          2.height,
                          Expanded(
                            child: ListView.builder(
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      // vehicleProfileController.listingIndex.value=index;
                                    },
                                    child: CustomContainer(
                                      borderRadius: 5.w,
                                      vMargin: 1.h,
                                      // hMargin: 5.w,
                                      hpadding: 3.w,
                                      vpadding: 1.1.h,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            // height: 7.5.h,
                                            // width: 15.w,
                                            height: 64,
                                            width: 64,
                                            padding: EdgeInsets.all(2.w),
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                color: AppColors.midLightGrey,
                                                borderRadius:
                                                    BorderRadius.circular(16)),
                                            child: Image.asset(
                                              AppImages.mercedes,
                                            ),
                                          ),
                                          2.width,
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                1.height,
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                        width: 50.w,
                                                        child: MyText(
                                                          text:
                                                              "John's Mustang",
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: AppColors
                                                              .textColor,
                                                        )),
                                                    Spacer(),
                                                    SvgPicture.asset(AppSvgs
                                                        .arrowCircleRight)
                                                  ],
                                                ),
                                                1.height,
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: 6,
                                                      width: 6,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color:
                                                            AppColors.primary,
                                                      ),
                                                    ),
                                                    1.width,
                                                    MyText(
                                                      text: '2014',
                                                      fontSize: 10.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color:
                                                          AppColors.midDarkGrey,
                                                    ),
                                                    3.width,
                                                    Container(
                                                      height: 6,
                                                      width: 6,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color:
                                                            AppColors.primary,
                                                      ),
                                                    ),
                                                    1.width,
                                                    MyText(
                                                      text:
                                                          "Ford Mustang GT 2014",
                                                      fontSize: 10.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color:
                                                          AppColors.midDarkGrey,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          2.height,
                          CustomButton(
                            label: "Add new vehicle",
                            onPressed: () {
                              Get.to(() => AddVehicle());
                            },
                            backgroundColor: Colors.white,
                            foregroundColor: AppColors.primary,
                          ),
                          2.height,
                          CustomButton(
                            label: "Shop without Vehicle",
                            onPressed: () {
                              setState(() {
                                isEmpty = true;
                              });
                              Get.back();
                            },
                            backgroundColor: Colors.white,
                            foregroundColor: AppColors.midGrey,
                            borderColor: AppColors.midGrey,
                          ),
                          1.height,
                        ],
                      ),
                    ),
                  );
                },
              ),
            2.height,
            if (_isHorizontalScrollVisible)
              _buildHorizontalScrollView([
                AppText.all,
                AppText.brakes,
                "Accessories",
                AppText.service,
              ], [
                AppSvgs.all,
                AppSvgs.brakes,
                AppSvgs.piston,
                AppSvgs.serviceIcon,
              ]),
            Expanded(
              child: GridView.builder(
                controller: _scrollController,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 3.w,
                  childAspectRatio: 2 / 3,
                ),
                itemCount: filteredParts.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => CarPartDetails());
                    },
                    child: CustomProductContainer(
                      vFits: filteredParts[index]['fit'],
                      image: filteredParts[index]['image'],
                      title: filteredParts[index]['name'],
                      price: filteredParts[index]['price'],
                      rating: '',
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
