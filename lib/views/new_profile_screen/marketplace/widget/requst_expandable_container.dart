import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';

class RequestExpandableContainer extends StatelessWidget {
  final bool isExpanded;
  final VoidCallback onToggle;
  final List<Widget> children;

  const RequestExpandableContainer({
    super.key,
    required this.isExpanded,
    required this.onToggle,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: isExpanded ? 16 : 20,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withAlpha(10),
            blurRadius: 10,
            spreadRadius: 10,
          )
        ],
        color: AppColors.white,
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "03 Estimates",
                style: Textfontstyle.TextStyle12w500c212121poppins.copyWith(
                    color: AppColors.primary, fontSize: 12.sp),
              ),

              /// Button hidden when expanded
              if (!isExpanded)
                InkWell(
                  onTap: onToggle,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColors.primary,
                    ),
                    child: Text(
                      "View Details",
                      style:
                          Textfontstyle.TextStyle12w500c212121poppins.copyWith(
                              color: AppColors.white),
                    ),
                  ),
                ),
            ],
          ),

          /// Animated expand / collapse content
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: isExpanded
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      1.height,
                      ...children,
                    ],
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
