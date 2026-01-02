import 'package:flutter/material.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/widgets/core/my_text.dart';

class FeedbackOpenPage extends StatefulWidget {
  const FeedbackOpenPage({super.key, required this.name, required this.type});

  final String name;
  final String type;

  @override
  State<FeedbackOpenPage> createState() => _FeedbackOpenPageState();
}

class _FeedbackOpenPageState extends State<FeedbackOpenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 6.h,
                  width: 6.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.lightGrey),
                    borderRadius: BorderRadius.circular(15.w),
                  ),
                  child: const Center(
                    child: Icon(Icons.arrow_back_ios_new_rounded),
                  ),
                ),
              ),
            ),
            4.height,
            CustomContainer(
              hpadding: 4.w,
              vpadding: 2.h,
                borderRadius: 20,
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 3.h,
                          backgroundColor: AppColors.primary,
                          backgroundImage: AssetImage(AppImages.john),
                        ),
                        4.width,
                        MyText(
                          text: widget.name,
                          color: AppColors.black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                    2.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText(
                          text: "Ratings given:",
                          color: AppColors.black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        Row(
                          children: [
                            Icon(Icons.star, size: 6.w, color: AppColors.yellow,),
                            Icon(Icons.star, size: 6.w, color: AppColors.yellow,),
                            Icon(Icons.star, size: 6.w, color: AppColors.yellow,),
                          ],
                        )
                      ],
                    ),
                    1.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText(
                          text: "${widget.type} given at:",
                          color: AppColors.black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        MyText(
                          text: "12th Sept,2023 at 03:46 PM",
                          color: AppColors.black,
                          fontSize: 8.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                    2.height,
                    MyText(
                    text: "One disadvantage of Lorem Ipsum is that in Latin certain letters appear more frequently than others which creates a distinct visual impression. One disadvantage of Lorem Ipsum is that in Latin certain letters appear more frequently than others which creates a distinct visual impression. One disadvantage of Lorem Ipsum is that in Latin certain letters appear more frequently than others which creates a distinct visual impression. One disadvantage of Lorem Ipsum is that in Latin certain letters appear more frequently than others which creates a distinct visual impression.",
                      color: AppColors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                                ),
                  ],
                ))
          ],
        ),
      )),
    );
  }
}
