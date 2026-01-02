
import 'dart:math';

import 'package:get/get.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/inbox/chat_list/component/no_message_box.dart';
import 'package:nanduba/views/inbox/chat_screen/chat_screen.dart';
import 'package:nanduba/widgets/core/my_text.dart';



class NotificationScreen extends StatefulWidget {
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Padding(
          padding:EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              2.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 6.h,
                      width: 6.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(15.w),
                      ),
                      child: const Center(
                        child: Icon(Icons.arrow_back_ios_new_rounded),
                      ),
                    ),
                  ),
                  2.width,
                  Expanded(
                    child: Text(
                      "Notifications",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  CircleAvatar(
                    radius: 3.h,

                    foregroundImage: const AssetImage(AppImages.boy1),
                  ),
                ],
              ),
              2.height,

              CustomTextField(
                name: 'search',
                enableBorder: AppColors.kEnableBorderGrey,
                prefixIcon: SvgPicture.asset(
                  AppSvgs.searchIcon,
                  fit: BoxFit.scaleDown,
                ),
                hintText: AppText.search,
                showShadow: true,
                onEditComplete: () {},

              ),
              3.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    MyText(text: "Recent",fontWeight: FontWeight.w600,fontSize: 15.sp,color: AppColors.textColor,),
                    Container(
                    padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 1.5.h),
                    width: 40.w,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.border),
                    borderRadius: BorderRadius.circular(16),

                  ),
                    child: Row(
                      children: [
                        MyText(text: "Unread",fontWeight: FontWeight.w400,fontSize: 12.sp,color: AppColors.black,),
                        Spacer(),
                        Transform.rotate(
                            angle: pi/2,
                            child: Icon(Icons.arrow_forward_ios_rounded,size: 20,color: AppColors.darkGrey,))

                      ],
                    ),

                  )
                ],
              ),
              1.height,
              Expanded(
                child: ListView.builder(
                    itemCount: 3,
                    shrinkWrap: true,
                    itemBuilder: (context,index) {
                      return GestureDetector(
                        onTap: (){},
                        child: CustomContainer(
                          hpadding: 4.w,
                          vpadding: 1.2.h,
                          vMargin: 0.8.h,
                          borderRadius: 6.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                children: [
                                  SizedBox(
                                    width:58.w,
                                    child: MyText(
                                      text: "Road tax for Toyota ALB",
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textColor,
                                      fontSize: 13.sp,
                                      overflow: TextOverflow.ellipsis

                                    ),
                                  ),
                                  Text("5 mins ago",style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.grey,
                                      fontSize: 10.sp
                                  ),),
                                ],
                              ),
                              1.height,
                              SizedBox(
                                width: 80.w,
                                child: MyText(
                                  text: "Road tax for Toyota Hilux ALB 6152 is about...",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11.sp,
                                    overflow: TextOverflow.ellipsis,
                                    color: AppColors.grey
                                ),
                              )
                            ],
                          ),),
                      );
                    }
                ),
              ),
              // NoMessageBox()
            ],
          ),
        ),
      ),
    );
  }
}








