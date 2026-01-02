import 'package:nanduba/widgets/core/my_text.dart';

import '../../../../export.dart';

class NoPurchaseBox extends StatelessWidget {
  const NoPurchaseBox({super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 5.w, ),
      height: 63.h,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.w),
          boxShadow: [
            BoxShadow(color: AppColors.shadow.withOpacity(0.2),blurRadius: 20,offset: Offset(0, 2))
          ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: 70.w,
              child: Image.asset(AppImages.cart)),
          5.height,
          MyText(
            text: "No purchases for this vehicle yet.",
            fontWeight: FontWeight.w500,
            fontSize: 11.sp,
            color: AppColors.grey,

          ),



        ],
      ),
    );
  }
}
