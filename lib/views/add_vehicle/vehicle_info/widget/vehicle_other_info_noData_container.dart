import 'package:nanduba/widgets/core/my_text.dart';

import '../../../../export.dart';

class VehicleOtherInfoNoDataContainer extends StatelessWidget {
  final String title;
  final String errorText;
  final bool showMore;
  final void Function()? onTap;
  const VehicleOtherInfoNoDataContainer({super.key, required this.title, required this.errorText,  this.showMore=true, this.onTap});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
        hpadding: 4.w,
        hMargin: 4.w,
        vpadding: 1.h,
        vMargin: 1.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                MyText(
                  text:title,
                  fontSize: 13.sp,
                  color: AppColors.textColor5,
                  fontWeight: FontWeight.w600,
                ),
                Spacer(),
                if(showMore==true)
                SvgPicture.asset(AppSvgs.more),
              ],
            ),
            1.height,
            GestureDetector(
              onTap: onTap,
              child: Row(
                children: [
                  Icon(
                    Icons.add,
                    size: 18,
                    color: AppColors.primary,
                  ),
                  MyText(
                    text: errorText,
                    fontSize: 11.sp,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}




class VehicleOtherInfoNodataContainer1 extends StatelessWidget {
  final String text;
  final String noDataText;
  final String errorText;
  final void Function()? onTap;
  const VehicleOtherInfoNodataContainer1({super.key, required this.text, required this.noDataText, required this.errorText, this.onTap});

  @override
  Widget build(BuildContext context) {
    return         CustomContainer(
        hpadding: 4.w,
        hMargin: 4.w,
        vMargin: 1.h,
        vpadding: 1.5.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(
              text: text,
              fontSize: 13.sp,
              color: AppColors.textColor,
              fontWeight: FontWeight.w600,
            ),
            1.height,
            MyText(
              text: noDataText,
              fontSize: 11.sp,
              color: AppColors.grey,
              fontWeight: FontWeight.w400,
            ),
            1.height,
            Divider(
              color: AppColors.border,
            ),
            1.height,
            GestureDetector(
              onTap:onTap,
              child: Row(
                children: [
                  Icon(
                    Icons.add,
                    size: 18,
                    color: AppColors.primary,
                  ),
                  MyText(
                    text: errorText,
                    fontSize: 11.sp,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                  ),
                ],
              ),
            ),
            1.height,
          ],
        ));

  }
}
