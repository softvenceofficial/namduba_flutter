import 'package:nanduba/export.dart';

class RecommendedForYou extends StatelessWidget {
  const RecommendedForYou({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: AppColors.lightGrey,
            endIndent: 2.w,
          ),
        ),
        Text(
          AppText.recommendedForYou.toUpperCase(),
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.grey.withOpacity(0.7),
              fontWeight: FontWeight.w600),
        ),
        Expanded(
          child: Divider(
            color: AppColors.lightGrey,
            indent: 2.w,
          ),
        ),
      ],
    );
  }
}
