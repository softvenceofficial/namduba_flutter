import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/add_vehicle/policy_information/coverages/component/collision_coverage.dart';
import 'package:nanduba/views/add_vehicle/policy_information/coverages/component/comprehensive_coverage.dart';
import 'package:nanduba/views/add_vehicle/policy_information/coverages/vehicle_coverage.dart';
import 'package:nanduba/views/add_vehicle/policy_information/transactions/component/payments_list.dart';
import 'package:nanduba/views/add_vehicle/purchase_history/basic_report.dart';
import '../../../../widgets/core/my_text.dart';
import 'component/claim_transactions.dart';

class Transactions extends StatefulWidget {

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  int selectedButtonIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(

          children: [
            1.height,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: CustomAppbar(title: "Transactions",toggleIcon: AppImages.toggle,),
            ),
            2.height,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Row(
                children: [
                  CustomButton(
                    width: 30.w,
                    height: 4.5.h,
                    hPadding: 0,
                    vPadding: 0,
                    borderColor: AppColors.transparent,
                    label: "Payments",
                    labelFontSize: 10.sp,
                    onPressed: () {
                      setState(() {
                        selectedButtonIndex = 1;
                      });
                    },

                    backgroundColor: selectedButtonIndex == 1
                        ? AppColors.primary
                        : Colors.transparent,
                    foregroundColor: selectedButtonIndex == 1
                        ? AppColors.white
                        : AppColors.grey,
                  ),
                  Spacer(),
                  CustomButton(

                    width: 30.w,
                    height: 4.5.h,
                    hPadding: 0,
                    vPadding: 0,
                    borderColor: AppColors.transparent,
                    label: "Claim",
                    labelFontSize: 10.sp,
                    onPressed: () {
                      setState(() {
                        selectedButtonIndex = 2;
                      });
                    },

                    backgroundColor: selectedButtonIndex == 2
                        ? AppColors.primary
                        : Colors.transparent,
                    foregroundColor: selectedButtonIndex == 2
                        ? AppColors.white
                        : AppColors.grey,

                  ),
                  Spacer(flex: 2,),

                ],
              ),
            ),
            2.height,
            selectedButtonIndex==1?
            Expanded(
              child:SingleChildScrollView(

                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: PaymentsList()
                ),
              ),
            ):ClaimTransactions(),

          ],
        ),
      ),

    );
  }
}

