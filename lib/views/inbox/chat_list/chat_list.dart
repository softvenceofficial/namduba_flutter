import 'package:get/get.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/inbox/chat_list/component/no_message_box.dart';
import 'package:nanduba/views/inbox/chat_screen/chat_screen.dart';
import 'package:nanduba/widgets/core/my_text.dart';

class ChatList extends StatefulWidget {
  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  int selectedButtonIndex = 0;

  List<Map<String, dynamic>> allchatList = [
    {
      "image": AppImages.girl1,
      "name": "Anika Philips",
      "lastmessage": "It is a long established",
      "isVerified": true,
      "isOnline": true,
      "unreadMessages": 2,
    },
    {
      "image": AppImages.girl2,
      "name": "Talan George",
      "lastmessage": "It is a long established",
      "isVerified": false,
      "isOnline": false,
      "unreadMessages": 0,
    },
    {
      "image": AppImages.boy1,
      "name": "Aspen Dokidis",
      "lastmessage": "It is a long established",
      "isVerified": false,
      "isOnline": false,
      "unreadMessages": 0,
    },
  ];
  List<Map<String, dynamic>> marketplaceList = [
    {
      "image": AppImages.girl2,
      "name": "Talan George",
      "lastmessage": "It is a long established",
      "isVerified": false,
      "isOnline": false,
      "unreadMessages": 0,
    },
    {
      "image": AppImages.boy1,
      "name": "Aspen Dokidis",
      "lastmessage": "It is a long established",
      "isVerified": false,
      "isOnline": false,
      "unreadMessages": 0,
    },
  ];
  List<Map<String, dynamic>> supportList = [
    {
      "image": AppImages.girl1,
      "name": "Anika Philips",
      "lastmessage": "It is a long established",
      "isVerified": true,
      "isOnline": true,
      "unreadMessages": 2,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton:Container(
      //   height: 50,
      //   width: 50,
      //   decoration: BoxDecoration(
      //     shape: BoxShape.circle,
      //     color: AppColors.primary,
      //   ),
      //   child: Icon(Icons.add,color: Colors.white,),
      // ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              2.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: MyText(
                      text: "Messages",
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                    ),
                  ),
                  CircleAvatar(
                    radius: 3.h,
                    foregroundImage: const AssetImage(AppImages.boy1),
                  ),
                ],
              ),
              2.height,
              Row(
                children: [
                  CustomButton(
                    labelFontWeight: FontWeight.w600,
                    width: 13.w,
                    height: 4.5.h,
                    hPadding: 0,
                    vPadding: 0,
                    borderColor: AppColors.white,
                    label: "All",
                    labelFontSize: 10.sp,
                    onPressed: () {
                      setState(() {
                        selectedButtonIndex = 0;
                      });
                    },
                    backgroundColor: selectedButtonIndex == 0
                        ? AppColors.primary
                        : Colors.transparent,
                    foregroundColor: selectedButtonIndex == 0
                        ? AppColors.white
                        : AppColors.carPartGrey,
                  ),
                  Spacer(),
                  CustomButton(
                    width: 26.w,
                    height: 4.5.h,
                    hPadding: 0,
                    vPadding: 0,
                    borderColor: AppColors.white,
                    label: "Marketplace",
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
                        : AppColors.carPartGrey,
                  ),
                  Spacer(),
                  CustomButton(
                    width: 21.w,
                    height: 4.7.h,
                    hPadding: 0,
                    vPadding: 0,
                    borderColor: AppColors.white,
                    label: "Supports",
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
                        : AppColors.carPartGrey,
                  ),
                  Spacer(
                    flex: 3,
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
              2.height,
              Expanded(
                child: ListView.builder(
                    itemCount: selectedButtonIndex == 0
                        ? allchatList.length
                        : selectedButtonIndex == 1
                            ? marketplaceList.length
                            : supportList.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      final chat = selectedButtonIndex == 0
                          ? allchatList[index]
                          : selectedButtonIndex == 1
                              ? marketplaceList[index]
                              : supportList[index];
                      return GestureDetector(
                        onTap: () {
                          AppCustomNavigator.push(context, ChatScreenMain());
                        },
                        child: CustomContainer(
                          hpadding: 3.w,
                          vpadding: 1.3.h,
                          vMargin: 0.8.h,
                          borderRadius: 6.w,
                          child: Row(
                            children: [
                              Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  CircleAvatar(
                                    radius: 3.5.h,
                                    foregroundImage: AssetImage(chat['image']),
                                  ),
                                  if (chat['isVerified'] == true)
                                    Positioned(
                                        top: -5,
                                        left: -2,
                                        child:
                                            SvgPicture.asset(AppSvgs.bluetick)),
                                  if (chat['isOnline'] == true)
                                    Positioned(
                                        bottom: 4,
                                        right: 0,
                                        child: Container(
                                          height: 11,
                                          width: 11,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColors.greenColor,
                                              border: Border.all(
                                                  color: Colors.white)),
                                        )),
                                ],
                              ),
                              2.width,
                              // Expanded(
                              //   child: Column(
                              //
                              //     children: [
                              //       Row(
                              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //         crossAxisAlignment: CrossAxisAlignment.center,
                              //         children: [
                              //           MyText(
                              //             text:chat['name'],
                              //               fontWeight: FontWeight.w600,
                              //               fontSize: 13.sp,
                              //               color: AppColors.textColor,
                              //           ),
                              //           MyText(
                              //             text:"01/01/2024",
                              //               fontWeight: FontWeight.w400,
                              //               color: AppColors.grey,
                              //               fontSize: 10.sp,
                              //           ),
                              //         ],
                              //       ),
                              //       // if(chat['unreadMessages']==0)
                              //       0.5.height,
                              //       Row(
                              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //         children: [
                              //           SizedBox(
                              //             width: 50.w,
                              //             child: MyText(
                              //               text:chat['lastmessage'],
                              //                 fontWeight: FontWeight.w400,
                              //                 fontSize: 11.sp,
                              //                 overflow: TextOverflow.ellipsis,
                              //                 color: AppColors.grey
                              //             ),
                              //           ),
                              //           if(chat['unreadMessages']>0)
                              //           CircleAvatar(
                              //             backgroundColor: AppColors.primary,
                              //             radius: 1.5.h,
                              //             child:      Text(chat['unreadMessages'].toString(),style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              //                 fontWeight: FontWeight.w600,
                              //                 color: AppColors.white,
                              //                 fontSize: 11.sp
                              //             ),),
                              //           )
                              //
                              //         ],
                              //       )
                              //     ],
                              //   ),
                              // ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        MyText(
                                          text: chat['name'],
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13.sp,
                                          color: AppColors.textColor,
                                        ),
                                        0.6.height,
                                        SizedBox(
                                          width: 45.w,
                                          child: MyText(
                                              text: chat['lastmessage'],
                                              fontWeight: FontWeight.w400,
                                              fontSize: 11.sp,
                                              overflow: TextOverflow.ellipsis,
                                              color: AppColors.grey),
                                        ),
                                      ],
                                    ),
                                    // if(chat['unreadMessages']==0)
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        MyText(
                                          text: "01/01/2024",
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.grey,
                                          fontSize: 10.sp,
                                        ),
                                        0.1.height,
                                        // if(chat['unreadMessages']>0)
                                        CircleAvatar(
                                          backgroundColor:
                                              chat['unreadMessages'] > 0
                                                  ? AppColors.primary
                                                  : Colors.transparent,
                                          radius: 1.3.h,
                                          child: Text(
                                            chat['unreadMessages'].toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .copyWith(
                                                    fontWeight: FontWeight.w600,
                                                    color: AppColors.white,
                                                    fontSize: 9.sp),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              // NoMessageBox()
            ],
          ),
        ),
      ),
    );
  }
}
