import 'package:nanduba/export.dart';
import 'package:nanduba/views/create_request/view_requests/view_requests.dart';
import 'package:nanduba/widgets/core/my_text.dart';

class GatheringEstimate extends StatefulWidget {
  const GatheringEstimate({super.key});

  @override
  State<GatheringEstimate> createState() => _GatheringEstimateState();
}

class _GatheringEstimateState extends State<GatheringEstimate> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          child: Column(

            children: [
              2.height,
              Text(
            "Compare Estimates and\nSelect a Shop",
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              3.height,
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 5.w, ),
                height: 65.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.w),
                    boxShadow: [
                      BoxShadow(color: AppColors.shadow.withOpacity(0.2),blurRadius: 20,offset: Offset(0, 2))
                    ]
                ),
                child: Column(
                  children: [
                    10.height,
                    SizedBox(
                        width: 70.w,
                        child: Image.asset(AppImages.estimate)),
                    7.5.height,

                    // Text("Getting estimates from nearby shops.\nWe’ll notify you at john@roadsmartsolutions.com when\nthey’re ready. While you’re waiting. Check\nout our blog or go to your dashboard",style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    //   color: AppColors.grey,
                    //   fontWeight: FontWeight.w500,
                    //   fontSize: 11.sp
                    // ),
                    // textAlign: TextAlign.center,
                    // ),
                    Column(
                     mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        MyText(
                        text:   'Getting estimates from nearby shops.',
                              color: AppColors.grey,
                              fontWeight: FontWeight.w500,
                              fontSize: 11.sp     ,
                          textAlign: TextAlign.center,
                        ),

                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: 'We’ll notify you at\n',
                            style:   GoogleFonts.poppins(
                              color: AppColors.grey,
                              fontWeight: FontWeight.w500,
                              fontSize: 11.sp
                          ),

                            children: <TextSpan>[
                              TextSpan(
                                text: 'john@roadsmartsolutions.com',
                                style:GoogleFonts.poppins(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11.sp
                                )
                              ),
                              TextSpan(
                                text: ' when \nthey’re ready. While you’re waiting. Check out our blog or go to your dashboard.',
                                  style:GoogleFonts.poppins(
                                      color: AppColors.grey,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11.sp
                                  )
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),


                  ],
                ),
              ),
              Spacer(),
              CustomButton(
                label: AppText.gotodashboard,
                onPressed: () {
                  AppCustomNavigator.push(context, ViewRequests());
                },
              ),
              2.height,




            ],
          ),
        ),
      ),
    );
  }
}
