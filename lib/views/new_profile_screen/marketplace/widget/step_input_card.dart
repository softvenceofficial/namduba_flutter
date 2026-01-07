import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';

class StepInputCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String hintText;
  final bool isLastStep;

  final TextEditingController controller;
  final double progress;
  final VoidCallback? onBack;
  final VoidCallback onClear;
  final VoidCallback? onNext;

  final Widget? customField;

  const StepInputCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.hintText,
    required this.isLastStep,
    required this.controller,
    required this.progress,
    this.onBack,
    required this.onClear,
    this.onNext,
    this.customField,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: Textfontstyle.TextStyle12w500c212121poppins.copyWith(
                        color: AppColors.c343434,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp)),
                0.8.height,
                Text(subtitle,
                    style: Textfontstyle.TextStyle12w500c212121poppins.copyWith(
                        color: AppColors.c707070,
                        fontSize: 8.sp,
                        fontWeight: FontWeight.bold)),
              ],
            ),

            const SizedBox(height: 12),

            // SHOW customField if exists, otherwise default text field
            customField ??
                CustomTextField(
                  controller: controller,
                  hintText: hintText,
                  borderRadius: 16,
                  readOnly: false,
                ),

            const SizedBox(height: 14),

            ///PROGRESS BAR
            LinearProgressIndicator(
              borderRadius: BorderRadius.circular(8),
              value: progress,
              minHeight: 11,
              backgroundColor: AppColors.secondary,
              color: AppColors.primary,
            ),

            2.height,

            ///button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// BACK
                if (onBack != null) ...[
                  InkWell(
                    onTap: onBack,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.primary,
                      ),
                      child: const Icon(
                        Icons.chevron_left,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  2.width,
                ],

                /// CLEAR
                InkWell(
                  onTap: onClear,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.primary.withAlpha(20)),
                    child: const Icon(
                      Icons.close,
                      color: AppColors.primary,
                    ),
                  ),
                ),
                2.width,

                /// NEXT / DONE
                InkWell(
                  onTap: onNext,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.primary,
                    ),
                    child: Icon(
                      isLastStep ? Icons.check : Icons.chevron_right,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
