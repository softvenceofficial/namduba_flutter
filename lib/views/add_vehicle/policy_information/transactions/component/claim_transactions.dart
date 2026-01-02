import 'package:nanduba/views/add_vehicle/policy_information/claims/claim_details.dart';

import '../../../../../export.dart';
import '../../../../../widgets/core/my_text.dart';

class ClaimTransactions extends StatelessWidget {
  const ClaimTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: 2,
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          itemBuilder: (context, index) {
            return Column(
              children: [
                0.5.height,
                GestureDetector(
                  onTap: () {
                    AppCustomNavigator.push(context, ClaimDetails());
                  },
                  child: CustomContainer(
                    hpadding: 4.w,
                    vpadding: 2.h,
                    borderRadius: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(13),
                              decoration: BoxDecoration(
                                color: AppColors.secondary,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: SvgPicture.asset(
                                AppSvgs.sheild,
                                color: AppColors.primary,
                                height: 3.7.h,
                              ),
                            ),
                            3.width,
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyText(
                                    text: "Single Vehicle Accident Claim",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 11.sp,
                                  ),
                                  1.height,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      MyText(
                                        text: "Accident Date: 10 Mar 2024",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 9.sp,
                                        color: AppColors.grey,
                                      ),
                                      SvgPicture.asset(
                                        AppSvgs.arrowCircleRight,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        0.5.height,
                        Divider(
                          color: AppColors.border,
                        ),
                        1.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 0.6.h, horizontal: 2.w),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: AppColors.lightGreen,
                                  borderRadius: BorderRadius.circular(8)),
                              child: FittedBox(
                                child: MyText(
                                  text: "Completed",
                                  color: AppColors.green3,
                                  fontSize: 8.sp,
                                ),
                              ),
                            ),
                            MyText(
                              text: "LVN 7325",
                              fontWeight: FontWeight.w500,
                              fontSize: 11.sp,
                              color: AppColors.textColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                2.height,
              ],
            );
          }),
    );
  }
}
