import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/new_profile_screen/marketplace/screen/request_screen.dart';

class CompareEstimatesScreen extends StatefulWidget {
  const CompareEstimatesScreen({super.key});

  @override
  State<CompareEstimatesScreen> createState() => _CompareEstimatesScreenState();
}

class _CompareEstimatesScreenState extends State<CompareEstimatesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            children: [
              // Main content
              Column(
                children: [
                  // Title
                  Text(
                    "Compare Estimates and\nSelect a Shop",
                    textAlign: TextAlign.center,
                    style: Textfontstyle.TextStyle14w400c212121poppins.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor5,
                    ),
                  ),

                  4.height,

                  // Illustration
                  CustomContainer(
                    vpadding: 18,
                    hpadding: 23,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        children: [
                          8.height,
                          Image.asset(AppImages.gotodashboard),
                          8.height,
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: Textfontstyle.TextStyle14w400cCA2626poppins
                                  .copyWith(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.midGrey,
                              ),
                              children: const [
                                TextSpan(
                                  text:
                                      "Getting estimates from nearby shops.\nWe'll notify you at\n",
                                ),
                                TextSpan(
                                  text: "john@roadsmartsolutions.com",
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      " when\nthey're ready. While you're waiting. Check\nout our blog or go to your dashboard",
                                ),
                              ],
                            ),
                          ),
                          4.height,
                        ],
                      ),
                    ),
                  ),

                  // Description text
                ],
              ),

              const Spacer(),

              // Button
              CustomButton(
                label: "Go to Dashboard",
                onPressed: () {
                  // Navigate to dashboard
                  AppCustomNavigator.push(context, RequestScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
