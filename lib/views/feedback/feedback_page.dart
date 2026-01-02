import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/feedback/feedback_open_page.dart';

import '../../widgets/core/custom_container.dart';
import '../../widgets/core/my_text.dart';
import '../leave_feedback/feedback_screen.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            myAppBar(title: "All Reviews (120)"),
            2.height,
            Expanded(child: SizedBox(
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        physics: AlwaysScrollableScrollPhysics(),
                        itemCount: 8,
                        itemBuilder: (context, index){
                          return Padding(
                            padding: EdgeInsets.only(top: index == 0 ? 0 : 2.h),
                            child: GestureDetector(
                              onTap: (){
                                Get.to(FeedbackOpenPage(name: 'John Doe', type: 'Review',));
                              },
                              child: CustomContainer(
                                  hpadding: 4.w,
                                  vpadding: 2.h,
                                  borderRadius: 22,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            child: Row(
                                              children: [
                                                CircleAvatar(
                                                  radius: 3.h,
                                                  backgroundColor: AppColors.primary,
                                                  backgroundImage: AssetImage(AppImages.john),
                                                ),
                                                2.width,
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    MyText(
                                                      text: "John Doe",
                                                      color: AppColors.black,
                                                      fontSize: 12.sp,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                    0.5.height,
                                                    Row(
                                                      children: [
                                                        Icon(Icons.star, size: 15, color: AppColors.yellow,),
                                                        Icon(Icons.star, size: 15, color: AppColors.yellow,),
                                                        Icon(Icons.star, size: 15, color: AppColors.yellow,),
                                                      ],
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 6.0),
                                            child: MyText(
                                              text: "2 days ago",
                                              color: AppColors.midDarkGrey,
                                              fontSize: 8.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                      2.height,
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: MyText(
                                          text: "It was a very nice service. Lorem Ipsum dummy text of the printing and typesetting industry.",
                                          color: AppColors.grey,
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  )
                              ),
                            ),
                          );
                        }),
                  )
                ],
              ),
            ),)
          ],
        ),
      )),
    );
  }
}
