import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';

class LabelActionRow extends StatelessWidget {
  final String label;
  final String actionText;
  final VoidCallback? onTap;

  const LabelActionRow({
    super.key,
    required this.label,
    required this.actionText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Textfontstyle.TextStyle14w500c212121poppins.copyWith(
            fontSize: 12.sp,
            color: AppColors.textColor,
          ),
        ),
        // if (onTap != null)
        InkWell(
          onTap: onTap,
          child: Text(
            actionText,
            style: Textfontstyle.TextStyle14w500c212121poppins.copyWith(
              decoration: TextDecoration.underline,
              decorationColor: AppColors.textColor,
              fontSize: 12.sp,
              color: AppColors.textColor,
            ),
          ),
        ),
      ],
    );
  }
}
