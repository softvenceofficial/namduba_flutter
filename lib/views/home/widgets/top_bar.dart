import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';
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
        // Profile Section (Avatar)
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
              },
              child: Container(
                width: 25.w,
                height: 25.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(AppImages.profileimage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
