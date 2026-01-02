import 'package:nanduba/export.dart';
import 'package:nanduba/views/create_request/review_request/review_request.dart';
import 'package:nanduba/views/create_request/view_requests/view_requests.dart';

class ServicesBottomSheet extends StatefulWidget {
  const ServicesBottomSheet({
    super.key,
    required this.title,
    required this.index,
    this.shouldShowBottomSheet = false,
    this.showForIndex = -1, // Index to show the bottom sheet for
    this.showForTitle = '', // Title to show the bottom sheet for
  });

  final String title;
  final int index;
  final bool shouldShowBottomSheet;
  final int showForIndex; // Index for conditional display
  final String showForTitle; // Title for conditional display

  @override
  State<ServicesBottomSheet> createState() => _ServicesBottomSheetState();
}

class _ServicesBottomSheetState extends State<ServicesBottomSheet> {
  int quantity = 1;
  bool isContainerVisible = false;
  List<String> items =
      List.generate(10, (index) => '2012 Chevrolet Cruze $index');
  List<String> filteredItems = [];
  List<String> choosedItems = [];
  String selectedItem = '';
  TextEditingController searchController = TextEditingController();
  bool showField = false;

  @override
  void initState() {
    super.initState();
    filteredItems = items;

    // Check if the current index and title match the ones for which we should show the bottom sheet
    if (widget.shouldShowBottomSheet &&
        (widget.showForIndex == widget.index) &&
        (widget.showForTitle == widget.title)) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showModalBottomSheet(context);
        setState(() {
          isBorder[widget.index] = true;
        });
      });
    }
  }

  void _filterItems(String query) {
    setState(() {
      filteredItems = items
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  Future<void> _showModalBottomSheet(BuildContext context) async {
    await showModalBottomSheet(
      backgroundColor: AppColors.white,
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.sp)),
      ),
      builder: (BuildContext context) {
        return SafeArea(
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setModalState) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: SingleChildScrollView(
                    child: Wrap(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                            onTap: () {
                              AppCustomNavigator.pop(context);
                              setState(() {
                                isBorder[widget.index] = false;
                                isContainerVisible = false;
                                showField = false;
                              });
                            },
                            child: SvgPicture.asset(
                              AppSvgs.closeCircle,
                              color: AppColors.primary,
                              height: 2.5.h,
                            ),
                          ),
                        ),
                        4.height,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomHeading(
                              title: widget.title,
                              suffixText: AppText.addNotes,
                              isSuffixSvg: true,
                              suffixSvg: AppSvgs.addNotes,
                              onTap: () {},
                            ),
                            SizedBox(height: 1.h),
                            Text(
                              'One disadvantage of Lorem Ipsum is that in Latin certain letters appear more frequently impression.',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.midDarkGrey,
                                    fontSize: 9.sp,
                                  ),
                            ),
                            Column(
                              children: [
                                for (int i = 0;
                                    i < choosedItems.length;
                                    i++) ...{
                                  2.height,
                                  Row(
                                    children: [
                                      Image.asset(
                                        AppImages.logo,
                                        height: 2.5.h,
                                      ),
                                      SizedBox(width: 3.w),
                                      Text(choosedItems[i]),
                                    ],
                                  ),
                                }
                              ],
                            ),
                            if (showField) ...{
                              SizedBox(height: 2.h),
                              CustomTextField(
                                name: 'searchVehicle',
                                hintText: AppText.searchVehicle,
                                controller: searchController,
                                prefixIcon: SvgPicture.asset(
                                  AppSvgs.searchIcon,
                                  fit: BoxFit.scaleDown,
                                ),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setModalState(() {
                                      isContainerVisible = !isContainerVisible;
                                    });
                                  },
                                  child: const Icon(
                                      Icons.keyboard_arrow_down_rounded),
                                ),
                                onChanged: (p0) {
                                  setModalState(() {
                                    _filterItems(p0 ?? '');
                                    isContainerVisible = p0!.isNotEmpty;
                                  });
                                },
                              ),
                              isContainerVisible
                                  ? ConstrainedBox(
                                      constraints: BoxConstraints(
                                        maxHeight: 28.h,
                                        maxWidth: double.infinity,
                                      ),
                                      child: IntrinsicHeight(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: AppColors.border),
                                            borderRadius:
                                                BorderRadius.circular(20.sp),
                                          ),
                                          child: SingleChildScrollView(
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 1.h,
                                                  horizontal: 4.w),
                                              child: Column(
                                                children: [
                                                  for (int i = 0;
                                                      i < filteredItems.length;
                                                      i++) ...{
                                                    GestureDetector(
                                                      onTap: () {
                                                        setModalState(() {
                                                          selectedItem =
                                                              filteredItems[i];
                                                          // searchController.text =
                                                          //     selectedItem;
                                                          isContainerVisible =
                                                              false;
                                                          showField = false;
                                                          choosedItems.add(
                                                              selectedItem);
                                                        });
                                                      },
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Image.asset(
                                                                AppImages.logo,
                                                                height: 2.5.h,
                                                              ),
                                                              SizedBox(
                                                                  width: 3.w),
                                                              Text(
                                                                  filteredItems[
                                                                      i]),
                                                            ],
                                                          ),
                                                          Radio<String>(
                                                            value:
                                                                filteredItems[
                                                                    i],
                                                            groupValue:
                                                                selectedItem,
                                                            onChanged: (value) {
                                                              setModalState(() {
                                                                selectedItem =
                                                                    value!;
                                                                // searchController
                                                                //         .text =
                                                                //     selectedItem;
                                                                isContainerVisible =
                                                                    false;
                                                                showField =
                                                                    false;
                                                                choosedItems.add(
                                                                    selectedItem);
                                                              });
                                                            },
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    if (i !=
                                                        filteredItems.length -
                                                            1)
                                                      const Divider(
                                                          color:
                                                              AppColors.border),
                                                  }
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                            },
                            1.5.height,
                            choosedItems.isNotEmpty
                                ? TextButton(
                                    onPressed: () {
                                      setModalState(() {
                                        showField = true;
                                      });
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SvgPicture.asset(
                                          AppSvgs.add,
                                          color: AppColors.primary,
                                        ),
                                        Text(
                                          'Add more',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                  color: AppColors.primary,
                                                  fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  )
                                : SizedBox.shrink(),
                            1.5.height,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Container(
                                //   decoration: BoxDecoration(
                                //     border: Border.all(color: AppColors.border),
                                //     borderRadius: BorderRadius.circular(20.sp),
                                //     color: AppColors.secondary,
                                //   ),
                                //   height: 6.h,
                                //   child: Row(
                                //     children: [
                                //       IconButton(
                                //         icon: const Icon(
                                //           Icons.remove,
                                //           color: AppColors.primary,
                                //         ),
                                //         onPressed: () => setModalState(() {
                                //           if (quantity > 1) quantity--;
                                //         }),
                                //       ),
                                //       Text('$quantity'),
                                //       IconButton(
                                //         icon: const Icon(
                                //           Icons.add,
                                //           color: AppColors.primary,
                                //         ),
                                //         onPressed: () => setModalState(() {
                                //           quantity++;
                                //         }),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                // 4.width,
                                Expanded(
                                  child: CustomButton(
                                    backgroundColor: AppColors.transparent,
                                    foregroundColor: AppColors.primary,
                                    label: choosedItems.isNotEmpty
                                        ? 'Proceed'
                                        : '+ Add Vehicle',
                                    // height: 6.h,
                                    onPressed: () {
                                      if (choosedItems.isNotEmpty) {
                                        AppCustomNavigator.push(
                                            context, ReviewRequest());
                                      } else {
                                        // _addVehicleBottomSheet(context);
                                        setModalState(() {
                                          showField = true;
                                        });
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );

    // Update state when the bottom sheet is dismissed
    setState(() {
      isBorder[widget.index] = false;
      isContainerVisible = false;
      showField = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SubServiceCustomTile(
        title: widget.title,
        isBorder: isBorder[widget.index],
        onTap: () {
          setState(() {
            isBorder[widget.index] = true;
          });
          _showModalBottomSheet(context);
        },
        addOnTap: () {},
        minusOnTap: () {},
      ),
    );
  }
}
