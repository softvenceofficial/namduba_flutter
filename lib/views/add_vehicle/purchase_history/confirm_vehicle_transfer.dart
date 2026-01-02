import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanduba/export.dart';

import '../../../widgets/core/my_text.dart';
import 'new_owner.dart';

class ConfirmVehicleTransfer extends StatefulWidget {
  const ConfirmVehicleTransfer({super.key});

  @override
  State<ConfirmVehicleTransfer> createState() => _ConfirmVehicleTransferState();
}

class _ConfirmVehicleTransferState extends State<ConfirmVehicleTransfer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          child: Column(
            children: [
              2.height,
              CustomAppbar(title: "Confirm Transfer Vehicle"),
              8.height,
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 6.w, ),
                height: 60.h,
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
                        child: Image.asset(AppImages.transfer_vehicle_car)),
                    6.height,
                    MyText(text: 'Transfer Toyota Corolla to!',
                      color: AppColors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 15.sp,
                      textAlign: TextAlign.center,
                    ),
                    2.height,
                    MyText(text: "inongesn@gmail.com",
                      color: AppColors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 11.sp,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              3.height,
              CustomButton(
                label:"Submit",
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        backgroundColor: Colors.white,
                        surfaceTintColor: Colors.white,shadowColor: AppColors.shadow.withOpacity(0.1),
                        contentPadding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 2.h),
                        insetPadding: EdgeInsets.zero,
                        content:  Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Text("Vehicle Transfer Request Sent!",style: Theme.of(context).textTheme!.bodyMedium!.copyWith(
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10.5.sp,
                                ),),
                                Spacer(),
                                GestureDetector(
                                    onTap: (){
                                      Navigator.pop(context);
                                    },
                                    child: SvgPicture.asset(AppSvgs.closeCircle,color: AppColors.primary,))
                              ],
                            ),
                            Divider(color: AppColors.secondaryborder2,),
                            1.height,
                            Text('Vehicle transfer request sent to\n "inongesn@gmail.com"',style: Theme.of(context).textTheme!.bodyMedium!.copyWith(
                              color: AppColors.grey,
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,

                            ),textAlign: TextAlign.center,),
                            2.height,
                            CustomButton(
                              label: "Resend",
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              width: 28.w,
                              height: 6.h,
                              vPadding: 0,
                              hPadding: 0,
                              labelFontSize: 11.sp,
                            ),
                            1.height,
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
              1.7.height,
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
            ],
          ),
        ),
      ),
    );
  }
}
