import 'package:get/get.dart';
import 'package:nanduba/export.dart';

class RenewalServiceScreen extends StatelessWidget {
  const RenewalServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          child: Column(
            children: [
              const CustomAppbar(title: AppText.renewableServices),
              2.height,
              CustomTile(
                prefixSvgImage: AppSvgs.insurance,
                title: AppText.insurance + ' renewal',
                onPressed: () {
                  AppCustomNavigator.push(context, const InsureScreen());
                },
                isButton: true,
              ),
              CustomTile(
                prefixSvgImage: AppSvgs.roadTax,
                title: AppText.roadTax + ' renewal',
                onPressed: () {
                  Get.to(() => ComplianceScreen(
                        sheet: true,
                        showForIndex: 9,
                        showForTitle: AppText.roadTaxRenewal,
                      ));
                },
                isButton: true,
              ),
              CustomTile(
                prefixSvgImage: AppSvgs.roadHealth,
                title: AppText.roadHealth + ' renewal',
                onPressed: () {},
                isButton: true,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
