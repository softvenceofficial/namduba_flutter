import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/new_profile_screen/your_garage/review_details_screen.dart';
import 'package:nanduba/views/new_profile_screen/your_garage/widget/drop_down_model.dart';
import 'package:nanduba/views/new_profile_screen/your_garage/widget/drop_down_widget.dart';

class EnterVehicleDetails extends StatefulWidget {
  const EnterVehicleDetails({super.key});

  @override
  State<EnterVehicleDetails> createState() => _EnterVehicleDetailsState();
}

class _EnterVehicleDetailsState extends State<EnterVehicleDetails> {
  late CarBrandModel selectedCarBrand = carBrandList.first;
  late CarModel selectedCarModel = carModelList.first;
  late String selectedCarYear = carYearList.last;
  late CarVariantModel selectedCarVariant = corollaVariants.first;
  late CarTypeModel selectedCarType = carTypeList.first;
  late ChassisModel selectedChassis = chassisList.first;
  late EngineModel selectedEngine = engineList.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppbar(title: AppText.entervehicled),
                3.2.height,
                Text(
                  "Make ",
                  style: Textfontstyle.TextStyle14w400greypoppins,
                ),
                0.5.height,
                CustomPrefixDropdown<CarBrandModel>(
                  value: selectedCarBrand,
                  items: carBrandList,
                  prefix: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      AppSvgs.carIcon,
                      color: AppColors.primary,
                    ),
                  ),
                  itemBuilder: (item) => Text(
                    item.name,
                    style: Textfontstyle.TextStyle14w500c212121poppins.copyWith(
                        fontSize: 12.sp),
                  ),
                  onChanged: (value) {
                    setState(() => selectedCarBrand = value!);
                    // debugPrint("seleted car brand $selectedCarBrand");
                  },
                ),
                3.2.height,
                Text(
                  "Model ",
                  style: Textfontstyle.TextStyle14w400greypoppins,
                ),
                0.5.height,
                CustomPrefixDropdown<CarModel>(
                  value: selectedCarModel,
                  items: carModelList,
                  prefix: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      AppSvgs.carIcon,
                      color: AppColors.primary,
                    ),
                  ),
                  itemBuilder: (item) => Text(
                    item.name,
                    style: Textfontstyle.TextStyle14w500c212121poppins.copyWith(
                        fontSize: 12.sp),
                  ),
                  onChanged: (value) {
                    setState(() => selectedCarModel = value!);
                  },
                ),
                3.2.height,
                Text(
                  "Year",
                  style: Textfontstyle.TextStyle14w400greypoppins,
                ),
                0.5.height,
                CustomPrefixDropdown<String>(
                  value: selectedCarYear,
                  items: carYearList,
                  prefix: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(AppSvgs.calendar),
                  ),
                  itemBuilder: (item) => Text(
                    item,
                    style: Textfontstyle.TextStyle14w500c212121poppins.copyWith(
                        fontSize: 12.sp),
                  ),
                  onChanged: (value) {
                    setState(() => selectedCarYear = value!);
                  },
                ),
                3.2.height,
                Text(
                  "Variant ",
                  style: Textfontstyle.TextStyle14w400greypoppins,
                ),
                0.5.height,
                CustomPrefixDropdown<CarVariantModel>(
                  value: selectedCarVariant,
                  items: corollaVariants,
                  prefix: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      AppSvgs.carIcon,
                      color: AppColors.primary,
                    ),
                  ),
                  itemBuilder: (item) => Text(
                    item.name,
                    style: Textfontstyle.TextStyle14w500c212121poppins.copyWith(
                        fontSize: 12.sp),
                  ),
                  onChanged: (value) {
                    setState(() => selectedCarVariant = value!);
                  },
                ),
                3.2.height,
                Text(
                  "Type ",
                  style: Textfontstyle.TextStyle14w400greypoppins,
                ),
                0.5.height,
                CustomPrefixDropdown<CarTypeModel>(
                  value: selectedCarType,
                  items: carTypeList,
                  prefix: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      AppSvgs.carIcon,
                      color: AppColors.primary,
                    ),
                  ),
                  itemBuilder: (item) => Text(
                    item.name,
                    style: Textfontstyle.TextStyle14w500c212121poppins.copyWith(
                        fontSize: 12.sp),
                  ),
                  onChanged: (value) {
                    setState(() => selectedCarType = value!);
                  },
                ),
                2.height,
                Text(
                  "Chassis",
                  style: Textfontstyle.TextStyle14w400greypoppins,
                ),
                0.5.height,
                CustomPrefixDropdown<ChassisModel>(
                  value: selectedChassis,
                  items: chassisList,
                  prefix: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      AppSvgs.carIcon,
                      color: AppColors.primary,
                    ),
                  ),
                  itemBuilder: (item) => Text(
                    item.name,
                    style: Textfontstyle.TextStyle14w500c212121poppins.copyWith(
                      fontSize: 12.sp,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() => selectedChassis = value!);
                  },
                ),
                3.2.height,
                Text(
                  "Engine",
                  style: Textfontstyle.TextStyle14w400greypoppins,
                ),
                0.5.height,
                CustomPrefixDropdown<EngineModel>(
                  value: selectedEngine,
                  items: engineList,
                  prefix: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      AppSvgs.engine,
                      color: AppColors.primary,
                    ),
                  ),
                  itemBuilder: (item) => Text(
                    item.name,
                    style: Textfontstyle.TextStyle14w500c212121poppins.copyWith(
                      fontSize: 12.sp,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() => selectedEngine = value!);
                  },
                ),
                4.1.height,
                CustomButton(
                  label: AppText.addVehicle,
                  onPressed: () {
                    AppCustomNavigator.push(
                        context, const ReviewDetailsScreen());
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
