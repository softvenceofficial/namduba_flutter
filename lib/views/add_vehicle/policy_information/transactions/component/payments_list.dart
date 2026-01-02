import '../../../../../export.dart';
import '../../../../../widgets/core/my_text.dart';

class PaymentsList extends StatelessWidget {
  const PaymentsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomContainer(
          hpadding: 3.w,
          vpadding: 1.5.h,
          borderRadius: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    // margin: EdgeInsets.only(right: 15),
                    padding: EdgeInsets.all(13),
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: SvgPicture.asset(
                      AppSvgs.dollar2,
                      color: AppColors.primary,
                      height: 3.h,
                    ),
                  ),
                  3.width,
                  MyText(
                    text: "Upcoming Payment",
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                  ),
                  Spacer(),
                  MyText(
                    text: "\$250",
                    fontWeight: FontWeight.w600,
                    fontSize: 13.sp,
                    color: AppColors.primary,
                  ),
                ],
              ),
              2.height,
              CustomButton(
                label: "Pay Now",
                onPressed: () {},
              ),
              1.height,

            ],
          ),
        ),
        2.height,

        MyText(
          text: "Recent Transactions",
          fontWeight: FontWeight.w600,
          fontSize: 13.sp,
          color: AppColors.textColor,
        ),
        ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (context,index){
              return
                CustomContainer(
                  hpadding: 3.w,
                  vpadding: 1.2.h,
                  vMargin: 1.h,
                  borderRadius: 20,
                  child: Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        alignment: Alignment.center,
                        // // margin: EdgeInsets.only(right: 15),
                        // padding: EdgeInsets.all(13),
                        decoration: BoxDecoration(
                          color: AppColors.secondary,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: SvgPicture.asset(
                          AppSvgs.arrow,
                          color: AppColors.primary,
                        ),
                      ),
                      3.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            text: "Policy Purchase",
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                          ),
                          MyText(
                            text: "Jan 19, 2024",
                            fontWeight: FontWeight.w500,
                            fontSize: 10.sp,
                            color: AppColors.midDarkGrey,
                          ),
                        ],
                      ),
                      Spacer(),
                      MyText(
                        text: "\$250",
                        fontWeight: FontWeight.w600,
                        fontSize: 13.sp,
                        color: AppColors.primary,
                      ),
                    ],
                  ),
                );
            })

      ],
    );
  }
}
