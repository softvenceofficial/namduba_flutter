import 'dart:io';
import 'package:nanduba/export.dart';

import 'package:nanduba/views/add_vehicle/vehicle_profile/component/upload_image_container.dart';

class FinanceBottomsheet extends StatefulWidget {
  const FinanceBottomsheet({
    super.key,
    required this.title,
    required this.index,
  });
  final String title;
  final int index;

  @override
  State<FinanceBottomsheet> createState() => _FinanceBottomsheet();
}

class _FinanceBottomsheet extends State<FinanceBottomsheet> {
  File? image;
  final ImagePicker picker = ImagePicker();

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
                              AppText.vehicleDetails,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w800,
                                  ),
                            ),
                            0.5.height,
                            CustomTextField(
                                name: 'makeModel',
                                hintText: 'Type your make and model'),
                            2.height,
                            // Text(
                            //   AppText.make,
                            //   style: Theme.of(context)
                            //       .textTheme
                            //       .bodySmall
                            //       ?.copyWith(
                            //         fontSize: 10.sp,
                            //         color: AppColors.grey,
                            //         fontWeight: FontWeight.w600,
                            //       ),
                            // ),
                            // 0.5.height,
                            // CustomDropdown(
                            //   name: 'sumInsured',
                            //   hintText: 'Toyota',
                            //   prefixIcon: SvgPicture.asset(
                            //     AppSvgs.make,
                            //     fit: BoxFit.scaleDown,
                            //     color: AppColors.primary,
                            //   ),
                            //   items: ['Toyota'].map((String value) {
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
                            // 2.height,
                            // Text(
                            //   AppText.model,
                            //   style: Theme.of(context)
                            //       .textTheme
                            //       .bodySmall
                            //       ?.copyWith(
                            //         fontSize: 10.sp,
                            //         color: AppColors.grey,
                            //         fontWeight: FontWeight.w600,
                            //       ),
                            // ),
                            // 0.5.height,
                            // CustomDropdown(
                            //   name: 'model',
                            //   hintText: 'Corolla',
                            //   prefixIcon: SvgPicture.asset(
                            //     AppSvgs.carIcon,
                            //     fit: BoxFit.scaleDown,
                            //     color: AppColors.primary,
                            //   ),
                            //   onChanged: (value) {},
                            //   items: ['Corolla'].map((String value) {
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
                            // 2.height,
                            Text(
                              AppText.loanAmount,
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
                              name: 'loanAmount',
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
                              items: ['\$100', '\$200', '\$400']
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
                              name: 'period',
                              hintText: '2 Years',
                              prefixIcon: SvgPicture.asset(
                                AppSvgs.carIcon,
                                fit: BoxFit.scaleDown,
                                color: AppColors.primary,
                              ),
                              onChanged: (value) {},
                              items: ['2 Years', '3 Years'].map((String value) {
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
                              AppText.downPayment,
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
                              name: 'downPayment',
                              hintText: '\$100',
                              prefixIcon: SvgPicture.asset(
                                AppSvgs.dollar,
                                fit: BoxFit.scaleDown,
                                color: AppColors.primary,
                              ),
                              items: ['\$100', '\$200', '\$400']
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
                              label: AppText.next,
                              onPressed: () {},
                            ),
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
    // Update state when the bottom sheet is dismissed
    setState(() {
      isBorder[widget.index] = false;
    });
  }
}
