import 'package:nanduba/views/add_vehicle/vehicle_info/widget/detail_info_row_widget.dart';

import '../../../../../export.dart';
import '../../../../../widgets/core/my_text.dart';
import 'get_my_specs_sheet.dart';

class VehicleInfoSpecsComponent extends StatelessWidget {
  const VehicleInfoSpecsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
        hpadding: 4.w,
        hMargin: 4.w,
        vpadding: 1.5.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(
              text: "Specs",
              fontSize: 15.sp,
              color: AppColors.textColor,
              fontWeight: FontWeight.w600,
            ),
            1.height,
            MyText(
              text:
              "Upload your Corolla's specs using license plate or VIN",
              fontSize: 12.sp,
              color: AppColors.midDarkGrey,
              fontWeight: FontWeight.w400,
            ),
            2.height,
            CustomButton(
              label: "Find My Corolla",
              onPressed: () async {
                await showModalBottomSheet(
                    backgroundColor: AppColors.white,
                    context: context,
                    useSafeArea: true,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20.sp)),
                    ),
                    builder: (BuildContext context) {
                      return GetMySpecsSheet();
                    });
              },
              backgroundColor: Colors.transparent,
              foregroundColor: AppColors.primary,
            ),
            1.height,
          ],
        ));
  }
}


class SpecsDataContainer extends StatelessWidget {
  const SpecsDataContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
        hpadding: 4.w,
        hMargin: 4.w,
        vpadding: 1.5.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(
                  text: "Specs",
                  fontSize: 15.sp,
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w600,
                ),
                // Container(
                //   height: 5.h,
                //   width: 10.5.w,
                //   alignment: Alignment.center,
                //   decoration: BoxDecoration(
                //       color: AppColors.secondary,
                //       borderRadius: BorderRadius.circular(10)),
                //   child: SvgPicture.asset(AppSvgs.edit),
                // ),
              ],
            ),
            1.height,
            Divider(color: AppColors.border,),
            0.5.height,
           DetailInfoRow(title: "Engine", info: "2.7L Gas 14", errorText: ""),
           DetailInfoRow(title: "Cylinders", info: "4", errorText: ""),
           DetailInfoRow(title: "Fuel Type", info: "Gasoline", errorText: ""),
           DetailInfoRow(title: "Drive Type", info: "FWD", errorText: ""),
           DetailInfoRow(title: "Body Type", info: "SUV", errorText: ""),
           DetailInfoRow(title: "Color", info: "Black", errorText: ""),
            0.5.height,
          ],
        ));
  }
}
