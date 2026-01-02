import 'package:nanduba/export.dart';

// class SwipeableTabs extends StatelessWidget {
//   final Function(int) onChange;
//   final VoidCallback closeGesture;
//   final VoidCallback buttonOnpressed;
//   final int currentSlide;
//   final int itemCount;
//   final String titleText;
//   final String descriptionText;
//   final String buttonSvg;
//   final String buttonLabel;
//   final Widget tabSvg;

//   const SwipeableTabs(
//       {super.key,
//       required this.onChange,
//       required this.currentSlide,
//       required this.closeGesture,
//       required this.buttonOnpressed,
//       required this.titleText,
//       required this.descriptionText,
//       required this.buttonSvg,
//       required this.buttonLabel,
//       required this.tabSvg,
//       required this.itemCount});

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Padding(
//           padding: EdgeInsets.symmetric(vertical: 3.h),
//           child: SizedBox(
//             height: 18.h,
//             width: 92.w,
//             child: PageView.builder(
//               onPageChanged: onChange,
//               itemCount: itemCount,
//               itemBuilder: (BuildContext context, int index) {
//                 return Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 1.w),
//                   child: Container(
//                     padding: EdgeInsets.only(
//                       bottom: 0.h,
//                       right: 3.w,
//                       left: 3.w,
//                       top: 1.h,
//                     ),
//                     width: double.maxFinite,
//                     decoration: BoxDecoration(
//                         color: AppColors.midLightGrey,
//                         borderRadius: BorderRadius.circular(20.sp)),
//                     child: Column(
//                       children: [
//                         Align(
//                           alignment: Alignment.topRight,
//                           child: GestureDetector(
//                             onTap: closeGesture,
//                             child: SvgPicture.asset(
//                               AppSvgs.closeCircle,
//                             ),
//                           ),
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             SizedBox(
//                               width: 45.5.w,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     titleText.trim(),
//                                     maxLines: 1,
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .headlineSmall
//                                         ?.copyWith(fontSize: 14.sp),
//                                   ),
//                                   Text(
//                                     descriptionText.trim(),
//                                     maxLines: 2,
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .bodySmall
//                                         ?.copyWith(
//                                             color: AppColors.grey,
//                                             fontSize: 9.sp),
//                                   ),
//                                   1.5.height,
//                                   CustomButton(
//                                       icon: buttonSvg,
//                                       label: buttonLabel,
//                                       labelFontSize: 10.sp,
//                                       height: 5.h,
//                                       width: 36.w,
//                                       onPressed: buttonOnpressed)
//                                 ],
//                               ),
//                             ),
//                             SizedBox(width: 34.5.w, child: tabSvg)
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ),
//         Positioned.fill(
//             bottom: 0.h,
//             child: Align(
//               alignment: Alignment.bottomCenter,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: List.generate(itemCount, (index) {
//                   return AnimatedContainer(
//                     duration: const Duration(milliseconds: 300),
//                     width: currentSlide == index ? 20.sp : 7.sp,
//                     height: 1.h,
//                     margin: EdgeInsets.symmetric(horizontal: 1.w),
//                     decoration: BoxDecoration(
//                         color: currentSlide == index
//                             ? AppColors.primary
//                             : AppColors.lightdulPink,
//                         borderRadius: BorderRadius.circular(10.sp)),
//                   );
//                 }),
//               ),
//             ))
//       ],
//     );
//   }
// }
class SwipeableTabs extends StatefulWidget {
  final Function(int) onChange;
  final Function(int) onRemove;
  final VoidCallback buttonOnpressed;
  final int initialSlide;
  final List<TabData> tabs;

  const SwipeableTabs({
    super.key,
    required this.onChange,
    required this.onRemove,
    required this.buttonOnpressed,
    required this.initialSlide,
    required this.tabs,
  });

  @override
  SwipeableTabsState createState() => SwipeableTabsState();
}

class SwipeableTabsState extends State<SwipeableTabs> {
  late int currentSlide;
  late List<TabData> tabs;

  @override
  void initState() {
    super.initState();
    currentSlide = widget.initialSlide;
    tabs = List.from(widget.tabs);
  }

  void removeTab(int index) {
    setState(() {
      tabs.removeAt(index);
      if (currentSlide >= tabs.length) {
        currentSlide = tabs.length - 1;
      }
    });
    widget.onRemove(index);
  }

  @override
  Widget build(BuildContext context) {
    if (tabs.isEmpty) {
      return SizedBox.shrink(); // Return an empty widget when there are no tabs
    }

    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 3.h),
          child: SizedBox(
            height: 18.h,
            width: 92.w,
            child: PageView.builder(
              onPageChanged: (index) {
                setState(() {
                  currentSlide = index;
                });
                widget.onChange(index);
              },
              itemCount: tabs.length,
              itemBuilder: (BuildContext context, int index) {
                final tab = tabs[index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1.w),
                  child: Container(
                    padding: EdgeInsets.only(
                      bottom: 0.h,
                      right: 3.w,
                      left: 3.w,
                      top: 1.h,
                    ),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: AppColors.midLightGrey,
                        borderRadius: BorderRadius.circular(20.sp)),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                            onTap: () => removeTab(index),
                            child: SvgPicture.asset(
                              AppSvgs.closeCircle,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 45.5.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    tab.titleText.trim(),
                                    maxLines: 1,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(fontSize: 14.sp),
                                  ),
                                  Text(
                                    tab.descriptionText.trim(),
                                    maxLines: 2,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                            color: AppColors.grey,
                                            fontSize: 9.sp),
                                  ),
                                  1.5.height,
                                  CustomButton(
                                      icon: tab.buttonSvg,
                                      label: tab.buttonLabel,
                                      labelFontSize: 10.sp,
                                      height: 5.h,
                                      width: 36.w,
                                      onPressed: widget.buttonOnpressed)
                                ],
                              ),
                            ),
                            SizedBox(width: 34.5.w, child: tab.tabSvg)
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        if (tabs.length >
            1) // Only show indicators if there's more than one tab
          Positioned.fill(
              bottom: 0.h,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(tabs.length, (index) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: currentSlide == index ? 20.sp : 7.sp,
                      height: 1.h,
                      margin: EdgeInsets.symmetric(horizontal: 1.w),
                      decoration: BoxDecoration(
                          color: currentSlide == index
                              ? AppColors.primary
                              : AppColors.lightdulPink,
                          borderRadius: BorderRadius.circular(10.sp)),
                    );
                  }),
                ),
              ))
      ],
    );
  }
}

class TabData {
  final String titleText;
  final String descriptionText;
  final String buttonSvg;
  final String buttonLabel;
  final Widget tabSvg;

  TabData({
    required this.titleText,
    required this.descriptionText,
    required this.buttonSvg,
    required this.buttonLabel,
    required this.tabSvg,
  });
}
