import 'package:flutter/material.dart';
import 'package:nanduba/export.dart';

void showWarningDialog(BuildContext context) {
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
                Text("Warning",style: Theme.of(context).textTheme!.bodyMedium!.copyWith(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
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
            Text("Sending Email and Phone number\nis not allowed. Your account shall\nbe suspended.",style: Theme.of(context).textTheme!.bodyMedium!.copyWith(
              color: AppColors.grey,
              fontWeight: FontWeight.w400,
              fontSize: 12.sp,

            ),textAlign: TextAlign.center,),
            2.height,
            CustomButton(
              label: "Ok",
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
  }


