import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/new_profile_screen/your_garage/add_a_vehicle_screen.dart';

class AddVehicleScreen extends StatefulWidget {
  const AddVehicleScreen({super.key});

  @override
  State<AddVehicleScreen> createState() => _AddVehicleScreenState();
}

class _AddVehicleScreenState extends State<AddVehicleScreen> {
  // Track the selected item
  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          width: double.infinity,
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppText.addVehicle,
                    style: Textfontstyle.TextStyle18w600c212121poppins.copyWith(
                        fontSize: 12.sp, color: AppColors.textColor),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    customBorder: const CircleBorder(),
                    child: Container(
                      height: 22,
                      width: 22,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.red,
                          width: 1.5,
                        ),
                      ),
                      padding: const EdgeInsets.all(4),
                      child: const Icon(
                        Icons.close,
                        color: AppColors.red,
                        size: 12,
                      ),
                    ),
                  )
                ],
              ),
              0.7.height,
              Text(
                AppText.whattypeofvehicle,
                style: Textfontstyle.TextStyle14w400midgreypoppins,
              ),
              3.2.height,

              // First Row (Car or Truck & Motorbike)
              Row(
                children: [
                  Expanded(
                    child: SelectableVehicleItem(
                      image: AppImages.carImage,
                      label: "Car or Truck",
                      isSelected: selectedItem == "Car or Truck",
                      onTap: () {
                        setState(() {
                          selectedItem = "Car or Truck";
                        });
                        AppCustomNavigator.push(
                            context, const AddAVehicleScreen());
                      },
                    ),
                  ),
                  5.width, // space between squares
                  Expanded(
                    child: SelectableVehicleItem(
                      image: AppImages.bikeImage,
                      label: "Motorbike",
                      isSelected: selectedItem == "Motorbike",
                      onTap: () {
                        setState(() {
                          selectedItem = "Motorbike";
                        });
                        AppCustomNavigator.push(
                            context, const AddAVehicleScreen());
                      },
                    ),
                  ),
                ],
              ),

              3.height,

              // Second Row (Trailer & Tools)
              Row(
                children: [
                  Expanded(
                    child: SelectableVehicleItem(
                      image: AppImages.trailerImage,
                      label: "Trailer",
                      isSelected: selectedItem == "Trailer",
                      onTap: () {
                        setState(() {
                          selectedItem = "Trailer";
                        });
                        AppCustomNavigator.push(
                            context, const AddAVehicleScreen());
                      },
                    ),
                  ),
                  5.width,
                  Expanded(
                    child: SelectableVehicleItem(
                      image: AppImages.toolsImage,
                      label: "Plant or \nMachinery",
                      isSelected: selectedItem == "Plant or \nMachinery",
                      onTap: () {
                        setState(() {
                          selectedItem = "Plant or \nMachinery";
                        });
                        AppCustomNavigator.push(
                            context, const AddAVehicleScreen());
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SelectableVehicleItem extends StatelessWidget {
  final String image;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const SelectableVehicleItem({
    super.key,
    required this.image,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 141,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          border: Border.all(
            color: isSelected ? AppColors.cBEBEBE : AppColors.cBEBEBE,
            width: 1.5,
          ),
          color: isSelected ? AppColors.transparent : AppColors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              height: 33,
              width: 80,
            ),
            1.height,
            Text(
              label,
              style: Textfontstyle.TextStyle16w500c212121poppins.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w900,
                color: AppColors.c5D5D5D,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
