import '../../../../export.dart';
import '../../../../widgets/core/my_text.dart';

class ShopForRideItemContainer extends StatelessWidget {
  final String itemName;
  final String itemPic;
  final String price;
  final void Function()? onTap;
  const ShopForRideItemContainer({super.key, required this.itemName, required this.itemPic, required this.price, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
       margin: EdgeInsets.only(right: 3.w),
      child: GestureDetector(
        onTap: onTap,
        child: CustomContainer(

            vpadding: 1.2.h,
            hpadding: 3.w,
            color: Colors.white,
            borderRadius: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 14.2.h,
                  // width: 148,
                  width: 36.w,
                  padding: EdgeInsets.all(10),

                  decoration: BoxDecoration(
                      color: AppColors.midLightGrey,
                      borderRadius: BorderRadius.circular(16),
                  ),
                  child: Image.asset(itemPic),
                ),
                1.height,
                SizedBox(
                    width: 36.w,
                    child: MyText(text: itemName,fontSize: 10.sp,fontWeight: FontWeight.w500,color: AppColors.textColor,maxLines: 2,)),
                1.height,
                MyText(text: "\$$price",color: AppColors.primary,fontWeight: FontWeight.w600,fontSize: 10.sp,),
                1.height,
                Container(
                  width: 36.w,
                  padding: EdgeInsets.symmetric(vertical: 0.5.h),
                  decoration: BoxDecoration(
                      color: AppColors.lightgreen3,
                      borderRadius: BorderRadius.circular(30)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check_circle_outline_rounded,color: AppColors.green3,size: 18,),
                      1.width,
                      MyText(text: "Fits",fontWeight: FontWeight.w600,fontSize: 10.sp,color: AppColors.green3,),
                    ],
                  ),
                )

              ],
            )),
      ),
    );

  }
}
