import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/create_request/compare_estimates/request_estimate_item_detail/component/widget/custom_switch.dart';
import 'package:nanduba/views/new_profile_screen/marketplace/widget/text_with_red_dot.dart';

class CoverageCard extends StatelessWidget {
  final String icon;
  final String title;
  final String warning;

  final String? price;
  final String? optional;

  final bool isOn;
  final ValueChanged<bool> onChanged;
  final List<String>? bulletPoints;

  final Widget? footerIcon; // optional footer icon

  const CoverageCard({
    super.key,
    required this.icon,
    required this.title,
    required this.warning,
    this.price,
    this.optional,
    required this.isOn,
    required this.onChanged,
    this.bulletPoints,
    this.footerIcon,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      borderRadius: 20,
      vpadding: 14,
      hpadding: 14,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Header Row
          Row(
            children: [
              Container(
                height: 58,
                width: 58,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.primary.withAlpha(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    icon,
                    color: AppColors.primary,
                  ),
                ),
              ),
              4.width,
              Text(
                title,
                style: Textfontstyle.TextStyle14w400midgreypoppins.copyWith(
                  fontSize: 12.sp,
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              CustomSwitch(
                value: isOn,
                onChanged: onChanged,
              ),
            ],
          ),

          if (optional != null) ...[
            1.height,
            Text(
              optional!,
              style: Textfontstyle.TextStyle14w400midgreypoppins.copyWith(
                fontSize: 10.sp,
                color: AppColors.textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],

          1.height,

          /// Description
          Text(
            warning,
            style: Textfontstyle.TextStyle14w400midgreypoppins.copyWith(
              fontSize: 10.sp,
              color: AppColors.midDarkGrey,
              fontWeight: FontWeight.w600,
            ),
          ),

          1.2.height,

          /// 🔴 Red dot list
          if (bulletPoints != null && bulletPoints!.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: bulletPoints!
                  .map((text) => Padding(
                        padding: const EdgeInsets.all(1),
                        child: textwithreddot(text: text),
                      ))
                  .toList(),
            ),

          1.2.height,

          /// Footer
          Row(
            children: [
              Expanded(
                child: Text(
                  price ?? '50,000 Sum Insured',
                  style: Textfontstyle.TextStyle12w500c212121poppins.copyWith(
                      fontSize: 10.sp,
                      color: AppColors.primary,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
              if (footerIcon != null) ...[
                2.width,
                footerIcon!,
              ],
            ],
          ),
        ],
      ),
    );
  }
}
