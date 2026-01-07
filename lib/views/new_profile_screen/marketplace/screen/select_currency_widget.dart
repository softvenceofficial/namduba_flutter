import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/new_profile_screen/marketplace/screen/select_vehicle_screen.dart';
 
class SelectCurrencyWidget extends StatefulWidget {
  const SelectCurrencyWidget({super.key});

  @override
  State<SelectCurrencyWidget> createState() => _SelectCurrencyWidgetState();
}

class _SelectCurrencyWidgetState extends State<SelectCurrencyWidget> {
  int _selectedIndex = 0;
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
              CustomAppbar(
                centerTitle: true,
                isborder: true,
                title: "Select currency",
                svgIconNextToTitle: AppSvgs.searchIcon,
                onSvgIconTap: () {},
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
                  AppCustomNavigator.push(context, const SelectVehicleScreen());
                },
                child: CustomContainer(
                    isBorder: _selectedIndex == 0,
                    height: 60,
                    width: double.infinity,
                    hpadding: 18,
                    vpadding: 18,
                    child: Center(
                      child: Text(
                        "ZMW",
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
                  AppCustomNavigator.push(context, const SelectVehicleScreen());
                },
                child: CustomContainer(
                    isBorder: _selectedIndex == 1,
                    height: 60,
                    width: double.infinity,
                    hpadding: 18,
                    vpadding: 18,
                    child: Center(
                      child: Text(
                        "USD",
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
