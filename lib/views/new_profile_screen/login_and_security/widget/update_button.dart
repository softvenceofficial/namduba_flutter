import 'dart:ui';

import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';

class UpdateButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const UpdateButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 35,
        width: 83,
        decoration: BoxDecoration(
          color: AppColors.cCA2626,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          title,
          style: Textfontstyle.TextStyle12w500c212121poppins.copyWith(
            fontSize: 7.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
