import 'package:get/get.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/create_request/view_requests/view_requests.dart';

class ThankYouOrder extends StatefulWidget {
  const ThankYouOrder({super.key});

  @override
  State<ThankYouOrder> createState() => _ThankYouOrderState();
}

class _ThankYouOrderState extends State<ThankYouOrder> {


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
                "Thank You!",
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              7.height,
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
                    12.height,
                    SizedBox(
                        width: 70.w,
                        child: Image.asset(AppImages.orderBus)),
                    8.height,
                    Text("Your order has been placed successfully. You will receive an email receipt shortly.",style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                    ),
                      textAlign: TextAlign.center,
                    ),



                  ],
                ),
              ),
              2.height,
              Spacer(),
              CustomButton(
                label:"Back To Home",
                onPressed: () {
                  // AppCustomNavigator.push(context, BottomNavbar());
                  Get.offAll(BottomNavbar());
                },
              ),
              Spacer(),




            ],
          ),
        ),
      ),
    );
  }
}
