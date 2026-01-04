import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/Profile/User_profile/profile_screen_new/widget/about_feedback_widget.dart';
import 'package:nanduba/views/Profile/User_profile/profile_screen_new/widget/about_section_widget.dart';
import 'package:nanduba/views/Profile/User_profile/profile_screen_new/widget/feedback_section_widget.dart';

class ProfileScreenNew extends StatefulWidget {
  const ProfileScreenNew({super.key});

  @override
  State<ProfileScreenNew> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreenNew> {
  int selectedTab = 0;

  void onTabChanged(int index) {
    setState(() {
      selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          child: Column(
            children: [
              const CustomAppbar(title: AppText.profile),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(24)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      2.height,

                      /// Profile Card
                      CustomContainer(
                        blurRadius: 20,
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
                                    children: [
                                      Row(
                                        children: List.generate(
                                          5,
                                          (_) => const Icon(
                                            Icons.star,
                                            color: AppColors.yellow,
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                      4.width,
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

                      3.height,

                      /// Tabs
                      AboutFeedbackTabBar(onTabChanged: onTabChanged),

                      3.height,

                      /// Content
                      Expanded(
                        child: IndexedStack(
                          index: selectedTab,
                          children: const [
                            AboutSectionWidget(),
                            FeedbackSectionWidget(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
