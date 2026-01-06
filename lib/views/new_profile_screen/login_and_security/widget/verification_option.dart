import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';

class VerificationOption extends StatelessWidget {
  final bool isSelected;
  final String title;
  final String subtitle;
  final String statusText;
  final String iconPath;
  final VoidCallback onTap;

  const VerificationOption({
    super.key,
    required this.isSelected,
    required this.title,
    required this.subtitle,
    required this.statusText,
    required this.iconPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary.withAlpha(20) : AppColors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.cBEBEBE,
            width: 1,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(iconPath),
            4.width,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: Textfontstyle.TextStyle12w500c212121poppins
                            .copyWith(
                                fontSize: 14,
                                color: AppColors.c5D5D5D,
                                fontWeight: FontWeight.bold),
                      ),
                      2.width,
                      if (statusText.isNotEmpty)
                        Text(
                          statusText,
                          style: Textfontstyle.TextStyle12w500c212121poppins
                              .copyWith(
                                  fontSize: 6.sp,
                                  color: isSelected
                                      ? AppColors.primary
                                      : AppColors.c707070),
                        ),
                    ],
                  ),
                  .5.height,
                  Text(
                    subtitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Textfontstyle.TextStyle14w400c212121poppins.copyWith(
                      fontSize: 10.sp,
                      color: AppColors.c707070,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
