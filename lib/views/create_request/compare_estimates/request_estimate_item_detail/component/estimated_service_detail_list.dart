import 'package:get/get.dart';

import '../../../../../export.dart';

class EstimatedServiceDetailList extends StatefulWidget {
  const EstimatedServiceDetailList({super.key});

  @override
  State<EstimatedServiceDetailList> createState() =>
      _EstimatedServiceDetailListState();
}

class _EstimatedServiceDetailListState extends State<EstimatedServiceDetailList>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<Offset>> _offsetAnimations;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
        serviceList.length,
        (index) => AnimationController(
            vsync: this, duration: Duration(milliseconds: 300)));
    _offsetAnimations = _controllers
        .map((controller) =>
            Tween<Offset>(begin: Offset.zero, end: Offset(-0.15, 0))
                .animate(controller))
        .toList();
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  List<Map<String, dynamic>> serviceList = [
    {
      "serviceName": "Change of Ownership",
      "price": "600",
      "category": "Service",
      "status":"Pending",
      "items": [],
    },
    {
      "serviceName": "Change of Ownership",
      "price": "600",
      "category": "Bundle",
      "status":"Completed",

      "items": [
        {
          "name": "Spark Plug",
          "qty": 5,
          "itemPrice": 200,
          "total": 1000,
        },
        {
          "name": "Spark Plug",
          "qty": 5,
          "itemPrice": 100,
          "total": 500,
        }
      ],
    },
  ];

  RxInt showMore = (-1).obs;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: serviceList.length,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final detail = serviceList[index];
          return Stack(
            children: [
              Positioned.fill(
                child: GestureDetector(
                  onTap: () {
                    serviceList.removeAt(index);
                    setState(() {});
                  },
                  child: Container(
                      margin: EdgeInsets.symmetric(vertical: 1.05.h),
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.w,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(5.w),
                      ),
                      alignment: Alignment.centerRight,
                      child: SvgPicture.asset(
                        AppSvgs.trash,
                        color: Colors.white,
                        height: 3.h,
                      )),
                ),
              ),
              SlideTransition(
                position: _offsetAnimations[index],
                child: GestureDetector(
                  onHorizontalDragUpdate: (details) {
                    if (details.primaryDelta! < -4) {
                      _controllers[index].forward();
                    } else if (details.primaryDelta! > 4) {
                      _controllers[index].reverse();
                    }
                  },
                  child: Obx(() {
                    return CustomContainer(
                      borderRadius: 5.w,
                      vMargin: 1.h,
                      // hMargin: 5.w,
                      hpadding: 3.w,
                      vpadding: 1.2.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                // height: 7.5.h,
                                // width: 16.w,
                                height: 58,
                                width: 58,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: AppColors.midLightGrey,
                                    borderRadius: BorderRadius.circular(16)),
                                child: Image.asset(
                                  AppImages.car_benz,
                                ),
                              ),
                              2.width,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    0.2.height,
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 50.w,
                                          child: Text(detail['serviceName'],
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge!
                                                  .copyWith(
                                                      color:
                                                          AppColors.textColor,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      height: 1)),
                                        ),
                                        Spacer(),
                                        Text("\$${detail['price']}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .copyWith(
                                                    color: AppColors.primary,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                      ],
                                    ),
                                    // 1.height,
                                    0.5.height,
                                    Row(
                                      children: [
                                        Text("Mercedes-Benz AAZ 1234",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                    color:
                                                        AppColors.midDarkGrey,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12)),
                                        Spacer(),
                                        if (detail['items'].isNotEmpty)
                                          GestureDetector(onTap: () {
                                            if (showMore.value == index) {
                                              showMore.value = -1;
                                            } else {
                                              showMore.value = index;
                                            }
                                          }, child: Obx(() {
                                            return Icon(
                                              showMore.value == index
                                                  ? Icons
                                                      .keyboard_arrow_up_sharp
                                                  : Icons
                                                      .keyboard_arrow_down_sharp,
                                              color: AppColors.primary,
                                            );
                                          })),
                                        // Container(
                                        //   padding: EdgeInsets
                                        //       .symmetric(
                                        //       vertical:
                                        //       0.5.h,
                                        //       horizontal:
                                        //       2.w),
                                        //   alignment: Alignment
                                        //       .center,
                                        //   decoration: BoxDecoration(
                                        //       color: AppColors
                                        //           .secondary,
                                        //       borderRadius:
                                        //       BorderRadius
                                        //           .circular(
                                        //           8)),
                                        //   child: Text(
                                        //     detail[
                                        //     'category'],
                                        //     style: Theme.of(
                                        //         context)!
                                        //         .textTheme
                                        //         .bodyLarge!
                                        //         .copyWith(
                                        //         color: AppColors
                                        //             .primary,
                                        //         fontSize:
                                        //         11),
                                        //   ),
                                        // )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          0.8.height,
                          Container(
                            width: 18.w,
                            padding: EdgeInsets
                                .symmetric(
                                vertical:
                                0.5.h,
                                horizontal:
                               2.w),
                            alignment: Alignment
                                .center,
                            decoration: BoxDecoration(
                                color:serviceList[index]['status']=="Pending"?AppColors.secondary: AppColors.lightGreen,
                                borderRadius:
                                BorderRadius
                                    .circular(
                                    8)),
                            child: FittedBox(
                              child: Text(
                                serviceList[index]['status'],
                                style: Theme.of(
                                    context)!
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                    color:serviceList[index]['status']=="Pending"?AppColors.primary: AppColors.green3
                                        ,
                                    fontSize:
                                    8),
                              ),
                            ),
                          ),


                          if (showMore.value == index)
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 1.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  2.height,
                                  Row(
                                    children: [
                                      Text(
                                        "Items",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                              color: AppColors.midDarkGrey,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                            ),
                                      ),
                                      Spacer(),
                                      Text(
                                        "Qty",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                              color: AppColors.midDarkGrey,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      Spacer(),
                                      Text(
                                        "Total",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                              color: AppColors.midDarkGrey,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                      children: List.generate(
                                    detail['items'].length,
                                    (itemindex) => Column(
                                      children: [
                                        Divider(
                                          color: AppColors.border,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 35.w,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    detail['items'][itemindex]
                                                        ['name'],
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyLarge!
                                                        .copyWith(
                                                          color: AppColors
                                                              .textColor,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 14,
                                                        ),
                                                  ),
                                                  Text(
                                                    "\$${detail['items'][itemindex]['itemPrice']}",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyLarge!
                                                        .copyWith(
                                                          color:
                                                              AppColors.primary,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 12,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            6.width,
                                            Text(
                                              detail['items'][itemindex]['qty']
                                                  .toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge!
                                                  .copyWith(
                                                    color: AppColors.textColor,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                            Spacer(),
                                            Text(
                                              "\$${detail['items'][itemindex]['total']}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge!
                                                  .copyWith(
                                                    color: AppColors.textColor,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )),
                                ],
                              ),
                            ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ],
          );
        });
  }
}
