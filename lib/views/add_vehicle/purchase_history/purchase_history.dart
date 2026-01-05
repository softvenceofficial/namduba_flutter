import 'package:get/get.dart';
import 'package:nanduba/export.dart';
  import 'package:nanduba/views/add_vehicle/purchase_history/component/report_history.dart';
import 'package:nanduba/views/add_vehicle/purchase_history/purchase_history_orders.dart';
  import 'package:nanduba/widgets/core/my_text.dart';

class PurchaseHistory extends StatelessWidget {
  RxInt selectedButtonIndex = 1.obs;

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            2.height,
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 5.w),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: 5.5.h,
                        width: 5.5.h,
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.lightGrey),
                            shape: BoxShape.circle
                        ),
                        child: const Center(
                          child: Icon(Icons.arrow_back_ios_new_rounded),
                        ),
                      ),
                    ),
                    3.width,
                    Expanded(
                      child: MyText(
                        text: "Purchases & Reports",
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textColor5,
                      ),
                    ),
                    SvgPicture.asset(AppSvgs.settings,color: AppColors.border3,)
                  ]),
            ),
            Obx(() {
              return Column(
                children: [
                  2.height,
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 5.w),
                    child: Row(
                      children: [
                        CustomButton(
                          width: 32.w,
                          height: 4.h,
                          hPadding: 0,
                          vPadding: 0,
                          borderColor: AppColors.transparent,
                          label: "Purchases",
                          labelFontSize: 10.sp,
                          onPressed: () {
                            selectedButtonIndex.value = 1;
                          },

                          backgroundColor: selectedButtonIndex.value == 1
                              ? AppColors.primary
                              : Colors.transparent,
                          foregroundColor: selectedButtonIndex.value == 1
                              ? AppColors.white
                              : AppColors.grey,
                        ),
                        Spacer(),
                        CustomButton(
                          width: 32.w,
                          height: 4.h,
                          hPadding: 0,
                          vPadding: 0,
                          borderColor: AppColors.transparent,
                          label: "Reports",
                          labelFontSize: 10.sp,
                          onPressed: () {
                            selectedButtonIndex.value = 2;
                          },

                          backgroundColor: selectedButtonIndex.value == 2
                              ? AppColors.primary
                              : Colors.transparent,
                          foregroundColor: selectedButtonIndex.value == 2
                              ? AppColors.white
                              : AppColors.grey,

                        ),
                        Spacer(flex: 2,),

                      ],
                    ),
                  ),
                  1.height,

                ],
              );
            }),
            0.5.height,
            Obx(()=>
            selectedButtonIndex.value==1?
            PurchaseHistoryOrders():ReportHistory()
            ),
            // NoPurchaseBox(),

          ],
        ),
      ),
    );
  }
}
