import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/Profile/Settings/settings.dart';
import 'package:nanduba/views/Profile/order_details/Order_details.dart';
import 'package:nanduba/views/Wishlist/Wishlist.dart';
import 'package:nanduba/views/contact_us/contact_us_screen.dart';
import 'package:nanduba/views/create_request/payment_methods/choose_payment_methods.dart';
import 'package:nanduba/views/new_profile_screen/account_settings_screen.dart';
import 'package:nanduba/views/new_profile_screen/marketplace/screen/insurance_type_screen.dart';
import 'package:nanduba/views/new_profile_screen/widget/profile_item_widget.dart';
import 'package:nanduba/views/new_profile_screen/your_garage/your_garage_scree.dart';
import 'package:nanduba/widgets/core/my_text.dart';

class NewProfileScreen extends StatefulWidget {
  const NewProfileScreen({super.key});

  @override
  State<NewProfileScreen> createState() => _NewProfileScreenState();
}

class _NewProfileScreenState extends State<NewProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 3.h,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 0),
                child: GestureDetector(
                  onTap: () {
                    // Get.to(const UserProfile());
                  },
                  child: CustomContainer(
                    borderRadius: 20,
                    isBorder: true,
                    hpadding: 4.w,
                    vpadding: 0.1.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // First Row with CircleAvatar and Text
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 5.w,
                              backgroundColor: AppColors.black,
                              backgroundImage:
                                  const AssetImage(AppImages.Person),
                            ),
                            2.width,
                            Column(
                              mainAxisAlignment: MainAxisAlignment
                                  .center, // Centers the text vertically
                              crossAxisAlignment: CrossAxisAlignment
                                  .start, // Keeps the text aligned to the start horizontally
                              children: [
                                .5.height,
                                MyText(
                                  text: AppText.john,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.black,
                                ),
                                MyText(
                                  text: AppText.personalaccount,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.midDarkGrey,
                                ),
                                1.5.height,
                              ],
                            ),
                          ],
                        ),

                        // Second Row with Icon and Stack (mail icon commented)
                        Row(
                          children: [
                            // mail icon commented//
                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: SvgPicture.asset(
                            //     AppSvgs.mailicon,
                            //     color: AppColors.bottomNav,
                            //     height: 20,
                            //     width: 20,
                            //   ),
                            // ),
                            2.width,
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                // Icon centered
                                Center(
                                  child: SvgPicture.asset(
                                    AppSvgs.odercard,
                                    color: AppColors.border3,
                                    height: 25,
                                    width: 25,
                                  ),
                                ),
                                // Badge
                                // Positioned(
                                //   top: -4,
                                //   right: -4,
                                //   child: Container(
                                //     alignment: Alignment.center,
                                //     width: 12,
                                //     height: 12,
                                //     decoration: const BoxDecoration(
                                //       shape: BoxShape.circle,
                                //       color: AppColors.cCA2626,
                                //     ),
                                //     child: Text(
                                //       "2",
                                //       style: Textfontstyle
                                //               .TextStyle12w500c212121poppins
                                //           .copyWith(
                                //               color: AppColors.white,
                                //               fontSize: 6.sp),
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              1.height,
              Padding(
                padding: const EdgeInsets.only(left: 32.0),
                child: Text(
                  "Shopping",
                  style: Textfontstyle.TextStyle12w500c212121poppins.copyWith(
                      color: AppColors.bottomNav),
                ),
              ),
              1.height,
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    0.7.height,
                    SwitchAccountItemWidget(
                      title: "Requests",
                      svgIcon: AppSvgs.addNotes,
                      onTap: () {
                        AppCustomNavigator.push(
                            context, const AccountSettingsScreen());
                      },
                    ),
                    0.7.height,
                    SwitchAccountItemWidget(
                      title: "Orders",
                      svgIcon: AppSvgs.odercard,
                      onTap: () {
                        AppCustomNavigator.push(context, const OrderDetails());
                      },
                    ),
                    0.7.height,
                    SwitchAccountItemWidget(
                      title: "Insurance",
                      svgIcon: AppSvgs.passwordIcon,
                      onTap: () {
                        AppCustomNavigator.push(
                            context, const InsuranceTypeScreen());
                      },
                    ),
                    0.7.height,
                    SwitchAccountItemWidget(
                      title: "Watchlist",
                      svgIcon: AppSvgs.hearticon,
                      onTap: () {
                        AppCustomNavigator.push(context, const Wishlist());
                      },
                    ),
                    2.4.height,
                    Padding(
                      padding: const EdgeInsets.only(left: 14),
                      child: Text(
                        "Personalize",
                        style: Textfontstyle.TextStyle12w500c212121poppins
                            .copyWith(color: AppColors.bottomNav),
                      ),
                    ),
                    1.height,
                    SwitchAccountItemWidget(
                      title: "Your Garage",
                      svgIcon: AppSvgs.carIcon,
                      onTap: () {
                        AppCustomNavigator.push(
                            context, const YourGarageScree());
                      },
                    ),
                    2.4.height,
                    Padding(
                      padding: const EdgeInsets.only(left: 14),
                      child: Text(
                        "Customer Support",
                        style: Textfontstyle.TextStyle12w500c212121poppins
                            .copyWith(color: AppColors.bottomNav),
                      ),
                    ),
                    1.height,
                    SwitchAccountItemWidget(
                      title: "Contact Support",
                      svgIcon: AppSvgs.forgotByEmail,
                      onTap: () {
                        AppCustomNavigator.push(
                            context, const ContactUsScreen());
                      },
                    ),
                    2.4.height,
                    Padding(
                      padding: const EdgeInsets.only(left: 14),
                      child: Text(
                        "Account",
                        style: Textfontstyle.TextStyle12w500c212121poppins
                            .copyWith(color: AppColors.bottomNav),
                      ),
                    ),
                    1.height,
                    SwitchAccountItemWidget(
                      title: "Payments",
                      svgIcon: AppSvgs.makapayment,
                      onTap: () {
                        AppCustomNavigator.push(
                            context, ChoosePaymentMethods());
                      },
                    ),
                    1.height,
                    SwitchAccountItemWidget(
                      title: "Settings",
                      svgIcon: AppSvgs.setting2,
                      onTap: () {
                        AppCustomNavigator.push(context, const Settings());
                      },
                    ),
                    1.height,
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
