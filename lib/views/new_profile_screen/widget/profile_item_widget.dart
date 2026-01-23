import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/constants/textfontstyle.dart';

class SwitchAccountItemWidget extends StatelessWidget {
  final String title;
  final String svgIcon;
  final VoidCallback onTap;
  final bool showProgress;

  const SwitchAccountItemWidget({
    super.key,
    required this.title,
    required this.svgIcon,
    required this.onTap,
    this.showProgress = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomContainer(
        borderRadius: 20,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: AppColors.cCA2626.withAlpha(20),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        svgIcon,
                        color: AppColors.cCA2626,
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ),
                  2.width,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: Textfontstyle.TextStyle12w500c212121poppins
                            .copyWith(
                                fontWeight: FontWeight.w600, fontSize: 12.sp),
                      ),
                      if (showProgress) ...[
                        8.width,
                        Image.asset(
                          AppImages.Red_dot,
                          height: 8,
                          width: 8,
                        ),
                        4.width,
                        Text(
                          '48% completed',
                          style: Textfontstyle.TextStyle12w500c212121poppins
                              .copyWith(
                            color: AppColors.green,
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.bottomNav),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.chevron_right,
                  size: 12.sp,
                  color: AppColors.bottomNav,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
