import 'package:nanduba/export.dart';
import 'package:nanduba/views/Profile/Chose_payment/Chose_payment.dart';

import 'package:nanduba/views/new_profile_screen/edit_profile_screen.dart';
import 'package:nanduba/views/new_profile_screen/login_and_security/login_and_security_screen.dart';
import 'package:nanduba/views/new_profile_screen/widget/profile_item_widget.dart';

class AccountSettingsScreen extends StatefulWidget {
  const AccountSettingsScreen({super.key});

  @override
  State<AccountSettingsScreen> createState() => _AccountSettingsScreenState();
}

class _AccountSettingsScreenState extends State<AccountSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
          child: Column(
            children: [
              const CustomAppbar(title: AppText.accountsetting),
              2.7.height,
              SwitchAccountItemWidget(
                showProgress: true,
                title: "Personal Info",
                svgIcon: AppSvgs.profileIcon,
                onTap: () {
                  AppCustomNavigator.push(context, const EditProfileScreen());
                },
              ),
              1.height,
              SwitchAccountItemWidget(
                title: "Login & Security",
                svgIcon: AppSvgs.sheild,
                onTap: () {
                  AppCustomNavigator.push(
                      context, const LoginAndSecurityScreen());
                },
              ),
              1.height,
              SwitchAccountItemWidget(
                title: "Notification",
                svgIcon: AppSvgs.notification,
                onTap: () {},
              ),
              1.height,
              SwitchAccountItemWidget(
                title: "Preferenses",
                svgIcon: AppSvgs.addNotes,
                onTap: () {},
              ),
              1.height,
              SwitchAccountItemWidget(
                title: "Payment Settings",
                svgIcon: AppSvgs.makapayment,
                onTap: () {
                  AppCustomNavigator.push(context, ChosePayment());
                },
              ),
              1.height,
              SwitchAccountItemWidget(
                title: "Address Book",
                svgIcon: AppSvgs.locationadd,
                onTap: () {},
              ),
              1.height,
              SwitchAccountItemWidget(
                title: "Taxes",
                svgIcon: AppSvgs.addNotes,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
