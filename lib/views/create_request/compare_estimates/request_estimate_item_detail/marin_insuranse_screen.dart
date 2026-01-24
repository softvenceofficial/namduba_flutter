import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/create_request/compare_estimates/request_estimate_item_detail/component/widget/car_card_widget.dart';
import 'package:nanduba/views/create_request/compare_estimates/request_estimate_item_detail/component/widget/date_picker.dart';
import 'package:nanduba/views/create_request/compare_estimates/request_estimate_item_detail/component/widget/insurance_card_widget.dart';
import 'package:nanduba/views/create_request/compare_estimates/request_estimate_item_detail/component/widget/policy_period_widgt.dart';
import 'package:nanduba/views/create_request/compare_estimates/request_estimate_item_detail/component/widget/quick_select_widget.dart';

class MarinInsuranseScreen extends StatefulWidget {
  const MarinInsuranseScreen({
    super.key,
  });

  @override
  State<MarinInsuranseScreen> createState() => _MarinInsuranseScreenState();
}

class _MarinInsuranseScreenState extends State<MarinInsuranseScreen> {
  bool isOnComprehensive = false;
  bool isOnThirdPartyFire = false;
  bool isOnFullThirdParty = false;
  bool isOnCourtesyVehicle = false;
  bool isOnWindscreenCover = false;
  bool isOnThirdPartyLiability = false;
  double newValue = 50000;
  double newValue2 = 50000;
  double newValue3 = 50000;

  DateTime selectedDate = DateTime(2025, 3, 1);

