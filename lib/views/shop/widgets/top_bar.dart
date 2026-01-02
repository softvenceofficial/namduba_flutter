import 'package:nanduba/export.dart';
import 'package:nanduba/views/Profile/User_profile/user_profile.dart';

class ShopTopBar extends StatefulWidget {
  const ShopTopBar({
    super.key,
  });
  @override
  State<ShopTopBar> createState() => _ShopTopBarState();
}

class _ShopTopBarState extends State<ShopTopBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            "Shop",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        // Badge(
        //   position: BadgePosition.topEnd(top: 0.h, end: 0.h),
        //   showBadge: true,
        //   badgeStyle:
        //       const BadgeStyle(borderSide: BorderSide(color: AppColors.white)),
        //   child: SvgPicture.asset(
        //     AppSvgs.cart,
        //     height: 2.4.h,
        //   ),
        // ),
        2.width,
      ],
    );
  }
}
