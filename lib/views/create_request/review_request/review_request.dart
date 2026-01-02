import 'package:get/get.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/create_request/gather_estimate/gathering_estimate.dart';
import 'package:nanduba/views/create_request/review_request/component/bottom_address_and_button.dart';
import 'package:nanduba/views/create_request/review_request/component/request_service_details_list.dart';
import 'package:nanduba/views/manage_address/manage_address_screen.dart';
import 'package:nanduba/widgets/core/my_text.dart';

class ReviewRequest extends StatefulWidget {
  const ReviewRequest({super.key});

  @override
  State<ReviewRequest> createState() => _ReviewRequestState();
}

class _ReviewRequestState extends State<ReviewRequest> {
  RxInt showMore = (-1).obs;
  RxList<Map<String, dynamic>> myRequests = [
    {
      "serviceName": "Vehicle Recovery",
      "description":"This is the movement from pickup.",
      "detail": [
        {
          "name": "BMW",
          "number": "bmw780",
        },
        {
          "name": "BMW",
          "number": "bmw760",
        },
      ]
    },
    {

      "serviceName": "Register Motor Vehicle",
      "description":"Process of registering with RTS9",

      "detail": [
        {
          "name": "BMW",
          "number": "bmw780",
        },
      ]
    },
  ].obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            2.height,
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 4.w,
              ),
              child:  CustomAppbar(
                title: AppText.yourrequest,
                isPop: true,
                isSearch: false,
                isRequestAdd: true,
                onAddButtonTap: (){
                  AppCustomNavigator.push(context, ServicesScreen());

                },
              ),
            ),
            2.height,
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Obx(() {
                      return ListView.builder(
                          itemCount: myRequests.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.symmetric(
                              horizontal: 4.w, vertical: 1.h),
                          itemBuilder: (context, index) {
                            final requests = myRequests[index];
                            return Column(
                              children: [
                                CustomContainer(
                                  hpadding: 15,
                                  vpadding: 12,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              MyText(
                                                text: requests['serviceName'],
                                                color: AppColors.textColor,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12.sp,
                                              ),
                                              SizedBox(
                                                width: 60.w,
                                                child: MyText(
                                                  text:requests['description'],
                                                  color: AppColors.textColor,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 10.sp,
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                          Container(
                                            height: 34,
                                            width: 34,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: AppColors.secondary,
                                            ),
                                            child: SvgPicture.asset(
                                              AppSvgs.edit,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 6,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              myRequests.removeAt(index);
                                            },
                                            child: Container(
                                              height: 34,
                                              width: 34,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: AppColors.secondary,
                                              ),
                                              child: SvgPicture.asset(
                                                AppSvgs.trash,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                      1.height,
                                      Row(
                                        children: [
                                          Text(
                                              "Quantity ${requests['detail'].length.toString()}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                  color:
                                                  AppColors.textColor,
                                                  fontWeight:
                                                  FontWeight.w500)),
                                          Spacer(),
                                          GestureDetector(onTap: () {
                                            if (showMore.value == index) {
                                              showMore.value = -1;
                                            } else {
                                              showMore.value = index;
                                            }
                                          }, child: Obx(() {
                                            return Icon(
                                              showMore.value == index
                                                  ? Icons.keyboard_arrow_up
                                                  : Icons.keyboard_arrow_down,
                                              color: AppColors.textColor,
                                            );
                                          }))
                                        ],
                                      ),
                                      Obx(
                                        () => showMore.value == index
                                            ? RequestServiceDetailsList(
                                                requests: requests,
                                              )
                                            : SizedBox.shrink(),
                                      )
                                    ],
                                  ),
                                ),
                                2.height,
                              ],
                            );
                          });
                    }),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                      child: CustomButton(
                        label: "Add More Services",
                        onPressed: () {
                          AppCustomNavigator.push(context, ServicesScreen());
                        },
                        backgroundColor: Colors.transparent,
                        foregroundColor: AppColors.primary,
                      ),
                    )
                  ],
                ),
              ),
            ),
            RequestBottomAddressAndButton(),
          ],
        ),
      ),
    );
  }
}
