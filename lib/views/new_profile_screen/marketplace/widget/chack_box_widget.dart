import 'package:flutter/material.dart';
import 'package:nanduba/constants/colors.dart';

class CustomCheckbox extends StatelessWidget {
  final bool isChecked;
  final Color? fillColor;
  final Color? tickColor;
  final double? size;
  final VoidCallback onTap;

  const CustomCheckbox({
    Key? key,
    required this.isChecked,
    this.fillColor,
    this.tickColor,
    required this.onTap,
    this.size = 25,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color:
              isChecked ? AppColors.primary.withAlpha(20) : Colors.transparent,
          border:
              isChecked ? null : Border.all(color: AppColors.cBEBEBE, width: 1),
          borderRadius: BorderRadius.circular(4),
        ),
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 500),
          opacity: isChecked ? 1 : 0,
          curve: Curves.easeInOut,
          child: Icon(
            Icons.check,
            size: size! * 0.7,
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}
