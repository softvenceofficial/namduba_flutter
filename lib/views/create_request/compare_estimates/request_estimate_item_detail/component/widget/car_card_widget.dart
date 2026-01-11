import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';

class cardContainer extends StatelessWidget {
  final String title;
  final String subtitle;
  const cardContainer({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
        borderRadius: 20,
        vpadding: 14,
        hpadding: 14,
        child: Row(
          children: [
            Container(
              height: 58,
              width: 58,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.primary.withAlpha(20)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(
                  AppSvgs.carIcon,
                  color: AppColors.primary,
                  height: 30,
                  width: 30,
                ),
              ),
            ),
            4.width,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Textfontstyle.TextStyle14w400midgreypoppins.copyWith(
                      fontSize: 12.sp,
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  subtitle,
                  style: Textfontstyle.TextStyle14w400midgreypoppins.copyWith(
                      fontSize: 12.sp,
                      color: AppColors.midDarkGrey,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
            const Spacer(),
            const Icon(
              Icons.expand_more,
              color: AppColors.textColor,
            )
          ],
        ));
  }
}
