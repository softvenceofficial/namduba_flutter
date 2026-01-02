import 'package:nanduba/export.dart';

class WantRenewal extends StatelessWidget {
  const WantRenewal({super.key, required this.buttonOnpressed});
  final VoidCallback buttonOnpressed;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      vpadding: 1.h,
      hpadding: 2.w,
      borderRadius: 15.sp,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomContainer(
            color: AppColors.lightGrey.withAlpha(30),
            vpadding: 1.5.h,
            hpadding: 3.5.w,
            borderRadius: 12.sp,
            child: SvgPicture.asset(AppSvgs.renewable),
          ),
          SizedBox(
            width: 40.w,
            child: Text(
              AppText.wantRenewal.trim(),
              maxLines: 2,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          5.width,
          CustomButton(
              width: 22.w,
              height: 5.h,
              labelFontSize: 14.sp,
              label: AppText.go,
              onPressed: buttonOnpressed),
        ],
      ),
    );
  }
}
