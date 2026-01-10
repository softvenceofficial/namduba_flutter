import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/new_profile_screen/marketplace/screen/compare_estimate_screen.dart';
import 'package:nanduba/views/new_profile_screen/marketplace/widget/vehicel_info_card.dart';

class ReviewScreenmarkateplace extends StatefulWidget {
  const ReviewScreenmarkateplace({super.key});

  @override
  State<ReviewScreenmarkateplace> createState() =>
      _ReviewScreenmarkateplaceState();
}

class _ReviewScreenmarkateplaceState extends State<ReviewScreenmarkateplace> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              2.height,
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 0),
                child: CustomAppbar(
                  title: "Review",
                  svgIconNextToTitle: AppSvgs.addcircul,
                  padding: false,
                ),
              ),
              2.height,
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 0),
                child: CustomContainer(
                    hpadding: 18,
                    vpadding: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Motor Insurance',
                              style: Textfontstyle.TextStyle14w400greypoppins
                                  .copyWith(
                                      color: AppColors.textColor,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600),
                            ),
                            const Icon(
                              Icons.expand_less,
                              color: AppColors.textColor,
                            )
                          ],
                        ),
                        0.5.height,
                        Text(
                          "Quantity 3 ",
                          style: Textfontstyle.TextStyle12w500c212121poppins
                              .copyWith(
                                  color: AppColors.midDarkGrey,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.normal),
                        ),
                        1.height,
                        const Divider(
                          color: AppColors.cBEBEBE,
                          thickness: 1,
                        ),
                        0.5.height,
                        const VehicleInfoCardContent(
                          brandName: "BMW",
                          vehicleCode: "bmw7080",
                          vehicleUseLabel: "Vehicle use",
                          vehicleUseValue: "Personal use",
                        ),
                        1.height,
                        const Divider(
                          color: AppColors.cBEBEBE,
                          thickness: 1,
                        ),
                        0.5.height,
                        const VehicleInfoCardContent(
                          brandName: "BMW",
                          vehicleCode: "bmw7080",
                          vehicleUseLabel: "Vehicle use",
                          vehicleUseValue: "Personal use",
                        ),
                        1.height,
                        const Divider(
                          color: AppColors.cBEBEBE,
                          thickness: 1,
                        ),
                        0.5.height,
                        const VehicleInfoCardContent(
                          brandName: "Mwansa Biko",
                          vehicleCode: "mbiko27",
                          vehicleUseLabel: "Conviction record ",
                          vehicleUseValue: "None",
                        ),
                      ],
                    )),
              ),
              2.height,
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 0),
                child: CustomContainer(
                  hpadding: 18,
                  vpadding: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Vehicle Recovery',
                            style: Textfontstyle.TextStyle14w400greypoppins
                                .copyWith(
                                    color: AppColors.textColor,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600),
                          ),
                          const Icon(
                            Icons.expand_less,
                            color: AppColors.textColor,
                          ),
                        ],
                      ),
                      0.5.height,
                      Text(
                        "Quantity 1 ",
                        style: Textfontstyle.TextStyle12w500c212121poppins
                            .copyWith(
                                color: AppColors.midDarkGrey,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.normal),
                      ),
                      1.height,
                      const Divider(
                        color: AppColors.cBEBEBE,
                        thickness: 1,
                      ),
                      0.5.height,
                      const VehicleInfoCardContent(
                        brandName: "BMW",
                        vehicleCode: "bmw7080",
                        vehicleUseLabel: "Breakdown Location",
                        vehicleUseValue: "123 New Street,  Cape Town 504050",
                      ),
                      2.height,
                      Text(
                        'Towing Destination',
                        style: Textfontstyle.TextStyle12w500c212121poppins
                            .copyWith(
                          color: AppColors.midDarkGrey,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      0.5.height,
                      Text(
                        '123 New Street,  Polokwane 540987',
                        style: Textfontstyle.TextStyle12w500c212121poppins
                            .copyWith(
                          color: AppColors.textColor,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              4.height,
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 0),
                child: CustomButton(
                  borderColor: AppColors.primary,
                  foregroundColor: AppColors.white,
                  backgroundColor: AppColors.white,
                  textcolor: AppColors.primary,
                  label: "Add More Services",
                  onPressed: () {},
                ),
              ),
              6.3.height,
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.black.withAlpha(20),
                          blurRadius: 4,
                          spreadRadius: 02,
                          offset: Offset(0, 0))
                    ],
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(20))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: SvgPicture.asset(
                            AppSvgs.location,
                            height: 20,
                            width: 20,
                          ),
                        ),
                        Text(
                          "Location",
                          style: Textfontstyle.TextStyle12w500c212121poppins
                              .copyWith(
                            color: AppColors.textColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "Change",
                          style: Textfontstyle.TextStyle12w500c212121poppins
                              .copyWith(
                                  decoration: TextDecoration.underline,
                                  decorationColor: AppColors.primary,
                                  fontSize: 9.sp,
                                  color: AppColors.primary),
                        )
                      ],
                    ),
                    Text(
                      '45 Pondfield Rd W #1C',
                      style:
                          Textfontstyle.TextStyle12w500c212121poppins.copyWith(
                        color: AppColors.midDarkGrey,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    2.height,
                    CustomButton(
                      label: "Submit Request",
                      onPressed: () {
                        AppCustomNavigator.push(
                            context, const CompareEstimatesScreen());
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
