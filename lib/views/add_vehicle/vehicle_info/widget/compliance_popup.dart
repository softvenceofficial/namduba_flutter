import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/add_vehicle/vehicle_info/vehicle_info.dart';

class CompliancePopup extends StatefulWidget {
  const CompliancePopup({super.key});

  @override
  State<CompliancePopup> createState() => _CompliancePopupState();
}

class _CompliancePopupState extends State<CompliancePopup> {
  bool isVinMode = false;

  final TextEditingController regController =
      TextEditingController(text: "ABP1609ZM");

  final TextEditingController vinController =
      TextEditingController(text: "1HGBH41JXMN1091867");

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          /// HEADER
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  isVinMode
                      ? "Looking For Your Corolla Specs?"
                      : "Looking For Your Corolla’s Details?",
                  style: Textfontstyle.TextStyle14w400c212121poppins.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 14.sp,
                  ),
                ),
                GestureDetector(
                  onTap: () => AppCustomNavigator.pop(context),
                  child: SvgPicture.asset(AppSvgs.closecircle),
                )
              ],
            ),
          ),

          const Divider(color: AppColors.cBEBEBE),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// DESCRIPTION
                if (!isVinMode)
                  Text(
                    "In order to find the details about your Corolla, we need to lock up your registration details",
                    style: Textfontstyle.TextStyle12w500c212121poppins.copyWith(
                      color: AppColors.midGrey,
                      fontSize: 10.sp,
                    ),
                  ),

                2.height,

                /// VIN IMAGE
                if (isVinMode) ...[
                  Center(
                    child: Column(
                      children: [
                        Image.asset(
                          AppImages.carvin,
                          height: 80,
                          width: 100,
                        ),
                      ],
                    ),
                  ),
                  2.height,
                ],

                /// LABEL
                Text(
                  isVinMode ? "VIN Number" : "Registration Number",
                  style: Textfontstyle.TextStyle12w500c212121poppins.copyWith(
                    color: AppColors.grey,
                    fontSize: 10.sp,
                  ),
                ),

                1.height,

                /// INPUT FIELD
                CustomTextField(
                  readOnly: true,
                  borderRadius: 16,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SvgPicture.asset(
                      AppSvgs.passporticon,
                    ),
                  ),
                  suffixIcon: const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 18,
                  ),
                  controller: isVinMode ? vinController : regController,
                  style: Textfontstyle.TextStyle12w500c212121poppins,
                ),

                3.height,

                /// SEARCH BUTTON
                CustomButton(
                  label: "Search",
                  onPressed: () {
                    // search logic
                    AppCustomNavigator.push(context, VehicleInfoDetails());
                  },
                ),

                2.height,

                /// SWITCH MODE
                Center(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isVinMode = !isVinMode;
                      });
                    },
                    child: Text(
                      isVinMode ? "Use Reg. Number" : "Use VIN Instead",
                      style:
                          Textfontstyle.TextStyle12w500c212121poppins.copyWith(
                        color: AppColors.cCA2626,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),

                1.height,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
