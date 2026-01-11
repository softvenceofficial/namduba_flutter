import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/create_request/compare_estimates/request_estimate_item_detail/component/widget/car_card_widget.dart';
import 'package:nanduba/views/create_request/compare_estimates/request_estimate_item_detail/component/widget/insurance_card_widget.dart';

class EstimateServiceItemDetails extends StatefulWidget {
  final String estimateDetail;

  const EstimateServiceItemDetails({
    super.key,
    required this.estimateDetail,
  });

  @override
  State<EstimateServiceItemDetails> createState() =>
      _EstimateServiceItemDetailsState();
}

class _EstimateServiceItemDetailsState
    extends State<EstimateServiceItemDetails> {
  bool isOnComprehensive = false;
  bool isOnThirdPartyFire = false;
  bool isOnFullThirdParty = false;
  bool isOnCourtesyVehicle = false;
  bool isOnWindscreenCover = false;
  bool isOnThirdPartyLiability = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            2.height,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: const CustomAppbar(
                title: "Motor Insurance ",
                isPop: true,
                isSearch: false,
                isRequestAdd: false,
                svgIconNextToTitle: AppSvgs.closeCircle,
              ),
            ),
            1.height,
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Column(
                    children: [
                      0.2.height,
                      1.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Start date ",
                                style:
                                    Textfontstyle.TextStyle12w500c212121poppins
                                        .copyWith(
                                            color: AppColors.textColor,
                                            fontWeight: FontWeight.bold),
                              ),
                              .5.height,
                              Text(
                                "12 Jan 2026",
                                style:
                                    Textfontstyle.TextStyle12w500c212121poppins
                                        .copyWith(
                                            color: AppColors.textColor,
                                            fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const Icon(
                            Icons.chevron_right,
                            color: AppColors.textColor,
                          )
                        ],
                      ),
                      1.height,
                      const Divider(color: AppColors.cBEBEBE),
                      1.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Tenure ",
                                style:
                                    Textfontstyle.TextStyle12w500c212121poppins
                                        .copyWith(
                                            color: AppColors.textColor,
                                            fontWeight: FontWeight.bold),
                              ),
                              .5.height,
                              Text(
                                "4 Quaters",
                                style:
                                    Textfontstyle.TextStyle12w500c212121poppins
                                        .copyWith(
                                            color: AppColors.textColor,
                                            fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const Icon(
                            Icons.chevron_right,
                            color: AppColors.textColor,
                          )
                        ],
                      ),
                      1.height,
                      const Divider(color: AppColors.cBEBEBE),
                      1.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "End date (auto)",
                                style:
                                    Textfontstyle.TextStyle12w500c212121poppins
                                        .copyWith(
                                            color: AppColors.textColor,
                                            fontWeight: FontWeight.bold),
                              ),
                              .5.height,
                              Text(
                                "12 Jan 2027",
                                style:
                                    Textfontstyle.TextStyle12w500c212121poppins
                                        .copyWith(
                                            color: AppColors.textColor,
                                            fontWeight: FontWeight.bold),
                              ),
                              .5.height,
                              Text(
                                "End date is automatically calculated based on \nthe selected start date and tenure",
                                style:
                                    Textfontstyle.TextStyle12w500c212121poppins
                                        .copyWith(
                                            color: AppColors.midGrey,
                                            fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                          const Icon(
                            Icons.lock_outline,
                            color: AppColors.textColor,
                          )
                        ],
                      ),
                      4.3.height,
                      1.height,
                      const cardContainer(
                        title: "Acura MDX ALC2348",
                        subtitle: "ALC2348ZM",
                      ),
                      2.height,
                      const cardContainer(
                        title: "Acura MDX",
                        subtitle: "BAJ8767ZM",
                      ),
                      2.height,

                      /// CoverageCards with independent bools
                      CoverageCard(
                        icon: AppSvgs.sheild,
                        title: "Comprehensive\nCoverage",
                        warning:
                            "Coverage for damages caused by things you can’t control:",
                        isOn: isOnComprehensive,
                        onChanged: (val) {
                          setState(() {
                            isOnComprehensive = val;
                          });
                        },
                        footerIcon: IconButton(
                          icon: Icon(
                            Icons.edit,
                            size: 14.sp,
                            color: AppColors.primary,
                          ),
                          onPressed: () {},
                        ),
                        bulletPoints: const [
                          "Weather",
                          "Theft and vandalism",
                          "If you hit an animal",
                          "Falling objects (like trees...)",
                          "Fire",
                        ],
                      ),
                      2.height,
                      CoverageCard(
                        icon: AppSvgs.thairdparty,
                        title: "Third Party Fire\n& Theft",
                        warning:
                            "Covers damage or injury caused to others plus "
                            "damage to your vehicle caused by fire or theft",
                        isOn: isOnThirdPartyFire,
                        onChanged: (val) {
                          setState(() {
                            isOnThirdPartyFire = val;
                          });
                        },
                        footerIcon: IconButton(
                          icon: Icon(
                            Icons.edit,
                            size: 14.sp,
                            color: AppColors.primary,
                          ),
                          onPressed: () {},
                        ),
                        bulletPoints: const [
                          "If You Hit Another Vehicle Or Object",
                          "If Your Vehicle Catches Fire Or Is Stolen",
                          "Medical Expenses For Others Injured By You",
                        ],
                      ),
                      2.height,
                      CoverageCard(
                        icon: AppSvgs.thairdparty,
                        title: "Full Third Party",
                        warning:
                            "Covers injury and death to other people including damage to third party vehicles and property",
                        isOn: isOnFullThirdParty,
                        onChanged: (val) {
                          setState(() {
                            isOnFullThirdParty = val;
                          });
                        },
                        footerIcon: IconButton(
                          icon: Icon(
                            Icons.expand_more,
                            size: 20.sp,
                            color: AppColors.textColor,
                          ),
                          onPressed: () {},
                        ),
                        bulletPoints: const [
                          "If you hit another vehicle",
                          "If you hit others property",
                          "Medical expenses for others injured by you",
                        ],
                      ),
                      2.height,
                      CoverageCard(
                        icon: AppSvgs.carInsuranseIcon,
                        title: "Courtesy Vehicle",
                        warning:
                            "Covers damage to other’s for bodily Injury and death",
                        optional:
                            "You need to add comprehensive coverage to include this on your policy. ",
                        isOn: isOnCourtesyVehicle,
                        onChanged: (val) {
                          setState(() {
                            isOnCourtesyVehicle = val;
                          });
                        },
                        footerIcon: IconButton(
                          icon: Icon(
                            Icons.edit,
                            size: 14.sp,
                            color: AppColors.primary,
                          ),
                          onPressed: () {},
                        ),
                        bulletPoints: const [
                          "If you hit another vehicle ",
                          "If another vehicle hits you",
                          "If your car rolls over",
                        ],
                      ),
                      2.height,
                      CoverageCard(
                        icon: AppSvgs.windshild,
                        title: "Windscreen cover",
                        optional:
                            "You need to add comprehensive coverage to include this on your policy.",
                        warning: "Covers damage to your windscreen",
                        isOn: isOnWindscreenCover,
                        onChanged: (val) {
                          setState(() {
                            isOnWindscreenCover = val;
                          });
                        },
                        price: "\$3,500 Max",
                        footerIcon: IconButton(
                          icon: Icon(
                            Icons.expand_more,
                            size: 20.sp,
                            color: AppColors.textColor,
                          ),
                          onPressed: () {},
                        ),
                      ),
                      2.height,
                      CoverageCard(
                        icon: AppSvgs.thairdparty,
                        title: "Third Party \nLiability",
                        warning:
                            "Covers medical expenses for others when you cause an accident ",
                        isOn: isOnThirdPartyLiability,
                        onChanged: (val) {
                          setState(() {
                            isOnThirdPartyLiability = val;
                          });
                        },
                        price: "K100,000 per person / K200,000 per incident ",
                        footerIcon: IconButton(
                          icon: Icon(
                            Icons.expand_more,
                            size: 20.sp,
                            color: AppColors.textColor,
                          ),
                          onPressed: () {},
                        ),
                      ),
                      3.9.height,
                      CustomButton(
                        label: "Save",
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
