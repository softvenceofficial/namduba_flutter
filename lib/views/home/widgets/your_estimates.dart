import 'package:get/get.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/create_request/compare_estimates/compare_estimates.dart';
import 'package:nanduba/views/create_request/compare_estimates/estimate_details/estimate_details.dart';

class YourEstimates extends StatefulWidget {
  const YourEstimates(
      {super.key,
      required this.estimatesIds,
      required this.date,
      required this.estimatesType,
      required this.services,
      required this.estimated});
  final List<String> estimatesIds;
  final List<String> date;
  final List<String> estimatesType;
  final List<List<String>> services;
  final List<String> estimated;

  @override
  State<YourEstimates> createState() => _YourEstimatesState();
}

class _YourEstimatesState extends State<YourEstimates> {
  bool isClosed = false;
  late List<bool> expandedItems;
  late List<bool> showMoreItems;

  @override
  void initState() {
    super.initState();
    expandedItems = List.generate(widget.services.length, (index) => false);
    showMoreItems = List.generate(widget.services.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // setState(() {
        //   isClosed = false;
        // });
      },
      child: CustomContainer(
          // vMargin: 2.h,
          color: AppColors.secondary,
          borderRadius: 20.sp,
          width: MediaQuery.of(context)!.size.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppText.yourEstimates,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(fontSize: 14.sp),
                    ),
                    // !isClosed
                    //     ?
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          // isClosed = !isClosed;
                          expandedItems = List.generate(
                              widget.services.length, (index) => false);
                          showMoreItems = List.generate(
                              widget.services.length, (index) => false);
                        });
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(
                        AppSvgs.closeCircle,
                        width: 6.w,
                        color: AppColors.primary,
                      ),
                    )
                    // : const SizedBox.shrink(),
                  ],
                ),
              ),
              for (int i = 0; i < widget.estimatesIds.length; i++)
                // ?
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(
                          i == widget.estimatesIds.length - 1 ? 20.sp : 0),
                      bottomRight: Radius.circular(
                          i == widget.estimatesIds.length - 1 ? 20.sp : 0),
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  widget.estimatesIds[i],
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(fontWeight: FontWeight.w600),
                                ),
                                2.width,
                                CircleAvatar(
                                  backgroundColor: AppColors.primary,
                                  radius: 0.5.w,
                                ),
                                1.width,
                                Text(
                                  DateFormat('MMM dd,')
                                      .add_jm()
                                      .format(DateTime.now()),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.midDarkGrey,
                                        fontSize: 10.sp,
                                      ),
                                )
                              ],
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Spacer(),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 0.5.h,
                                      horizontal: 3.w,
                                    ),
                                    decoration: BoxDecoration(
                                      color: widget.estimatesType[i] == 'Quoted'
                                          ? AppColors.secondary
                                          : AppColors.lightYellow,
                                      borderRadius:
                                          BorderRadius.circular(20.sp),
                                    ),
                                    child: Text(
                                      widget.estimatesType[i],
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: widget.estimatesType[i] ==
                                                    'Quoted'
                                                ? AppColors.primary
                                                : AppColors.darkYellow,
                                          ),
                                    ),
                                  ),
                                  Spacer(),
                                  Column(
                                    children: [
                                      SvgPicture.asset(AppSvgs.more),
                                      widget.services[i].length > 1
                                          ? GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  expandedItems[i] =
                                                      !expandedItems[i];
                                                  if (showMoreItems[i]) {
                                                    showMoreItems[i] =
                                                        !showMoreItems[i];
                                                  }
                                                });
                                              },
                                              child: const Icon(
                                                  Icons.keyboard_arrow_down),
                                            )
                                          : const SizedBox.shrink(),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        2.height,
                        for (int j = 0; j < widget.services[i].length; j++) ...{
                          if (j == 0 ||
                              (expandedItems[i] &&
                                  (j < 6 || showMoreItems[i]))) ...{
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: AppColors.primary,
                                  radius: 0.5.w,
                                ),
                                2.width,
                                Text(
                                  widget.services[i][j],
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 10.sp),
                                ),
                              ],
                            ),
                            1.height
                          },
                        },
                        if (widget.services[i].length > 6 &&
                            expandedItems[i] &&
                            !showMoreItems[i])
                          InkWell(
                            onTap: () {
                              setState(() {
                                showMoreItems[i] = true;
                              });
                            },
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                AppText.seeMore,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.midDarkGrey,
                                      decoration: TextDecoration.underline,
                                      decorationColor: AppColors.midDarkGrey,
                                    ),
                              ),
                            ),
                          ),
                        2.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Estimates',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.midDarkGrey,
                                      ),
                                ),
                                Text(
                                  widget.estimated.asMap()[i] == null
                                      ? '-'
                                      : widget.estimated[i],
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ],
                            ),
                            widget.estimated.asMap()[i] != null
                                ? CustomButton(
                                    width: 32.w,
                                    height: 5.h,
                                    labelFontSize: 11.sp,
                                    label: AppText.viewDetails,
                                    onPressed: () {
                                      Get.to(() => CompareEstimates());
                                    })
                                : const SizedBox.shrink()
                          ],
                        ),
                        if (widget.estimatesIds.length - 1 != i) ...{
                          1.height,
                          const Divider(
                            color: AppColors.lightGrey,
                          ),
                        }
                      ],
                    ),
                  ),
                )
              // : const SizedBox.shrink(),
            ],
          )),
    );
  }
}
