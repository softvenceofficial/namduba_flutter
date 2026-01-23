import 'package:get/get.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/home/search_location.dart';
import 'package:nanduba/views/shop/car_part_details.dart';

import 'package:nanduba/views/shop/shop_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSlide = 0;
  bool isFavourite = false;
  List<String> estimatesIds = ['#54875', '#54876'];
  List<String> date = [
    'Aug 21, 11:00 PM',
    'Aug 21, 11:00 PM',
  ];
  List<String> estimatesType = ['Quoted', 'Pending'];
  List<List<String>> services = [
    ['Brake pad and rotor (2)'],
    [
      'Tune up - scheduled maintenance (2)',
      'Rear brake replacement (4)',
      'Aircon service (1)',
      'Radiator replacement (3)',
      'Electrical diagnosis (2)',
      'front shocks replacement (5)',
      'Tune up - scheduled maintenance (2)',
      'Rear brake replacement (4)',
      'Aircon service (1)',
      'Radiator replacement (3)',
      'Electrical diagnosis (2)',
      'front shocks replacement (5)'
    ],
  ];
  List<TabData> tabs = [
    TabData(
      titleText: AppText.noVehicle,
      descriptionText: AppText.emailVerificationDesc,
      buttonSvg: AppSvgs.add,
      buttonLabel: AppText.addVehicle,
      tabSvg: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SvgPicture.asset(
            AppSvgs.car,
            width: 25.w,
          ),
          SvgPicture.asset(
            AppSvgs.person,
            width: 9.w,
          ),
        ],
      ),
    ),
    TabData(
      titleText: AppText.emailAddress,
      descriptionText: AppText.emailAddress,
      buttonSvg: AppSvgs.add,
      buttonLabel: AppText.emailAddress,
      tabSvg: SvgPicture.asset(AppSvgs.person),
    ),
    TabData(
      titleText: AppText.addInfo,
      descriptionText: AppText.addInfo,
      buttonSvg: AppSvgs.add,
      buttonLabel: AppText.addInfo,
      tabSvg: SvgPicture.asset(AppSvgs.car),
    ),
  ];
  List<String> estimated = ['20', '20'];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.sp)),
              ),
              // scrollable: true,
              content: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 75.h,
                ),
                child: SingleChildScrollView(
                  child: YourEstimates(
                    estimatesIds: estimatesIds,
                    date: estimatesIds,
                    estimatesType: estimatesType,
                    services: services,
                    estimated: estimated,
                  ),
                ),
              ),
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.symmetric(horizontal: 20),
            );
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 0.h),
              child: Column(
                children: [
                  TopBar(
                    city: city,
                    onTap: () {
                      Get.to(() => const SearchLocation());
                    },
                  ), 

                  CustomTextField(
                    name: 'search',
                    enableBorder: AppColors.kEnableBorderGrey,
                    prefixIcon: SvgPicture.asset(
                      AppSvgs.searchIcon,
                      fit: BoxFit.scaleDown,
                    ),
                    hintText: AppText.search,
                    showShadow: true,
                    onEditComplete: () {},
                  ),
                  3.height,
                  const RecommendedForYou(),
                  2.height,

                  SingleChildScrollView(
                    clipBehavior: Clip.none,
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomServiceContainer(
                          serviceType: AppText.repairs,
                          isSvg: true,
                          assetPath: AppSvgs.repair,
                          onTap: () {
                            AppCustomNavigator.push(
                                context, const RepairScreen());
                          },
                        ),
                        3.width,
                        CustomServiceContainer(
                          serviceType: AppText.insurance,
                          isSvg: true,
                          assetPath: AppSvgs.insurance,
                          onTap: () {
                            AppCustomNavigator.push(
                                context, const InsuranceScreeen());
                          },
                        ),
                        3.width,
                        CustomServiceContainer(
                          serviceType: AppText.roadCompliance,
                          assetPath: AppSvgs.roadCompliance,
                          isSvg: true,
                          onTap: () {
                            AppCustomNavigator.push(
                                context, const ComplianceScreen());
                          },
                        ),
                      ],
                    ),
                  ),

                  0.5.height,
                  SingleChildScrollView(
                    clipBehavior: Clip.none,
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomServiceContainer(
                          serviceType: AppText.roadsideAssistance,
                          assetPath: AppSvgs.breakdown,
                          isSvg: true,
                          onTap: () {
                            AppCustomNavigator.push(
                                context, const BreakdownRecoveryScreen());
                          },
                        ),
                        3.width,
                        CustomServiceContainer(
                          serviceType: AppText.finance,
                          isSvg: true,
                          assetPath: AppSvgs.finance,
                          onTap: () {
                            AppCustomNavigator.push(
                                context, const FinanceScreen());
                          },
                        ),
                        3.width,
                        CustomServiceContainer(
                          serviceType: AppText.cleaningDetailing,
                          isSvg: true,
                          assetPath: AppSvgs.cleaningDetailing,
                          onTap: () {
                            AppCustomNavigator.push(
                                context, const CleaningDetailingScreen());
                          },
                        ),
                        3.width,
                      ],
                    ),
                  ),
                  2.height,
                  WantRenewal(buttonOnpressed: () {
                    AppCustomNavigator.push(
                        context, const RenewalServiceScreen());
                  }),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     CustomServiceContainer(
                  //       serviceType: AppText.breakdown,
                  //       assetPath: AppSvgs.breakdown,
                  //       isSvg: true,
                  //       onTap: () {
                  //         AppCustomNavigator.push(
                  //             context, const BreakdownRecoveryScreen());
                  //       },
                  //     ),
                  //     CustomServiceContainer(
                  //       serviceType: AppText.finance,
                  //       isSvg: true,
                  //       assetPath: AppSvgs.finance,
                  //       onTap: () {
                  //         AppCustomNavigator.push(
                  //             context, const FinanceScreen());
                  //       },
                  //     ),
                  //     CustomServiceContainer(
                  //       serviceType: AppText.cleaningDetailing,
                  //       isSvg: true,
                  //       assetPath: AppSvgs.cleaningDetailing,
                  //       onTap: () {
                  //         AppCustomNavigator.push(
                  //             context, const CleaningDetailingScreen());
                  //       },
                  //     ),
                  //   ],
                  // ),

                  // * ###############
                  // * remove by rasel
                  // * ###############

                  // SwipeableTabs(
                  //   tabs: tabs,
                  //   initialSlide: currentSlide,
                  //   onChange: (value) {
                  //     setState(() {
                  //       currentSlide = value;
                  //     });
                  //   },
                  //   onRemove: (index) {},
                  //   buttonOnpressed: () {
                  //     AppCustomNavigator.push(
                  //         context,
                  //         currentSlide == 0
                  //             ? AddVehicle()
                  //             : const UserProfile());
                  //   },
                  // ),

                  // SwipeableTabs(
                  //   itemCount: 3,
                  //   currentSlide: currentSlide,
                  //   onChange: (value) {
                  //     setState(() {
                  //       currentSlide = value;
                  //     });
                  //   },
                  //   closeGesture: () {},
                  //   buttonOnpressed: () {
                  //     AppCustomNavigator.push(context, AddVehicle());
                  //   },
                  //   titleText: currentSlide == 0
                  //       ? AppText.noVehicle
                  //       : currentSlide == 1
                  //           ? AppText.emailAddress
                  //           : AppText.addInfo,
                  //   descriptionText: currentSlide == 0
                  //       ? AppText.emailVerificationDesc
                  //       : currentSlide == 1
                  //           ? AppText.emailAddress
                  //           : AppText.addInfo,
                  //   buttonSvg: AppSvgs.add,
                  //   buttonLabel: currentSlide == 0
                  //       ? AppText.addVehicle
                  //       : currentSlide == 1
                  //           ? AppText.emailAddress
                  //           : AppText.addInfo,
                  //   tabSvg: currentSlide == 0
                  //       ? Row(
                  //           mainAxisAlignment: MainAxisAlignment.end,
                  //           crossAxisAlignment: CrossAxisAlignment.end,
                  //           children: [
                  //             SvgPicture.asset(
                  //               AppSvgs.car,
                  //               width: 25.w,
                  //             ),
                  //             SvgPicture.asset(
                  //               AppSvgs.person,
                  //               width: 9.w,
                  //             ),
                  //           ],
                  //         )
                  //       : currentSlide == 1
                  //           ? SvgPicture.asset(AppSvgs.person)
                  //           : SvgPicture.asset(AppSvgs.car),
                  // ),
                  // YourEstimates(
                  //   estimatesIds: estimatesIds,
                  //   date: estimatesIds,
                  //   estimatesType: estimatesType,
                  //   services: services,
                  //   estimated: estimated,
                  // ),
                  // 2.height,
                  // WantRenewal(buttonOnpressed: () {
                  //   AppCustomNavigator.push(
                  //       context, const RenewalServiceScreen());
                  // }),
                  2.height,
                  CustomHeading(
                    title: AppText.popularProducts,
                    suffixText: AppText.seeAll,
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 32.h,
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisSpacing: 3.w,
                          childAspectRatio: 1.25),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            AppCustomNavigator.push(
                                context,
                                index == 2
                                    ? const CarPartDetails()
                                    : const ShopDetail());
                          },
                          child: index == 2
                              ? const CustomProductContainer(
                                  image: AppImages.front_bumper,
                                  title: 'Front Bumper',
                                  price: '110.00',
                                  rating: '4.5',
                                )
                              : const CustomProductContainer(
                                  image: AppImages.bmw,
                                  title: 'BMW',
                                  price: '110.00',
                                  rating: '4.5',
                                ),
                        );
                      },
                    ),
                  ),
                  CustomHeading(
                    title: AppText.popularServices,
                    onTap: () {},
                    suffixText: AppText.seeAll,
                  ),
                  SizedBox(
                    height: 13.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                            top: 1.5.h,
                            bottom: 1.5.h,
                            left: index > 0 ? 3.w : 0,
                          ),
                          child: index == 0
                              ? CustomServiceContainer(
                                  serviceType: AppText.changeOfOwnership,
                                  assetPath: AppImages.image1,
                                  isSvg: false,
                                  onTap: () {
                                    AppCustomNavigator.push(
                                        context,
                                        const ComplianceScreen(
                                          sheet: true,
                                          showForIndex: 3,
                                          showForTitle:
                                              AppText.changeOfOwnership,
                                        ));
                                  },
                                )
                              : index == 1
                                  ? CustomServiceContainer(
                                      serviceType:
                                          AppText.comprehensiveInsurance,
                                      assetPath: AppImages.image2,
                                      isSvg: false,
                                      onTap: () {
                                        AppCustomNavigator.push(
                                            context,
                                            const InsureScreen(
                                              sheet: true,
                                              showForIndex: 0,
                                              showForTitle: AppText
                                                  .comprehensiveInsurance,
                                            ));
                                      },
                                    )
                                  : CustomServiceContainer(
                                      serviceType: AppText.general,
                                      assetPath: AppImages.image3,
                                      isSvg: false,
                                      onTap: () {
                                        AppCustomNavigator.push(
                                            context,
                                            const GeneralScreen(
                                              sheet: true,
                                              showForIndex: 1,
                                              showForTitle:
                                                  AppText.generalDiagnosis,
                                            ));
                                      },
                                    ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
