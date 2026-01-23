import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';

class VehicleDetailsPopup extends StatefulWidget {
  final String vehicleName;
  final String message;
  final bool isVisible;
  final VoidCallback onClose;
  final VoidCallback ontap;

  const VehicleDetailsPopup({
    super.key,
    required this.ontap,
    required this.vehicleName,
    required this.message,
    this.isVisible = true,
    required this.onClose,
  });

  @override
  State<VehicleDetailsPopup> createState() => _VehicleDetailsPopupState();
}

class _VehicleDetailsPopupState extends State<VehicleDetailsPopup> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.isVisible,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.primary, width: 1),
          color: const Color(0xFFFCF2F2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title and close button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Get your ${widget.vehicleName} details",
                  style: Textfontstyle.TextStyle16w500c212121poppins.copyWith(
                      color: AppColors.textColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: widget.onClose,
                  child: SvgPicture.asset(
                    AppSvgs.closecircle,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Message (description)
            Text(
              widget.message,
              style: Textfontstyle.TextStyle14w400midgreypoppins.copyWith(
                color: AppColors.midGrey,
                fontSize: 10.sp,
              ),
            ),
            const SizedBox(height: 16),
            // Look up button
            InkWell(
              onTap: widget.ontap,
              child: Container(
                constraints: const BoxConstraints(maxWidth: 200, minWidth: 50),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  color: AppColors.red,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    "Look up my ${widget.vehicleName}",
                    style: Textfontstyle.TextStyle16w500c212121poppins.copyWith(
                        color: AppColors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
