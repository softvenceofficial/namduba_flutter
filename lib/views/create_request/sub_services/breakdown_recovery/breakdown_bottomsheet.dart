import 'package:get/get.dart';
import 'package:nanduba/export.dart';

class BreakdownBottomsheet extends StatefulWidget {
  const BreakdownBottomsheet({
    super.key,
    required this.title,
    required this.index,
  });
  final String title;
  final int index;

  @override
  State<BreakdownBottomsheet> createState() => _BreakdownBottomsheet();
}

class _BreakdownBottomsheet extends State<BreakdownBottomsheet> {
  bool isContainerVisible = false;
  List<String> items =
      List.generate(10, (index) => '2012 Chevrolet Cruze $index');
  List<String> filteredItems = [];
  String selectedItem = '';
  bool showVehicle = false;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    filteredItems = items;
    super.initState();
  }

  void _filterItems(String query) {
    setState(() {
      filteredItems = items
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
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
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Padding(
              padding: EdgeInsets.fromLTRB(4.w, 2.h, 4.w, 2.h),
              child: Wrap(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(
                        AppSvgs.closeCircle,
                        color: AppColors.primary,
                        height: 2.5.h,
                      ),
                    ),
                  ),
                  2.height,
                  CustomHeading(
                    title: widget.title,
                    suffixText: AppText.addNotes,
                    isSuffixSvg: true,
                    suffixSvg: AppSvgs.addNotes,
                    onTap: () {},
                  ),
                  6.height,
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'From',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontSize: 10.sp,
                                    color: AppColors.grey,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        0.5.height,
                        CustomTextField(
                          name: 'pickupLocation',
                          hintText: AppText.selectAddress,
                          prefixIcon: SvgPicture.asset(
                            AppSvgs.location2,
                            fit: BoxFit.scaleDown,
                            color: AppColors.primary,
                          ),
                          suffixIcon: SvgPicture.asset(
                            AppSvgs.map,
                            fit: BoxFit.scaleDown,
                            color: AppColors.primary,
                          ),
                        ),
                        2.height,
                        Text(
                          'To',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontSize: 10.sp,
                                    color: AppColors.grey,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        0.5.height,
                        CustomTextField(
                          name: 'Destination',
                          hintText: AppText.selectAddress,
                          prefixIcon: SvgPicture.asset(
                            AppSvgs.location2,
                            fit: BoxFit.scaleDown,
                            color: AppColors.primary,
                          ),
                          suffixIcon: SvgPicture.asset(
                            AppSvgs.map,
                            fit: BoxFit.scaleDown,
                            color: AppColors.primary,
                          ),
                        ),
                        2.height,
                        if (showVehicle) ...{
                          Text(
                            "Vehicle",
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontSize: 10.sp,
                                      color: AppColors.grey,
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                          0.5.height,
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
                              child:
                                  const Icon(Icons.keyboard_arrow_down_rounded),
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
                                        border:
                                            Border.all(color: AppColors.border),
                                        borderRadius:
                                            BorderRadius.circular(20.sp),
                                      ),
                                      child: SingleChildScrollView(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 1.h, horizontal: 4.w),
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
                                                      searchController.text =
                                                          selectedItem;
                                                      isContainerVisible =
                                                          false;
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
                                                          SizedBox(width: 3.w),
                                                          Text(
                                                              filteredItems[i]),
                                                        ],
                                                      ),
                                                      Radio<String>(
                                                        value: filteredItems[i],
                                                        groupValue:
                                                            selectedItem,
                                                        onChanged: (value) {
                                                          setModalState(() {
                                                            selectedItem =
                                                                value!;
                                                            searchController
                                                                    .text =
                                                                selectedItem;
                                                            isContainerVisible =
                                                                false;
                                                          });
                                                        },
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                if (i !=
                                                    filteredItems.length - 1)
                                                  const Divider(
                                                      color: AppColors.border),
                                              }
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : const SizedBox.shrink(),
                          2.height,
                        },
                        CustomButton(
                          label: showVehicle ? AppText.next : "Add vehicle",
                          onPressed: () {
                            if (!showVehicle) {
                              setModalState(() {
                                showVehicle = true;
                              });
                            } else {
                              Get.back();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
    // Update state when the bottom sheet is dismissed
    setState(() {
      isBorder[widget.index] = false;
    });
  }
}
