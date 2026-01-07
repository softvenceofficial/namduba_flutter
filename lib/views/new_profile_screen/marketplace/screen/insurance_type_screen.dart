import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/new_profile_screen/marketplace/screen/marine_type_screen.dart';
import 'package:nanduba/views/new_profile_screen/marketplace/screen/select_currency_widget.dart';
 
class InsuranceTypeScreen extends StatefulWidget {
  const InsuranceTypeScreen({super.key});

  @override
  State<InsuranceTypeScreen> createState() => _InsuranceTypeScreenState();
}

class _InsuranceTypeScreenState extends State<InsuranceTypeScreen> {
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
            children: [
              const CustomAppbar(
                centerTitle: true,
                isborder: true,
                title: "Insuranse type",
                svgIconNextToTitle: AppSvgs.searchIcon,
              ),
              2.height,
              Text(
                "Please choose the type of insurance you need",
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
                      context, const SelectCurrencyWidget());
                },
                child: CustomContainer(
                    isBorder: _selectedIndex == 0,
                    height: 60,
                    width: double.infinity,
                    hpadding: 18,
                    vpadding: 18,
                    child: Center(
                      child: Text(
                        "Motor Insurance",
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
                      context, const SelectCurrencyWidget());
                },
                child: CustomContainer(
                    isBorder: _selectedIndex == 1,
                    height: 60,
                    width: double.infinity,
                    hpadding: 18,
                    vpadding: 18,
                    child: Center(
                      child: Text(
                        "Plant Insurance",
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
                  AppCustomNavigator.push(context, const MarineTypeScreen());
                },
                child: CustomContainer(
                    isBorder: _selectedIndex == 2,
                    height: 60,
                    width: double.infinity,
                    hpadding: 18,
                    vpadding: 18,
                    child: Center(
                      child: Text(
                        "Marine Insurance",
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
