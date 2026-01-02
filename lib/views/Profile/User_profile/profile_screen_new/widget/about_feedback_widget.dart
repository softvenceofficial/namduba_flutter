import 'package:flutter/material.dart';
import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';

class AboutFeedbackTabBar extends StatefulWidget {
  final Function(int) onTabChanged; // Callback to parent

  const AboutFeedbackTabBar({super.key, required this.onTabChanged});

  @override
  State<AboutFeedbackTabBar> createState() => _AboutFeedbackTabBarState();
}

class _AboutFeedbackTabBarState extends State<AboutFeedbackTabBar> {
  int selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      selectedIndex = index;
    });

    // Notify parent which tab is selected
    widget.onTabChanged(index);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // About button (selected/unselected style preserved)
        GestureDetector(
          onTap: () => _onTap(0),
          child: CustomContainer(
            color: selectedIndex == 0 ? AppColors.cCA2626 : Colors.transparent,
            borderRadius: 30,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppText.about,
                    style: Textfontstyle.TextStyle14w500c212121poppins.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                      color: selectedIndex == 0 ? AppColors.white : AppColors.bottomNav,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        2.width,

         
        GestureDetector(
          onTap: () => _onTap(1),
          child: CustomContainer(
            color: selectedIndex == 1 ? AppColors.cCA2626 : Colors.transparent,
            borderRadius: 30,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppText.feedback,
                    style: Textfontstyle.TextStyle14w500c212121poppins.copyWith(
                      fontSize: 14.sp,
                      color: selectedIndex == 1 ? AppColors.white : AppColors.bottomNav,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
