import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/new_profile_screen/marketplace/screen/consignment_details_screen.dart';
import 'package:nanduba/views/new_profile_screen/marketplace/screen/select_currency_widget.dart';

class MarineTypeScreen extends StatefulWidget {
  const MarineTypeScreen({super.key});

  @override
  State<MarineTypeScreen> createState() => _MarineTypeScreenState();
}

class _MarineTypeScreenState extends State<MarineTypeScreen> {
  int _selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 4,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppbar(
                centerTitle: true,
                isborder: true,
                title: "Marine type",
                svgIconNextToTitle: AppSvgs.searchIcon,
              ),
              2.height,
              Text(
                "What do you want to insure?",
                style: Textfontstyle.TextStyle14w400midgreyinter.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              2.7.height,
              InkWell(
                onTap: () {
                  setState(() {
                    _selectedIndex = 0;
                  });
                  AppCustomNavigator.push(
                      context, const ConsignmentDetailsScreen());
                },
                child: CustomContainer(
                    isBorder: _selectedIndex == 0,
                    height: 60,
                    width: double.infinity,
                    hpadding: 18,
                    vpadding: 18,
                    child: Center(
                      child: Text(
                        "Goods/Consignment ",
                        style: Textfontstyle.TextStyle16w500c212121poppins
                            .copyWith(
                                color: AppColors.textColor,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                      ),
                    )),
              ),
              2.1.height,
              InkWell(
                onTap: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                  AppCustomNavigator.push(
                      context, const ConsignmentDetailsScreen());
                },
                child: CustomContainer(
                    isBorder: _selectedIndex == 1,
                    height: 60,
                    width: double.infinity,
                    hpadding: 18,
                    vpadding: 18,
                    child: Center(
                      child: Text(
                        "Vessel/Boat",
                        style: Textfontstyle.TextStyle16w500c212121poppins
                            .copyWith(
                                color: AppColors.textColor,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                      ),
                    )),
              ),
              2.1.height,
              InkWell(
                onTap: () {
                  setState(() {
                    _selectedIndex = 2;
                  });
                  AppCustomNavigator.push(
                      context, const ConsignmentDetailsScreen());
                },
                child: CustomContainer(
                    isBorder: _selectedIndex == 2,
                    height: 60,
                    width: double.infinity,
                    hpadding: 18,
                    vpadding: 18,
                    child: Center(
                      child: Text(
                        "Legal Liability ",
                        style: Textfontstyle.TextStyle16w500c212121poppins
                            .copyWith(
                                color: AppColors.textColor,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                      ),
                    )),
              ),
              2.1.height,
              InkWell(
                onTap: () {
                  setState(() {
                    _selectedIndex = 3;
                  });
                  AppCustomNavigator.push(
                      context, const ConsignmentDetailsScreen());
                },
                child: CustomContainer(
                    isBorder: _selectedIndex == 3,
                    height: 60,
                    width: double.infinity,
                    hpadding: 18,
                    vpadding: 18,
                    child: Center(
                      child: Text(
                        "Freight Income",
                        style: Textfontstyle.TextStyle16w500c212121poppins
                            .copyWith(
                                color: AppColors.textColor,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
