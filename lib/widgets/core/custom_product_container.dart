import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';

import 'my_text.dart';

class CustomProductContainer extends StatelessWidget {
  const CustomProductContainer({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.rating,
    this.vFits = false,
  });

  final String image;
  final String title;
  final String price;
  final String rating;
  final bool? vFits;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      vpadding: 1.5.h,
      hpadding: 3.w,
      vMargin: 2.1.h,
      borderRadius: 20.sp,
      child: Wrap(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.midLightGrey,
                  borderRadius: BorderRadius.circular(10.sp),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 2.5.h,
                          horizontal: 2.w,
                        ),
                        child: Image.asset(
                          image,
                          height: 10.h,
                          width: 46.w,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 1.h,
                      right: 2.w,
                      child: const FavouriteIcon(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 2.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        fit: FlexFit.loose,
                        child: Text(
                          title,
                          style: Textfontstyle.TextStyle12w500c212121poppins
                              .copyWith(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.bold,
                          ),
                          // Theme.of(context).textTheme.bodyMedium?.copyWith(
                          //       fontWeight: FontWeight.w800,
                          //     ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      1.width,
                      Container(
                        alignment: Alignment.center,
                        height: 18,
                        width: 18,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.bottomNav,
                            )),
                        child: const Icon(
                          Icons.priority_high,
                          size: 12,
                          color: AppColors.bottomNav,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 1.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'K$price',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.primary,
                                  fontSize: 10.sp),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: 2.w),
                      if (rating != "")
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 0.7.h,
                            horizontal: 2.w,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.yellow,
                            borderRadius: BorderRadius.circular(20.sp),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.star_rounded,
                                color: AppColors.white,
                                size: 3.5.w,
                              ),
                              SizedBox(width: 0.2.w),
                              Text(
                                rating,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.white,
                                      fontSize: 9.sp,
                                    ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                  if (vFits == true) 1.height,
                  if (vFits == true)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: AppColors.lightGreen,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            CupertinoIcons.checkmark_alt_circle,
                            color: AppColors.green,
                            size: 18,
                          ),
                          1.width,
                          const MyText(
                            text: "Fits",
                            color: AppColors.green,
                          ),
                        ],
                      ),
                    )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
