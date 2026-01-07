import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';

class VehicleInfoCardContent extends StatelessWidget {
  final String brandName;
  final String vehicleCode;
  final String vehicleUseLabel;
  final String vehicleUseValue;

  const VehicleInfoCardContent({
    super.key,
    required this.brandName,
    required this.vehicleCode,
    required this.vehicleUseLabel,
    required this.vehicleUseValue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// LEFT SIDE
            Row(
              children: [
                Text(
                  brandName,
                  style: Textfontstyle.TextStyle14w400greypoppins.copyWith(
                    color: AppColors.textColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                1.width,
                SvgPicture.asset(
                  AppSvgs.reddot,
                  height: 6,
                  width: 6,
                ),
                2.width,
                Text(
                  vehicleCode,
                  style: Textfontstyle.TextStyle12w500c212121poppins.copyWith(
                    color: AppColors.midDarkGrey,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),

            /// RIGHT SIDE ICONS
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.primary.withAlpha(20),
                  ),
                  child: SvgPicture.asset(AppSvgs.edit),
                ),
                2.width,
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.primary.withAlpha(20),
                  ),
                  child: SvgPicture.asset(AppSvgs.trash),
                ),
              ],
            ),
          ],
        ),
        0.5.height,
        Text(
          vehicleUseLabel,
          style: Textfontstyle.TextStyle12w500c212121poppins.copyWith(
            color: AppColors.midDarkGrey,
            fontSize: 10.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
        0.5.height,
        Text(
          vehicleUseValue,
          style: Textfontstyle.TextStyle12w500c212121poppins.copyWith(
            color: AppColors.textColor,
            fontSize: 10.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
