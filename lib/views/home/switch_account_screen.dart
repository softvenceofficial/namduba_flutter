import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/Profile/User_profile/user_profile.dart';
import 'package:nanduba/views/auth/create_an_account/create_an_account.dart';

class SwitchAccountScreen extends StatefulWidget {
  const SwitchAccountScreen({super.key});

  @override
  State<SwitchAccountScreen> createState() => _SwitchAccountScreenState();
}

class _SwitchAccountScreenState extends State<SwitchAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 4.w, vertical: 2.h),
          child: Column(
            children: [
              const CustomAppbar(
                title: AppText.switchaccount,
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
                      onTap: () {
                        // current account navigation
                      },
                      child: Stack(
                        children: [
                          CustomContainer(
                            borderRadius: 20,
                            isBorder: true,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 23, right: 8, top: 8, bottom: 8),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage:
                                        const AssetImage(AppImages.Person),
                                    radius: 5.w,
                                  ),
                                  2.width,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Johntrial123@gmail.com",
                                        style: Textfontstyle
                                                .TextStyle12w500c212121poppins
                                            .copyWith(
                                                fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Account Holder",
                                        style: Textfontstyle
                                                .TextStyle12w500c212121poppins
                                            .copyWith(
                                                color: AppColors.bottomNav),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          const Positioned(
                            right: 12,
                            top: 0,
                            bottom: 0,
                            child: Icon(
                              Icons.check,
                              color: Colors.red,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),

                    1.height,
                    GestureDetector(
                      onTap: () {
                        //   navigation
                      },
                      child: CustomContainer(
                        borderRadius: 20,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 23, right: 8, top: 8, bottom: 8),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    const AssetImage(AppImages.cars3),
                                radius: 5.w,
                              ),
                              2.width,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppText.fleetco,
                                    style: Textfontstyle
                                            .TextStyle12w500c212121poppins
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  Text(AppText.fleetmanager,
                                      style: Textfontstyle
                                              .TextStyle12w500c212121poppins
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
                        //   navigation
                      },
                      child: CustomContainer(
                        borderRadius: 20,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 23, right: 8, top: 8, bottom: 8),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    const AssetImage(AppImages.manage),
                                radius: 5.w,
                              ),
                              2.width,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppText.smartlogistis,
                                    style: Textfontstyle
                                            .TextStyle12w500c212121poppins
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  Text(AppText.administrator,
                                      style: Textfontstyle
                                              .TextStyle12w500c212121poppins
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
                        //   navigation
                        AppCustomNavigator.push(
                            context, const CreateAnAccount());
                      },
                      child: CustomContainer(
                        borderRadius: 20,
                        height: 56,
                        width: double.infinity,
                        child: Padding(
                            padding: const EdgeInsets.only(
                                left: 23, right: 8, top: 8, bottom: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "+ Add another account",
                                  style: Textfontstyle
                                          .TextStyle12w500c212121poppins
                                      .copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.cCA2626),
                                ),
                              ],
                            )),
                      ),
                    ),
                    2.1.height,
                    Text("Signed in as Johntrial123@gmail.com",
                        style: Textfontstyle.TextStyle12w500c212121poppins
                            .copyWith(color: AppColors.bottomNav)),

                    // CustomButton(label: AppText.logout, onPressed: () {})
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