  String get formattedDate => DateFormat('MMMM d, yyyy').format(selectedDate);
  int selectedQuarters = 4;
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
                title: "Marin Insurance ",
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      0.2.height,
                      1.height,
                      CustomContainer(
                          vpadding: 16,
                          hpadding: 16,
                          child: Row(
                            children: [
                              Container(
                                height: 58,
                                width: 58,
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: AppColors.cEFEFEF,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Image.asset(
                                  AppImages.Car_Benz,
                                  // width: 42,
                                  // height: 20,
                                ),
                              ),
                              2.width,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Marin Insurance ",
                                          style: Textfontstyle
                                                  .TextStyle12w500c212121poppins
                                              .copyWith(
                                                  color: AppColors.textColor,
                                                  fontWeight: FontWeight.bold),
                                        ),
                                     
                                        Text(
                                          "\$600",
                                          style: Textfontstyle
                                                  .TextStyle12w500c212121poppins
                                              .copyWith(
                                                  color: AppColors.textColor,
                                                  fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    .7.height,
                                    Text(
                                      "1 consignment ",
                                      style: Textfontstyle
                                              .TextStyle14w400midgreypoppins
                                          .copyWith(
                                              fontSize: 8.sp,
                                              color: AppColors.midDarkGrey,
                                              fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                              )
                            ],
                          )),

                      1.2.height,
                      CustomContainer(
                          vpadding: 16,
                          hpadding: 16,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Policy Period",
                                    style: Textfontstyle
                                            .TextStyle14w400midgreypoppins
                                        .copyWith(
                                            fontSize: 14.sp,
                                            color: AppColors.textColor,
                                            fontWeight: FontWeight.bold),
                                  ),
                                  const Icon(Icons.chevron_right),
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: AppColors.arrowGrey.withAlpha(40),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Start Data",
                                          style: Textfontstyle
                                                  .TextStyle14w400midgreypoppins
                                              .copyWith(
                                                  fontSize: 10.sp,
                                                  color: AppColors.midGrey,
                                                  fontWeight: FontWeight.w600),
                                        ),
                                        GestureDetector(
                                          onTap: () async {
                                            final pickedDate =
                                                await showDialog<DateTime>(
                                              context: context,
                                              builder: (context) =>
                                                  CustomDatePickerDialog(
                                                initialDate: selectedDate,
                                                minDate: DateTime.now()
                                                    .subtract(const Duration(
                                                        days: 10)),
                                                maxDate: DateTime(2050, 12, 31),
                                                onDateConfirmed: (date) {
                                                  Navigator.pop(context, date);
                                                },
                                              ),
                                            );

                                            if (pickedDate != null) {
                                              setState(() {
                                                selectedDate = pickedDate;
                                              });
                                            }
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 2),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: AppColors.white,
                                                border: Border.all(
                                                  color: AppColors.cBEBEBE,
                                                )),
                                            child: Row(
                                              children: [
                                                Text(formattedDate.toString()),
                                                1.width,
                                                Container(
                                                  height: 20,
                                                  width: 1,
                                                  color: AppColors.bottomNav,
                                                ),
                                                1.width,
                                                SvgPicture.asset(
                                                  AppSvgs.calendar,
                                                  color: AppColors.textColor4,
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const Divider(
                                      color: AppColors.cBEBEBE,
                                      thickness: 1,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) =>
                                              PolicyPeriodPickerDialog(
                                            initialSelectedQuarters:
                                                selectedQuarters,
                                            onConfirmed: (val) {
                                              setState(() {
                                                selectedQuarters = val;
                                              });
                                            },
                                          ),
                                        );
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Duration",
                                            style: Textfontstyle
                                                    .TextStyle14w400midgreypoppins
                                                .copyWith(
                                                    fontSize: 10.sp,
                                                    color: AppColors.midGrey,
                                                    fontWeight:
                                                        FontWeight.w600),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 2),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: AppColors.white,
                                                border: Border.all(
                                                  color: AppColors.cBEBEBE,
                                                )),
                                            child: Row(
                                              children: [
                                                Text(
                                                    "$selectedQuarters Quarter${selectedQuarters > 1 ? 's' : ''}"),
                                                1.width,
                                                const Icon(Icons.expand_more)
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    const Divider(
                                      color: AppColors.cBEBEBE,
                                      thickness: 1,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "End Data",
                                          style: Textfontstyle
                                                  .TextStyle14w400midgreypoppins
                                              .copyWith(
                                                  fontSize: 10.sp,
                                                  color: AppColors.midGrey,
                                                  fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          "February 28,2027",
                                          style: Textfontstyle
                                                  .TextStyle14w400midgreypoppins
                                              .copyWith(
                                                  fontSize: 10.sp,
                                                  color: AppColors.midGrey,
                                                  fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          )),
                      2.height,

                      Text(
                        "Coverage",
                        style: Textfontstyle.TextStyle12w500c212121poppins
                            .copyWith(
                                fontWeight: FontWeight.bold, fontSize: 12.sp),
                      ),
                      1.height,
                      const cardContainer(
                        title: "Cargo",
                        subtitle: "All Risks-ICC A",
                      ),
                      2.height,
                      // const cardContainer(
                      //   title: "Acura MDX",
                      //   subtitle: "BAJ8767ZM",
                      // ),
                      // 2.height,

                      /// CoverageCards with independent bools
                      CoverageCard(
                        icon: AppSvgs.sheild,
                        title: "All Risks - ICC A",
                        warning:
                            "Covers loss or damage to your goods while they are in transit from almost all causes",
                        price: "${newValue.toStringAsFixed(0)} Declared Value",
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
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) =>
                                  EditComprehensiveCoverageDialog(
                                carName: 'Acura MDX',
                                carReg: 'ALC2348',
                                initialSumInsured: 50000,
                                onUpdate: (updatedValue) {
                                  setState(() {
                                    newValue = updatedValue;
                                  });
                                  debugPrint('Updated sum insured: $newValue');
                                },
                              ),
                            );
                          },
                        ),
                        bulletPoints: const [
                          "Handling damage ",
                          "Accidents",
                          "Storms, fire",
                          "Theft",
                        ],
                      ),
                      2.height,
                      CoverageCard(
                        icon: AppSvgs.thairdparty,
                        title: "Named Perils - ICC B",
                        warning:
                            "Covers loss or damage to your goods caused by specified risks",
                        price: "${newValue2.toStringAsFixed(0)} Declared Value",
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
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) =>
                                  EditComprehensiveCoverageDialog(
                                titel: "Edit Third Party Fire and Theft",
                                subtitle:
                                    "Adjust coverage limits for the entire policy",
                                containerColor:
                                    Colors.amberAccent.withAlpha(20),
                                icon: AppSvgs.sheild,
                                carName: 'Third Party Fire and Theft',
                                initialSumInsured: 50000,
                                onUpdate: (updatedValue) {
                                  setState(() {
                                    newValue2 = updatedValue;
                                  });
                                  debugPrint('Updated sum insured: $newValue2');
                                },
                              ),
                            );
                          },
                        ),
                        bulletPoints: const [
                          "Fire or explosion ",
                          "Vessel grounding, sinking, collision",
                          "Earthquake, volcanic eruption, lightening ",
                          "Entry of Sea, Lake or river water"
                        ],
                      ),
                      2.height,
                      CoverageCard(
                        icon: AppSvgs.thairdparty,
                        title: "Basic Cover - ICC C",
                        warning: "Covers only major transport accidents",
                        price: "${newValue3.toStringAsFixed(0)} Declared Value",
                        isOn: isOnFullThirdParty,
                        onChanged: (val) {
                          setState(() {
                            isOnFullThirdParty = val;
                          });
                        },
                        footerIcon: IconButton(
                          icon: Icon(
                            Icons.edit,
                            size: 14.sp,
                            color: AppColors.primary,
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) =>
                                  EditComprehensiveCoverageDialog(
                                carName: 'Acura MDX',
                                carReg: 'ALC2348',
                                initialSumInsured: 50000,
                                onUpdate: (updatedValue) {
                                  setState(() {
                                    newValue3 = updatedValue;
                                  });
                                  debugPrint('Updated sum insured: $newValue3');
                                },
                              ),
                            );
                          },
                        ),
                        bulletPoints: const [
                          "fire or Explosion",
                          "Vessel grounding, sinking or collision",
                          "Overturning or Derailment of land conveyance ",
                        ],
                      ),
                      2.height,

                      CustomButton(
                        label: "Save",
                        onPressed: () {},
                      ),
                      1.height,
                      CustomButton(
                        backgroundColor: AppColors.white,
                        borderColor: AppColors.primary,
                        textcolor: AppColors.primary,
                        label: "Remove Service",
                        onPressed: () {},
                      ),
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
