import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/Profile/Profile.dart';
import 'package:nanduba/views/Profile/User_profile/profile_screen_new/Profile_screen.dart';
import 'package:nanduba/views/Profile/User_profile/user_profile.dart';
import 'package:nanduba/views/home/switch_account_screen.dart';

class ProfileBottomSheet extends StatefulWidget {
  const ProfileBottomSheet({super.key});

  @override
  State<ProfileBottomSheet> createState() => _ProfileBottomSheetState();
}

class _ProfileBottomSheetState extends State<ProfileBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  AppCustomNavigator.pop(context);
                },
                child: Container(
                  height: 22,
                  width: 22,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.cCA2626, width: 2)),
                  child: const Icon(
                    Icons.close,
                    color: AppColors.cCA2626,
                    size: 14,
                  ),
                ),
              )
            ],
          ),
          2.height,
          GestureDetector(
            onTap: () {
              // current account navigation
              AppCustomNavigator.push(context, const ProfileScreenNew());
            },
            child: CustomContainer(
              borderRadius: 20,
              isBorder: true,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(AppImages.Person),
                      radius: 5.w,
                    ),
                    2.width,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Joedoe",
                          style: Textfontstyle.TextStyle12w500c212121poppins
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text("Account Holder",
                            style: Textfontstyle.TextStyle12w500c212121poppins
                                .copyWith(color: AppColors.bottomNav))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          1.height,
          GestureDetector(
            onTap: () {
              // switch account navigation
              AppCustomNavigator.push(context, const SwitchAccountScreen());
            },
            child: CustomContainer(
                borderRadius: 20,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
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
                                borderRadius: BorderRadius.circular(12)),
                            child: SvgPicture.asset(
                              AppSvgs.makapayment,
                              // width: 20,
                              // height: 20,
                              color: AppColors.cCA2626,
                            ),
                          ),
                          2.width,
                          Text(
                            "Switch Account",
                            style: Textfontstyle.TextStyle12w500c212121poppins
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColors.bottomNav),
                              shape: BoxShape.circle),
                          child: Icon(
                            Icons.chevron_right,
                            size: 12.sp,
                            color: AppColors.bottomNav,
                          )),
                    ],
                  ),
                )),
          ),
          2.height,
          Text("Signed in as\nJohntrial123@gmail.com",
              style: Textfontstyle.TextStyle12w500c212121poppins.copyWith(
                  color: AppColors.bottomNav)),
          2.1.height,
          CustomButton(label: AppText.logout, onPressed: () {})
        ],
      ),
    );
  }
}
