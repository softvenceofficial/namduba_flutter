import 'package:nanduba/export.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.sp),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppText.emailVerification,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              GestureDetector(
                onTap: () {
                  AppCustomNavigator.pop(context);
                },
                child: Container(
                  height: 2.h,
                  width: 2.h,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.primary,
                      ),
                      borderRadius: BorderRadius.circular(4.w)),
                  child: Icon(
                    Icons.close,
                    color: AppColors.primary,
                    size: 1.5.h,
                  ),
                ),
              ),
            ],
          ),
          const Divider(
            color: AppColors.lightGrey,
          ),
          2.height,
          Text(
            AppText.emailVerificationDesc,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: AppColors.grey),
          ),
          2.height,
          CustomButton(
              label: AppText.resend,
              width: 35.w,
              height: 5.5.h,
              onPressed: () {
                AppCustomNavigator.pop(context);
              })
        ],
      ),
    );
  }
}
