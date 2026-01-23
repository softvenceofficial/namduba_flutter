import 'package:get/get.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/add_vehicle/vehicle_profile/component/upload_image_container.dart';

import '../../../review_request/review_request.dart';

class BuyInsuranceBottomSheet extends StatefulWidget {
  const BuyInsuranceBottomSheet({
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
  State<BuyInsuranceBottomSheet> createState() => _BuyInsuranceBottomSheet();
}

class _BuyInsuranceBottomSheet extends State<BuyInsuranceBottomSheet> {
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now();
  String _period = '3 months';
  Map<String, String> items = {
    'ABC123': 'Toyota Hilux',
    'XYZ789': 'Mercedes Benz'
  };
  bool isContainerVisible = false;
  List<String> filteredItems = [];
  List<String> choosedItems = [];
  String selectedItem = '';
  bool isNote = false;
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    filteredItems = items.keys.toList();
    _endDate =
        _calculateEndDate(_startDate, int.parse(_period.split(' ').first));
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

  // Function to show Date Picker
  // Future<void> _selectStartDate(
  //     BuildContext context, StateSetter setModalState) async {
  //   final DateTime? selectedDate = await showDatePicker(
  //     context: context,
  //     initialDate: _startDate,
  //     firstDate: DateTime.now(),
  //     lastDate: DateTime(2101),
  //   );

  //   if (selectedDate != null && selectedDate != _startDate) {
  //     setModalState(() {
  //       _startDate = selectedDate;
  //       _endDate = _calculateEndDate(_startDate, _period);
  //     });
  //   }
  // }

  DateTime _calculateEndDate(DateTime startDate, int quarters) {
    final duration = Duration(days: 30 * quarters);
    return startDate.add(duration);
  }

  void _filterItems(String query) {
    setState(() {
      filteredItems = items.keys
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
          if (widget.index != 6) {
            _showModalBottomSheet(context);
          } else {
            _marineBottomSheet(context);
          }
        },
        addOnTap: () {},
        minusOnTap: () {},
      ),
    );
  }

  Future<void> _showModalBottomSheet(BuildContext context) async {
    await showModalBottomSheet(
      backgroundColor: AppColors.white,
      useSafeArea: true,
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.sp)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            DateTime selectedDate = _startDate;
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Column(
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
                          // 2.height,
                          // Text(
                          //   "License Plate",
                          //   style:
                          //       Theme.of(context).textTheme.bodySmall?.copyWith(
                          //             fontSize: 10.sp,
                          //             color: AppColors.grey,
                          //             fontWeight: FontWeight.w600,
                          //           ),
                          // ),
                          // 0.5.height,
                          // CustomTextField(
                          //   name: 'licence',
                          //   hintText: 'Search License Plate',
                          //   prefixIcon: SvgPicture.asset(
                          //     AppSvgs.carIcon,
                          //     fit: BoxFit.scaleDown,
                          //     color: AppColors.primary,
                          //   ),
                          //   suffixIcon: Icon(Icons.search_rounded),
                          // ),
                          // 2.height,
                          // Text(
                          //   "Vehicle",
                          //   style:
                          //       Theme.of(context).textTheme.bodySmall?.copyWith(
                          //             fontSize: 10.sp,
                          //             color: AppColors.grey,
                          //             fontWeight: FontWeight.w600,
                          //           ),
                          // ),
                          // 0.5.height,
                          // CustomTextField(
                          //   name: 'searchVehicle',
                          //   hintText: 'Vehicle...',
                          //   prefixIcon: SvgPicture.asset(
                          //     AppSvgs.carIcon,
                          //     fit: BoxFit.scaleDown,
                          //     color: AppColors.primary,
                          //   ),
                          // ),
                          // 2.height,
                          // Text(
                          //   AppText.sumInsured,
                          //   style:
                          //       Theme.of(context).textTheme.bodySmall?.copyWith(
                          //             fontSize: 10.sp,
                          //             color: AppColors.grey,
                          //             fontWeight: FontWeight.w600,
                          //           ),
                          // ),
                          // 0.5.height,
                          // CustomDropdown(
                          //   name: 'sumInsured',
                          //   hintText: '\$100',
                          //   suffixIcon: Padding(
                          //     padding: EdgeInsets.symmetric(
                          //       horizontal: 2.w,
                          //       vertical: 0.5.h,
                          //     ),
                          //     child: IntrinsicHeight(
                          //       child: Row(
                          //         mainAxisAlignment:
                          //             MainAxisAlignment.spaceBetween,
                          //         mainAxisSize: MainAxisSize.min,
                          //         children: [
                          //           const VerticalDivider(
                          //             color: AppColors.border,
                          //           ),
                          //           SvgPicture.asset(
                          //             AppSvgs.dollar,
                          //             fit: BoxFit.scaleDown,
                          //             color: AppColors.primary,
                          //           ),
                          //           const Icon(Icons.keyboard_arrow_down_rounded)
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          //   items:
                          //       ['\$100', '\$200', '\$400'].map((String value) {
                          //     return DropdownMenuItem<String>(
                          //       value: value,
                          //       child: Text(
                          //         value,
                          //         style: Theme.of(context).textTheme.bodyMedium,
                          //       ),
                          //     );
                          //   }).toList(),
                          // ),

                          2.height,
                          Text(
                            AppText.startDate,
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontSize: 10.sp,
                                      color: AppColors.grey,
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                          0.5.height,
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    content: Wrap(
                                      children: [
                                        SizedBox(
                                          width: double.maxFinite,
                                          child: TableCalendar(
                                            daysOfWeekHeight: 2.h,
                                            daysOfWeekStyle: DaysOfWeekStyle(
                                              weekdayStyle: TextStyle(
                                                color: AppColors.primary,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 1.5.h,
                                              ),
                                              weekendStyle: TextStyle(
                                                color: AppColors.primary,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 1.5.h,
                                              ),
                                            ),
                                            headerStyle: HeaderStyle(
                                              titleCentered: true,
                                              titleTextFormatter:
                                                  (date, locale) =>
                                                      DateFormat.yMMMM(locale)
                                                          .format(date),
                                              formatButtonVisible: false,
                                              titleTextStyle: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            firstDay: DateTime.now(),
                                            lastDay: DateTime.utc(2030, 3, 14),
                                            focusedDay: selectedDate,
                                            calendarStyle: const CalendarStyle(
                                              outsideDaysVisible: false,
                                              selectedDecoration: BoxDecoration(
                                                color: AppColors.primary,
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                            selectedDayPredicate: (day) {
                                              return isSameDay(
                                                  selectedDate, day);
                                            },
                                            onDaySelected:
                                                (selectedDay, focusedDay) {
                                              setModalState(() {
                                                selectedDate = selectedDay;
                                                _startDate = selectedDate;
                                                _endDate = _calculateEndDate(
                                                    _startDate,
                                                    int.parse(_period
                                                        .split(' ')
                                                        .first));
                                              });
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: AbsorbPointer(
                              child: CustomTextField(
                                name: 'startDate',
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        letterSpacing: 1,
                                        color: AppColors.black),
                                hintText:
                                    DateFormat('dd/MM/yyyy').format(_startDate),
                                suffixIcon: SvgPicture.asset(
                                  AppSvgs.calendar,
                                  fit: BoxFit.scaleDown,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                          ),
                          2.height,
                          Text(
                            AppText.period,
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontSize: 10.sp,
                                      color: AppColors.grey,
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                          0.5.height,
                          CustomDropdown(
                            name: 'numberQuaters',
                            hintText: '1 month',
                            prefixIcon: SvgPicture.asset(
                              AppSvgs.note,
                              fit: BoxFit.scaleDown,
                              color: AppColors.primary,
                            ),
                            initialValue: _period.toString(),
                            onChanged: (value) {
                              final String newQuarters = value!;
                              setModalState(() {
                                _period = newQuarters;
                                _endDate = _calculateEndDate(_startDate,
                                    int.parse(_period.split(' ').first));
                              });
                            },
                            items: [
                              '3 months',
                              '6 months',
                              '9 months',
                              '12 months'
                            ].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              );
                            }).toList(),
                          ),
                          2.height,
                          Text(
                            AppText.endDate,
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontSize: 10.sp,
                                      color: AppColors.grey,
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                          0.5.height,
                          CustomTextField(
                            name: 'endDate',
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    letterSpacing: 1, color: AppColors.black),
                            hintText: DateFormat('dd/MM/yyyy').format(_endDate),
                            readOnly: true,
                          ),
                          2.height,
                          if (choosedItems.isNotEmpty)
                            Text(
                              'Vehicles',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    fontSize: 10.sp,
                                    color: AppColors.grey,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          1.height,
                          for (int i = 0; i < choosedItems.length; i++) ...{
                            CustomContainer(
                              vpadding: 1.h,
                              hpadding: 2.w,
                              isBorder: true,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      '${items[choosedItems[i]]} (${choosedItems[i]})',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.edit,
                                        color: AppColors.primary,
                                      )),
                                  IconButton(
                                      onPressed: () {
                                        choosedItems.removeAt(i);
                                        setModalState(() {});
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color: AppColors.primary,
                                      ))
                                ],
                              ),
                            ),
                            2.height,
                          },
                          CustomButton(
                            label: "+ Add Vehicle",
                            backgroundColor: AppColors.transparent,
                            foregroundColor: AppColors.primary,
                            textcolor: AppColors.red,
                            onPressed: () async {
                              await _addVehicleBottomSheet(context)
                                  .whenComplete(() {
                                setModalState(() {});
                              });
                            },
                          ),
                          1.height,
                          if (choosedItems.isNotEmpty)
                            CustomButton(
                              label: "Proceed",
                              onPressed: () {
                                AppCustomNavigator.push(
                                    context, ReviewRequest());
                              },
                            )
                        ],
                      ),
                    ],
                  ),
                ),
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

  Future<void> _addVehicleBottomSheet(BuildContext context) async {
    await showModalBottomSheet(
      backgroundColor: AppColors.white,
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.sp)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
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
                    4.height,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomHeading(
                          title: AppText.whatIsRegNo,
                          suffixText: AppText.addNotes,
                          isSuffixSvg: true,
                          suffixSvg: AppSvgs.addNotes,
                          onTap: () {
                            setModalState(() {
                              isNote = true;
                            });
                          },
                        ),
                        // 2.height,
                        // Text(
                        //   "License Plate",
                        //   style:
                        //       Theme.of(context).textTheme.bodySmall?.copyWith(
                        //             fontSize: 10.sp,
                        //             color: AppColors.grey,
                        //             fontWeight: FontWeight.w600,
                        //           ),
                        // ),
                        // 0.5.height,
                        // CustomTextField(
                        //   name: 'licence',
                        //   hintText: 'Search License Plate',
                        //   prefixIcon: SvgPicture.asset(
                        //     AppSvgs.carIcon,
                        //     fit: BoxFit.scaleDown,
                        //     color: AppColors.primary,
                        //   ),
                        //   suffixIcon: Icon(Icons.search_rounded),
                        // ),
                        // 2.height,
                        // Text(
                        //   "Vehicle",
                        //   style:
                        //       Theme.of(context).textTheme.bodySmall?.copyWith(
                        //             fontSize: 10.sp,
                        //             color: AppColors.grey,
                        //             fontWeight: FontWeight.w600,
                        //           ),
                        // ),
                        // 0.5.height,
                        // CustomTextField(
                        //   name: 'searchVehicle',
                        //   hintText: 'Vehicle...',
                        //   prefixIcon: SvgPicture.asset(
                        //     AppSvgs.carIcon,
                        //     fit: BoxFit.scaleDown,
                        //     color: AppColors.primary,
                        //   ),
                        // ),

                        2.height,
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
                                                    isContainerVisible = false;
                                                  });
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            '${items[filteredItems[i]]}'),
                                                        Text(filteredItems[i]),
                                                      ],
                                                    ),
                                                    Radio<String>(
                                                      value: filteredItems[i],
                                                      groupValue: selectedItem,
                                                      onChanged: (value) {
                                                        setModalState(() {
                                                          selectedItem = value!;
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
                                              if (i != filteredItems.length - 1)
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
                        Text(
                          AppText.numberOfQuarters,
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontSize: 10.sp,
                                    color: AppColors.grey,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        0.5.height,
                        CustomDropdown(
                          name: 'numberQuaters',
                          hintText: '1 month',
                          prefixIcon: SvgPicture.asset(
                            AppSvgs.note,
                            fit: BoxFit.scaleDown,
                            color: AppColors.primary,
                          ),
                          initialValue: _period.toString(),
                          onChanged: (value) {
                            final String newQuarters = value!;
                            setModalState(() {
                              _period = newQuarters;
                              _endDate = _calculateEndDate(_startDate,
                                  int.parse(_period.split(' ').first));
                            });
                          },
                          items: [
                            '3 months',
                            '6 months',
                            '9 months',
                            '12 months'
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            );
                          }).toList(),
                        ),
                        if (widget.title == AppText.comprehensiveInsurance ||
                            widget.title == AppText.plantAndMachinery) ...{
                          2.height,
                          Text(
                            AppText.sumInsured,
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontSize: 10.sp,
                                      color: AppColors.grey,
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                          0.5.height,
                          CustomDropdown(
                            name: 'sumInsured',
                            hintText: '\$100',
                            suffixIcon: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 2.w,
                                vertical: 0.5.h,
                              ),
                              child: IntrinsicHeight(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const VerticalDivider(
                                      color: AppColors.border,
                                    ),
                                    SvgPicture.asset(
                                      AppSvgs.dollar,
                                      fit: BoxFit.scaleDown,
                                      color: AppColors.primary,
                                    ),
                                    const Icon(
                                        Icons.keyboard_arrow_down_rounded)
                                  ],
                                ),
                              ),
                            ),
                            items:
                                ['\$100', '\$200', '\$400'].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              );
                            }).toList(),
                          ),
                        },
                        if (isNote) ...{
                          2.height,
                          Text(
                            AppText.note,
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontSize: 10.sp,
                                      color: AppColors.grey,
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                          0.5.height,
                          CustomTextField(name: 'note', hintText: 'Note'),
                        },
                        2.height,
                        Text(
                          AppText.uploadImages,
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontSize: 10.sp,
                                    color: AppColors.grey,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        2.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            UploadImageContainer(),
                            UploadImageContainer(),
                            UploadImageContainer(),
                            UploadImageContainer(),
                          ],
                        ),
                        2.height,
                        CustomButton(
                          label: "Add",
                          onPressed: () {
                            choosedItems.add(selectedItem);
                            Get.back();
                          },
                        ),
                        2.height,
                        Center(
                          child: TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: Text(
                              'Never mind',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: AppColors.transparent,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 9.sp,
                                    shadows: [
                                      const Shadow(
                                          color: AppColors.black,
                                          offset: Offset(0, -5))
                                    ],
                                    decoration: TextDecoration.underline,
                                    decorationColor: AppColors.black,
                                    decorationThickness: 4,
                                  ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _marineBottomSheet(BuildContext context) async {
    await showModalBottomSheet(
      backgroundColor: AppColors.white,
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.sp)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            DateTime selectedDate = _startDate;
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: SingleChildScrollView(
                  child: Column(
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
                      4.height,
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomHeading(
                              title: widget.title,
                              suffixText: AppText.addNotes,
                              isSuffixSvg: true,
                              suffixSvg: AppSvgs.addNotes,
                              onTap: () {},
                            ),
                            // 2.height,
                            // Text(
                            //   "License Plate",
                            //   style:
                            //       Theme.of(context).textTheme.bodySmall?.copyWith(
                            //             fontSize: 10.sp,
                            //             color: AppColors.grey,
                            //             fontWeight: FontWeight.w600,
                            //           ),
                            // ),
                            // 0.5.height,
                            // CustomTextField(
                            //   name: 'licence',
                            //   hintText: 'Search License Plate',
                            //   prefixIcon: SvgPicture.asset(
                            //     AppSvgs.carIcon,
                            //     fit: BoxFit.scaleDown,
                            //     color: AppColors.primary,
                            //   ),
                            //   suffixIcon: Icon(Icons.search_rounded),
                            // ),
                            // 2.height,
                            // Text(
                            //   "Vehicle",
                            //   style:
                            //       Theme.of(context).textTheme.bodySmall?.copyWith(
                            //             fontSize: 10.sp,
                            //             color: AppColors.grey,
                            //             fontWeight: FontWeight.w600,
                            //           ),
                            // ),
                            // 0.5.height,
                            // CustomTextField(
                            //   name: 'searchVehicle',
                            //   hintText: 'Vehicle...',
                            //   prefixIcon: SvgPicture.asset(
                            //     AppSvgs.carIcon,
                            //     fit: BoxFit.scaleDown,
                            //     color: AppColors.primary,
                            //   ),
                            // ),
                            // 2.height,
                            // Text(
                            //   AppText.sumInsured,
                            //   style:
                            //       Theme.of(context).textTheme.bodySmall?.copyWith(
                            //             fontSize: 10.sp,
                            //             color: AppColors.grey,
                            //             fontWeight: FontWeight.w600,
                            //           ),
                            // ),
                            // 0.5.height,
                            // CustomDropdown(
                            //   name: 'sumInsured',
                            //   hintText: '\$100',
                            //   suffixIcon: Padding(
                            //     padding: EdgeInsets.symmetric(
                            //       horizontal: 2.w,
                            //       vertical: 0.5.h,
                            //     ),
                            //     child: IntrinsicHeight(
                            //       child: Row(
                            //         mainAxisAlignment:
                            //             MainAxisAlignment.spaceBetween,
                            //         mainAxisSize: MainAxisSize.min,
                            //         children: [
                            //           const VerticalDivider(
                            //             color: AppColors.border,
                            //           ),
                            //           SvgPicture.asset(
                            //             AppSvgs.dollar,
                            //             fit: BoxFit.scaleDown,
                            //             color: AppColors.primary,
                            //           ),
                            //           const Icon(Icons.keyboard_arrow_down_rounded)
                            //         ],
                            //       ),
                            //     ),
                            //   ),
                            //   items:
                            //       ['\$100', '\$200', '\$400'].map((String value) {
                            //     return DropdownMenuItem<String>(
                            //       value: value,
                            //       child: Text(
                            //         value,
                            //         style: Theme.of(context).textTheme.bodyMedium,
                            //       ),
                            //     );
                            //   }).toList(),
                            // ),

                            2.height,
                            Text(
                              AppText.startDate,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    fontSize: 10.sp,
                                    color: AppColors.grey,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            0.5.height,
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      content: Wrap(
                                        children: [
                                          SizedBox(
                                            width: double.maxFinite,
                                            child: TableCalendar(
                                              daysOfWeekHeight: 2.h,
                                              daysOfWeekStyle: DaysOfWeekStyle(
                                                weekdayStyle: TextStyle(
                                                  color: AppColors.primary,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 1.5.h,
                                                ),
                                                weekendStyle: TextStyle(
                                                  color: AppColors.primary,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 1.5.h,
                                                ),
                                              ),
                                              headerStyle: HeaderStyle(
                                                titleCentered: true,
                                                titleTextFormatter:
                                                    (date, locale) =>
                                                        DateFormat.yMMMM(locale)
                                                            .format(date),
                                                formatButtonVisible: false,
                                                titleTextStyle: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              firstDay: DateTime.now(),
                                              lastDay:
                                                  DateTime.utc(2030, 3, 14),
                                              focusedDay: selectedDate,
                                              calendarStyle:
                                                  const CalendarStyle(
                                                outsideDaysVisible: false,
                                                selectedDecoration:
                                                    BoxDecoration(
                                                  color: AppColors.primary,
                                                  shape: BoxShape.circle,
                                                ),
                                              ),
                                              selectedDayPredicate: (day) {
                                                return isSameDay(
                                                    selectedDate, day);
                                              },
                                              onDaySelected:
                                                  (selectedDay, focusedDay) {
                                                setModalState(() {
                                                  selectedDate = selectedDay;
                                                  _startDate = selectedDate;
                                                  _endDate = _calculateEndDate(
                                                      _startDate,
                                                      int.parse(_period
                                                          .split(' ')
                                                          .first));
                                                });
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              child: AbsorbPointer(
                                child: CustomTextField(
                                  name: 'startDate',
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          letterSpacing: 1,
                                          color: AppColors.black),
                                  hintText: DateFormat('dd/MM/yyyy')
                                      .format(_startDate),
                                  suffixIcon: SvgPicture.asset(
                                    AppSvgs.calendar,
                                    fit: BoxFit.scaleDown,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                            ),
                            2.height,
                            Text(
                              AppText.period,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    fontSize: 10.sp,
                                    color: AppColors.grey,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            0.5.height,
                            CustomDropdown(
                              name: 'numberQuaters',
                              hintText: '1 month',
                              prefixIcon: SvgPicture.asset(
                                AppSvgs.note,
                                fit: BoxFit.scaleDown,
                                color: AppColors.primary,
                              ),
                              initialValue: _period.toString(),
                              onChanged: (value) {
                                final String newQuarters = value!;
                                setModalState(() {
                                  _period = newQuarters;
                                  _endDate = _calculateEndDate(_startDate,
                                      int.parse(_period.split(' ').first));
                                });
                              },
                              items: [
                                '3 months',
                                '6 months',
                                '9 months',
                                '12 months'
                              ].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                );
                              }).toList(),
                            ),
                            2.height,
                            Text(
                              AppText.endDate,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    fontSize: 10.sp,
                                    color: AppColors.grey,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            0.5.height,
                            CustomTextField(
                              name: 'endDate',
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      letterSpacing: 1, color: AppColors.black),
                              hintText:
                                  DateFormat('dd/MM/yyyy').format(_endDate),
                              readOnly: true,
                            ),
                            2.height,
                            Text(
                              'Convayance',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    fontSize: 10.sp,
                                    color: AppColors.grey,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            0.5.height,
                            CustomDropdown(
                              name: 'Convayance',
                              hintText: 'Convayance',
                              onChanged: (value) {},
                              items: ['Sea', 'Land', 'Sea + Land']
                                  .map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                );
                              }).toList(),
                            ),

                            2.height,
                            Text(
                              'From',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
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
                            ),
                            2.height,
                            Text(
                              'To',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
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
                            ),
                            2.height,
                            Text(
                              'Number of items',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    fontSize: 10.sp,
                                    color: AppColors.grey,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            0.5.height,
                            CustomTextField(
                              name: 'items',
                              hintText: 'Number of items',
                            ),
                            2.height,
                            Text(
                              'Value',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    fontSize: 10.sp,
                                    color: AppColors.grey,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            0.5.height,
                            CustomTextField(
                              name: 'value',
                              hintText: 'Value',
                            ),
                            2.height,
                            CustomButton(
                              label: "Proceed",
                              onPressed: () {
                                AppCustomNavigator.push(
                                    context, ReviewRequest());
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
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
