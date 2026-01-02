import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/Profile/User_profile/user_profile.dart';
import 'package:nanduba/views/auth/create_an_account/create_an_account.dart';

class ProfileScreenNew extends StatefulWidget {
  const ProfileScreenNew({super.key});

  @override
  State<ProfileScreenNew> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreenNew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 4.w, vertical: 2.h),
          child: Column(
            children: [
              const CustomAppbar(
                title: AppText.profile,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(24))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    2.height,
                    GestureDetector(
                      onTap: () {},
                      child: CustomContainer(
                        isBorder: true,
                        child: Padding(
                          padding: const EdgeInsets.all(19),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    const AssetImage(AppImages.Person),
                                radius: 9.w,
                              ),
                              10.width,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppText.john,
                                    style: Textfontstyle
                                        .TextStyle14w500c212121poppins.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: List.generate(
                                          5,
                                          (index) => const Icon(
                                            Icons.star,
                                            color: AppColors.yellow,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        "(12)",
                                        style: Textfontstyle
                                                .TextStyle12w500c212121poppins
                                            .copyWith(
                                                color: AppColors.bottomNav),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    3.1.height,
                    GestureDetector(
                      onTap: () {
                        //   navigation
                        AppCustomNavigator.push(
                            context, const CreateAnAccount());
                      },
                      child: Row(
                        children: [
                          CustomContainer(
                            color: AppColors.cCA2626,
                            borderRadius: 30,
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      AppText.about,
                                      style: Textfontstyle
                                              .TextStyle14w500c212121poppins
                                          .copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.white),
                                    ),
                                  ],
                                )),
                          ),
                          1.1.width,
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    AppText.feedback,
                                    style: Textfontstyle
                                            .TextStyle14w500c212121poppins
                                        .copyWith(color: AppColors.bottomNav),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                    2.9.height,
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              AppText.locationLabel,
                              style: Textfontstyle.TextStyle12w500c212121poppins
                                  .copyWith(color: AppColors.bottomNav),
                            ),
                            Text(
                              AppText.locationValue,
                              style: Textfontstyle.TextStyle12w500c212121poppins
                                  .copyWith(
                                      color: AppColors.bottomNav,
                                      fontWeight: FontWeight.w800),
                            )
                          ],
                        ),
                        0.2.height,
                        Row(
                          children: [
                            Text(
                              AppText.memberSinceLabel,
                              style: Textfontstyle.TextStyle12w500c212121poppins
                                  .copyWith(color: AppColors.bottomNav),
                            ),
                            Text(
                              AppText.memberSinceValue,
                              style: Textfontstyle.TextStyle12w500c212121poppins
                                  .copyWith(
                                      color: AppColors.bottomNav,
                                      fontWeight: FontWeight.w800),
                            )
                          ],
                        )
                      ],
                    ),
                    42.height,
                    CustomButton(label: AppText.editprofile, onPressed: () {})
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
