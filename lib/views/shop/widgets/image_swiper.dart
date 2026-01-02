// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:nanduba/export.dart';

import '../../../widgets/core/my_text.dart';

class SwipeableImage extends StatelessWidget {
  final Function(int) onChange;
  final VoidCallback closeGesture;
  final VoidCallback buttonOnpressed;
  final int currentSlide;
  final int itemCount;
  final Widget tabSvg;
  final Widget? child; // Add this line
  final bool isIndicator;

  const SwipeableImage({
    super.key,
    required this.onChange,
    required this.closeGesture,
    required this.buttonOnpressed,
    required this.currentSlide,
    required this.itemCount,
    required this.tabSvg,
    this.child,
    required this.isIndicator,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 3.h),
          child: SizedBox(
            height: isIndicator ? 18.h : 12.h,
            width: 92.w,
            child: PageView.builder(
              onPageChanged: onChange,
              itemCount: itemCount,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1.w),
                  child: Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20.sp),
                    ),
                    child: Stack(
                      children: [
                        Center(
                          child: tabSvg,
                        ),
                        if (child != null)
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: child!,
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        isIndicator
            ? Positioned.fill(
                bottom: 0.h,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(itemCount, (index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: currentSlide == index ? 20.sp : 7.sp,
                            height: 1.h,
                            margin: EdgeInsets.symmetric(horizontal: 1.w),
                            decoration: BoxDecoration(
                              color: currentSlide == index
                                  ? AppColors.primary
                                  : AppColors.lightdulPink,
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          )
                        ],
                      );
                    }),
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}

class SwipeableContainer extends StatelessWidget {
  final Function(int) onChange;
  final VoidCallback closeGesture;
  final VoidCallback buttonOnpressed;
  final int currentSlide;
  final int itemCount;

  const SwipeableContainer({
    super.key,
    required this.onChange,
    required this.currentSlide,
    required this.closeGesture,
    required this.buttonOnpressed,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 92.w,
      height: 22.6.h, // Added height constraint to avoid size issue
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              onPageChanged: onChange,
              itemCount: itemCount,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 2),
                  child: CustomContainer(
                    hpadding: 4.w,
                    vpadding: 2.h,
                    borderRadius: 20,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 7.w,
                              backgroundColor: AppColors.black,
                              backgroundImage: AssetImage(AppImages.john),
                            ),
                            2.width,
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText(
                                  text: "John Doe",
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.black,
                                ),
                                0.5.height,
                                SizedBox(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.star_rounded,
                                        color: AppColors.yellow,
                                        size: 6.5.w,
                                      ),
                                      Icon(
                                        Icons.star_rounded,
                                        color: AppColors.yellow,
                                        size: 6.5.w,
                                      ),
                                      Icon(
                                        Icons.star_rounded,
                                        color: AppColors.yellow,
                                        size: 6.5.w,
                                      ),
                                      Icon(
                                        Icons.star_rounded,
                                        color: AppColors.yellow,
                                        size: 6.5.w,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        1.5.height,
                        Align(
                          alignment: Alignment.centerLeft,
                          child: MyText(
                            text:
                                "One disadvantage of Lorem Ipsum is that in Latin certain letters appear more frequently than others which creates a distinct visual impression.",
                            fontSize: 9.5.sp,
                            maxLines: 3,
                            fontWeight: FontWeight.w400,
                            color: AppColors.midGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(itemCount, (index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: currentSlide == index ? 20.sp : 7.sp,
                    height: 1.h,
                    margin: EdgeInsets.symmetric(horizontal: 1.w),
                    decoration: BoxDecoration(
                      color: currentSlide == index
                          ? AppColors.primary
                          : AppColors.lightdulPink,
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                  ),
                  SizedBox(height: 1.h),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
