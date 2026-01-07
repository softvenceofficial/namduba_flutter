import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/new_profile_screen/marketplace/screen/review_screen.dart';

class Qustions {
  final String title;
  final String name;
  final String qurry;
  final String option1;
  final String option2;

  Qustions({
    required this.title,
    required this.name,
    required this.qurry,
    required this.option1,
    required this.option2,
  });
}

class QuriyScreen extends StatefulWidget {
  const QuriyScreen({super.key});

  @override
  State<QuriyScreen> createState() => _QuriyScreenState();
}

class _QuriyScreenState extends State<QuriyScreen> {
  final List<Qustions> qustion = [
    Qustions(
        option1: "Personal use",
        option2: "Bussness use",
        title: "Vehicle 1 of 3",
        qurry: "Specify the use for the BMW ALX1823ZM",
        name: "BMW"),
    Qustions(
        option1: "No",
        option2: "Yes",
        name: "Joe Smith",
        title: "Driver 1 of 2",
        qurry: "Has Joe Smith been convicted before?")
  ];
  int currentStep = 0;
  int _selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              3.height,
              CustomAppbar(
                title: qustion[currentStep].title,
                centerTitle: true,
              ),
              3.height,
              Text(
                qustion[currentStep].name,
                style: Textfontstyle.TextStyle12w500c212121poppins.copyWith(
                    fontSize: 12.sp, color: AppColors.midGrey),
              ),
              Text(
                qustion[currentStep].qurry,
                style: Textfontstyle.TextStyle12w500c212121poppins.copyWith(
                    fontSize: 12.sp, color: AppColors.midGrey),
              ),
              3.height,
              InkWell(
                onTap: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                },
                child: CustomContainer(
                  isBorder: _selectedIndex == 1,
                  height: 60,
                  width: double.infinity,
                  hpadding: 10,
                  vpadding: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      4.width,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              qustion[currentStep].option1,
                              style: Textfontstyle.TextStyle16w500c212121poppins
                                  .copyWith(
                                color: AppColors.textColor,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              1.6.height,
              InkWell(
                onTap: () {
                  setState(() {
                    _selectedIndex = 2;
                  });
                },
                child: CustomContainer(
                  isBorder: _selectedIndex == 2,
                  height: 60,
                  width: double.infinity,
                  hpadding: 2,
                  vpadding: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      4.width,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              qustion[currentStep].option2,
                              style: Textfontstyle.TextStyle16w500c212121poppins
                                  .copyWith(
                                color: AppColors.textColor,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              3.9.height,
              CustomButton(
                label: "Next",
                onPressed: () {
                  if (currentStep < qustion.length - 1) {
                    setState(() {
                      currentStep++;
                      _selectedIndex = -1;
                    });
                  } else {
                    AppCustomNavigator.push(
                        context, const ReviewScreenmarkateplace());
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
