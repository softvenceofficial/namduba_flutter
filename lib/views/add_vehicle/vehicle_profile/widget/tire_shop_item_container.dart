import '../../../../export.dart';
import '../../../../widgets/core/my_text.dart';

class TireShopItemContainer extends StatelessWidget {
  final void Function()? onTap;
  const TireShopItemContainer({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(right: 3.w),
      child: GestureDetector(
        onTap: onTap,
        child: CustomContainer(
            borderRadius: 20,
            clipBehavior: Clip.hardEdge,
            width: 79.w,
            child: Row(
              children: [
                Padding(
                  padding:  EdgeInsets.only(left: 2.w,top: 1.h,bottom: 1.h),
                  child: Container(
                    // width: 82,
                    width:22.w,
                    // height: 88,
                    height: 12.h,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: AppColors.midLightGrey,
                        borderRadius: BorderRadius.circular(16)
                    ),
                    child: Image.asset(AppImages.tyre1),
                  ),
                ),
                Expanded(
                  child: Column(

                    children: [
                      1.3.height,
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 3.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            MyText(text: "MRF Road Tyres",fontSize: 12.sp,fontWeight: FontWeight.w500,color: AppColors.textColor,),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 1.5.w,vertical: 0.5.h),
                              decoration: BoxDecoration(
                                  color: AppColors.yellow,
                                  borderRadius: BorderRadius.circular(5.w)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.star_rate_rounded,color: Colors.white,size: 16,),
                                  MyText(
                                      text: "4.5",
                                      color: Colors.white,
                                      fontWeight:FontWeight.w600,fontSize: 10.sp),
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 3.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText(text: "4 tires",
                                    color: AppColors.midDarkGrey,
                                    fontWeight:FontWeight.w500,fontSize: 10.sp),
                                MyText(text: "235/55R18",
                                    color: AppColors.midDarkGrey,
                                    fontWeight:FontWeight.w500,fontSize: 10.sp)
                              ],
                            ),
                            MyText(text: "1.5k ratings",
                                color: AppColors.grey,
                                fontWeight:FontWeight.w500,fontSize: 9.sp)
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(left: 3.w),
                            child: MyText(text: "\$958.88",
                                color: AppColors.primary,
                                fontWeight:FontWeight.w600,fontSize: 12.sp),
                          ),
                          Container(
                            // margin: EdgeInsets.only(top: 1.h),
                            padding: EdgeInsets.symmetric(vertical: 1.2.h,horizontal: 5.w),

                            decoration: BoxDecoration(
                                color: AppColors.lightBlue,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),)

                            ),
                            child: MyText(text: "Top Rated",fontSize: 10.sp,fontWeight: FontWeight.w500,color: AppColors.blue2,),
                          )

                        ],
                      )
                    ],
                  ),
                ),

              ],
            )),
      ),
    );
  }
}
