 
import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';

class AboutFeedbackTabBar extends StatefulWidget {
  final Function(int) onTabChanged;  
  final String? aboutText;  
  final String? feedbackText;  
  final double? separatorWidth;  

  const AboutFeedbackTabBar({
    super.key,
    required this.onTabChanged,
    this.aboutText,
    this.feedbackText,
    this.separatorWidth,  
  });

  @override
  State<AboutFeedbackTabBar> createState() => _AboutFeedbackTabBarState();
}

class _AboutFeedbackTabBarState extends State<AboutFeedbackTabBar> {
  int selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      selectedIndex = index;
    });

    widget.onTabChanged(index);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // About button
        GestureDetector(
          onTap: () => _onTap(0),
          child: Container(
            decoration: BoxDecoration(
              color:
                  selectedIndex == 0 ? AppColors.cCA2626 : Colors.transparent,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Text(
                widget.aboutText ?? AppText.about,
                style: Textfontstyle.TextStyle14w500c212121poppins.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                  color: selectedIndex == 0
                      ? AppColors.white
                      : AppColors.bottomNav,
                ),
              ),
            ),
          ),
        ),

        SizedBox(width: widget.separatorWidth ?? 2.w),

        // Feedback button
        GestureDetector(
          onTap: () => _onTap(1),
          child: Container(
            decoration: BoxDecoration(
              color:
                  selectedIndex == 1 ? AppColors.cCA2626 : Colors.transparent,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Text(
                widget.feedbackText ?? AppText.feedback,
                style: Textfontstyle.TextStyle14w500c212121poppins.copyWith(
                  fontSize: 14.sp,
                  color: selectedIndex == 1
                      ? AppColors.white
                      : AppColors.bottomNav,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
