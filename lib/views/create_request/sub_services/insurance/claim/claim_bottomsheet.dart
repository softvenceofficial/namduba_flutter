import 'dart:io';

import 'package:multi_dropdown/multi_dropdown.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/add_vehicle/vehicle_profile/component/upload_image_container.dart';

import '../../../review_request/review_request.dart';
import '../../../view_requests/view_requests.dart';

class ClaimInsuranceBottomSheet extends StatefulWidget {
  const ClaimInsuranceBottomSheet({
    super.key,
    required this.title,
    required this.index,
  });
  final String title;
  final int index;

  @override
  State<ClaimInsuranceBottomSheet> createState() =>
      _ClaimInsuranceBottomSheet();
}

class _ClaimInsuranceBottomSheet extends State<ClaimInsuranceBottomSheet> {
  DateTime _startDate = DateTime.now();
  File? image;
  final ImagePicker picker = ImagePicker();
  final MultiSelectController<String> _controller =
      MultiSelectController<String>();
  List<DropdownItem<String>> options = [
    DropdownItem(label: 'Accident', value: 'Accident'),
    DropdownItem(label: 'Theft', value: 'Theft'),
    DropdownItem(label: 'Flying Stone', value: 'Flying Stone'),
  ];
  @override
  void initState() {
    super.initState();
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
            DateTime selectedDate = _startDate;

            return Padding(
              padding: EdgeInsets.fromLTRB(4.w, 2.h, 4.w, 0),
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
                  2.height,
                  CustomHeading(
                    title: widget.title,
                    suffixText: AppText.addNotes,
                    isSuffixSvg: true,
                    suffixSvg: AppSvgs.addNotes,
                    onTap: () {},
                  ),
                  2.height,
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Claim Vehicle',
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
                                prefixIcon: SvgPicture.asset(
                                  AppSvgs.searchIcon,
                                  fit: BoxFit.scaleDown,
                                ),
                                name: 'claimVehicle',
                                hintText: 'Enter License Plate'),
                            2.height,
                            Text(
                              'Incident',
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
                              name: 'incident',
                              hintText: 'Incident',
                            ),
                            2.height,
                            Text(
                              AppText.incidentDate,
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
                                  name: 'incidentDate',
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
                              'Incident Town',
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
                              name: 'incidentTown',
                              hintText: '',
                              prefixIcon: SvgPicture.asset(
                                AppSvgs.cc,
                                fit: BoxFit.scaleDown,
                                color: AppColors.primary,
                              ),
                            ),
                            2.height,
                            Text(
                              'Incident Details',
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
                              name: 'incidentDetails',
                              hintText: '',
                              maxLines: 2,
                            ),
                            2.height,
                            Text(
                              'What would you like to claim for?',
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
                            MultiDropdown<String>(
                              items: options,
                              controller: _controller,
                              itemBuilder: (DropdownItem<String> item,
                                  int index, void Function() onTap) {
                                final isSelected =
                                    _controller.selectedItems.contains(item);

                                return CheckboxListTile(
                                  value:
                                      isSelected, // check if item is selected
                                  title: Text(item.label),
                                  controlAffinity: ListTileControlAffinity
                                      .leading, // Checkbox on the left
                                  onChanged: (bool? checked) {
                                    if (checked!) {
                                      _controller.selectedItems.add(item);
                                    } else {
                                      _controller.selectedItems.remove(item);
                                    }
                                    _controller
                                        .notifyListeners(); // Notify the controller that the selection has changed
                                    onTap(); // trigger onTap to update the dropdown state
                                  },
                                );
                              },
                              fieldDecoration: FieldDecoration(
                                hintText: 'Select Item',
                                focusedBorder: AppColors.kFocuseBorder,
                                errorBorder: AppColors.kErrorOutlineBorder,
                                prefixIcon: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 2.h),
                                  child: SvgPicture.asset(
                                    AppSvgs.searchIcon,
                                    fit: BoxFit.scaleDown,
                                    color: AppColors.primary,
                                  ),
                                ),
                                suffixIcon: const Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                ),
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      letterSpacing: 0.5,
                                      color: AppColors.grey.withOpacity(0.7),
                                    ),
                                padding: EdgeInsets.symmetric(
                                    vertical: 1.h, horizontal: 2.w),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(14.sp),
                                    borderSide:
                                        BorderSide(color: AppColors.border)),
                              ),
                              dropdownDecoration: DropdownDecoration(
                                backgroundColor: AppColors.secondary,
                                borderRadius: BorderRadius.circular(10.sp),
                              ),
                              chipDecoration: ChipDecoration(
                                padding: EdgeInsets.all(2.w),
                                backgroundColor: AppColors.secondary,
                                deleteIcon: Icon(
                                  Icons.close,
                                  size: 2.h,
                                ),
                              ),
                            ),
                            // SizedBox(height: 20),
                            // CustomDropdown(
                            //   name: 'insurer',
                            //   hintText: 'Select Item',
                            //   prefixIcon: SvgPicture.asset(
                            //     AppSvgs.searchIcon,
                            //     fit: BoxFit.scaleDown,
                            //     color: AppColors.primary,
                            //   ),
                            //   onChanged: (value) {},
                            //   items: ['Own Damage', 'Cartesy Vechicle']
                            //       .map((String value) {
                            //     return DropdownMenuItem<String>(
                            //       value: value,
                            //       child: Text(
                            //         value,
                            //         style:
                            //             Theme.of(context).textTheme.bodyMedium,
                            //       ),
                            //     );
                            //   }).toList(),
                            // ),
                            2.height,
                            Text(
                              AppText.uploadImages,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  AppSvgs.uploadFiles,
                                  fit: BoxFit.scaleDown,
                                  color: AppColors.primary,
                                ),
                                2.width,
                                Text(
                                  'Upload Documents',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        fontSize: 10.sp,
                                        color: AppColors.grey,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ],
                            ),
                            1.height,
                            GestureDetector(
                              onTap: () async {
                                final XFile? pickedImage =
                                    await picker.pickImage(
                                        imageQuality: 10,
                                        source: ImageSource.gallery);

                                if (pickedImage != null) {
                                  setModalState(() {
                                    image = File(pickedImage.path);
                                  });
                                }
                              },
                              child: DottedBorder(
                                borderType: BorderType.RRect,
                                color: AppColors.primary,
                                radius: Radius.circular(15.sp),
                                padding: EdgeInsets.symmetric(
                                    vertical: image == null ? 2 : 1.h,
                                    horizontal: image == null ? 2 : 2.w),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12.sp),
                                  ),
                                  child: image == null
                                      ? Container(
                                          color: AppColors.secondary,
                                          width: 100.w,
                                          height: 9.h,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                AppText.tapToUploadFiles,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall
                                                    ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                              ),
                                              1.height,
                                              Text(
                                                AppText.filesType,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall
                                                    ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 9.sp,
                                                      color: AppColors.primary,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : SizedBox(
                                          width: 100.w,
                                          // height: 20.h,
                                          child: Image.file(
                                            image!,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                            2.height,
                            CustomButton(
                              label: 'Submit',
                              onPressed: () {
                                AppCustomNavigator.push(
                                    context, ReviewRequest());
                              },
                            ),
                            2.height,
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
    setState(() {
      isBorder[widget.index] = false;
    });
  }
}
