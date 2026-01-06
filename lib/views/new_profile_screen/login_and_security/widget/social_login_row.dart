import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';

class SocialLoginRow extends StatelessWidget {
  final String platform;
  final String status;
  final VoidCallback? onTap;

  const SocialLoginRow({
    super.key,
    required this.platform,
    required this.status,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          platform,
          style: Textfontstyle.TextStyle14w500c212121poppins.copyWith(
            fontSize: 12.sp,
            color: AppColors.textColor,
          ),
        ),
        // if (onTap != null)
        InkWell(
          onTap: onTap,
          child: Text(
            status,
            style: Textfontstyle.TextStyle14w500c212121poppins.copyWith(
              fontSize: 9.sp,
              color: AppColors.textColor,
            ),
          ),
        ),
      ],
    );
  }
}
