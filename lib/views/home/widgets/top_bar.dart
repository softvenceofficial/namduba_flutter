// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:nanduba/constants/textfontstyle.dart';

import 'package:nanduba/export.dart';
import 'package:nanduba/views/Profile/User_profile/user_profile.dart';
import 'package:nanduba/views/home/widgets/profile_bottom_sheet.dart';

class TopBar extends StatefulWidget {
  final String city;
  VoidCallback onTap;
  TopBar({
    super.key,
    required this.city,
    required this.onTap,
  });
  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  String? img;
  String name = 'Jhon';
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: widget.onTap,
            child: Row(
              children: [
                SvgPicture.asset(
                  AppSvgs.locationIcon,
                  height: 3.h,
                ),
                2.width,
                Flexible(
                  child: Text(
                    widget.city,
                    style: Textfontstyle.TextStyle18w700c212121poppins,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                2.width,
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 3.h,
                  color: AppColors.darkGrey,
                ),
              ],
            ),
          ),
        ),
        // GestureDetector(
        //   onTap: () {
        //     AppCustomNavigator.push(context, NotificationScreen());
        //   },
        //   child: Badge(
        //     position: BadgePosition.topEnd(top: 0.h, end: 0.h),
        //     showBadge: true,
        //     badgeStyle: const BadgeStyle(
        //         borderSide: BorderSide(color: AppColors.white)),
        //     child: SvgPicture.asset(
        //       AppSvgs.notificationIcon,
        //       height: 2.4.h,
        //     ),
        //   ),
        // ),
        2.width,
        Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  SvgPicture.asset(
                    AppSvgs.notificationIcon,
                    height: 24,
                    width: 30,
                  ),

                  // Red dot
                  Positioned(
                    right: 2,
                    top: 1,
                    child: Container(
                      height: 7,
                      width: 7,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            2.width,
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) {
                    return const SizedBox(
                        height: 350, child: ProfileBottomSheet());
                  },
                );
                // AppCustomNavigator.push(context, const UserProfile());
              },
              child: CircleAvatar(
                radius: 3.h,
                backgroundColor: AppColors.lightSkyBlue,
                child: Text(
                      name[0],
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(color: AppColors.skyBlue),
                    ) ??
                    Image(image: AssetImage(img!)),
              ),
            ),
          ],
        )

        // Row(
        //   children: [
        //     GestureDetector(
        //         onTap: () {},
        //         child: SvgPicture.asset(
        //           AppSvgs.notificationIcon,
        //           height: 24,
        //           width: 30,
        //         )),
        //     2.width,
        //     GestureDetector(
        //       onTap: () {
        //         AppCustomNavigator.push(context, const UserProfile());
        //       },
        //       child: CircleAvatar(
        //         radius: 3.h,
        //         backgroundColor: AppColors.lightSkyBlue,
        //         child: Text(
        //               name[0],
        //               style: Theme.of(context)
        //                   .textTheme
        //                   .headlineSmall
        //                   ?.copyWith(color: AppColors.skyBlue),
        //             ) ??
        //             Image(image: AssetImage(img!)),
        //       ),
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
