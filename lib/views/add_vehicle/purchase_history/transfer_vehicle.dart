import 'package:get/get.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/add_vehicle/purchase_history/new_owner.dart';
import 'package:nanduba/views/create_request/view_requests/view_requests.dart';

import '../../../widgets/core/my_text.dart';

class TransferVehicle extends StatefulWidget {
  const TransferVehicle({super.key});

  @override
  State<TransferVehicle> createState() => _TransferVehicleState();
}

class _TransferVehicleState extends State<TransferVehicle> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          child: Column(
            children: [
              2.height,
              CustomAppbar(title: "Transfer Vehicle"),
              4.height,
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 6.w, ),
                height: 64.5.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.w),
                    boxShadow: [
                      BoxShadow(color: AppColors.shadow.withOpacity(0.2),blurRadius: 20,offset: Offset(0, 2))
                    ]
                ),
                child: Column(
                  children: [
                    7.height,
                    SizedBox(
                        width: 70.w,
                        child: Image.asset(AppImages.transfer_vehicle_car)),
                    3.height,
                   MyText(text: 'Warning!',
                     color: AppColors.black,
                     fontWeight: FontWeight.w700,
                     fontSize: 15.sp,
                     textAlign: TextAlign.center,
                   ),
                    2.height,
                    MyText(text: "Transferring the vehicle Toyota Corolla will remove this vehicle from your account and transfer all remaining subscription(s) to a new username/email. Your vehicle's profile image, vehicle details, activity logs, alert logs, and billing information will be deleted.",
                      color: AppColors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 11.sp,
                      textAlign: TextAlign.center,
                    ),
                    2.height,
                    MyText(text: "Are you sure you want to transfer Toyota Corolla?",
                      color: AppColors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 11.sp,
                      textAlign: TextAlign.center,
                    ),

                  ],
                ),
              ),
              3.height,
              CustomButton(
                label:"Yes,I'm Sure",
                onPressed: () {
                  AppCustomNavigator.push(context, NewOwner());
                 // Get.offAll(BottomNavbar());
                },
              ),
              2.height,
              GestureDetector(
                onTap: (){
                  Get.back();
                },
                child: MyText(text: "Cancel",
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp,
                  textAlign: TextAlign.center,
                  decoration: TextDecoration.underline,
                ),
              ),
              0.5.height
            ],
          ),
        ),
      ),
    );
  }
}
