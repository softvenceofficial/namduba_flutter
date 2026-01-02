import 'package:get/get.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/manage_address/add_address.dart';

class SearchLocation extends StatelessWidget {
  const SearchLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.keyboard_arrow_down,
                      size: 8.w,
                    ),
                    Text('Select a location',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(fontSize: 16.sp))
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
                  hintText: 'Search for area, street name...',
                  showShadow: true,
                  onEditComplete: () {},
                ),
                3.height,
                CustomContainer(
                  vpadding: 2.h,
                  hpadding: 4.w,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () => Get.to(() => const AddAddress()),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  AppSvgs.add,
                                  width: 4.w,
                                  color: AppColors.primary,
                                ),
                                2.width,
                                Text('Add address',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                            color: AppColors.primary,
                                            fontWeight: FontWeight.w600))
                              ],
                            ),
                            Icon(
                              Icons.keyboard_arrow_right,
                              color: AppColors.grey.withOpacity(0.6),
                            )
                          ],
                        ),
                      ),
                      1.height,
                      const Divider(
                        color: AppColors.lightGrey,
                      ),
                      1.height,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.my_location,
                            size: 4.w,
                            color: AppColors.primary,
                          ),
                          2.width,
                          Text('Use your current location',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.w600))
                        ],
                      ),
                    ],
                  ),
                ),
                2.height,
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: AppColors.lightGrey,
                        endIndent: 2.w,
                      ),
                    ),
                    Text(
                      'NEARBY LOCATIONS',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.grey.withOpacity(0.7),
                          fontWeight: FontWeight.w600),
                    ),
                    Expanded(
                      child: Divider(
                        color: AppColors.lightGrey,
                        indent: 2.w,
                      ),
                    ),
                  ],
                ),
                2.height,
                CustomContainer(
                  vpadding: 2.h,
                  hpadding: 4.w,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          city = 'Artemis Hospital';
                          Get.back();
                        },
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10.w,
                              child: Column(
                                children: [
                                  SvgPicture.asset(
                                    AppSvgs.location2,
                                    color: AppColors.black,
                                  ),
                                  Text(
                                    '15 m',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(fontSize: 8.sp),
                                  )
                                ],
                              ),
                            ),
                            2.width,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Artemis Hospital',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  width: 70.w,
                                  child: Text(
                                    'Sector 51, Gurugram',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(
                                            fontSize: 8.sp,
                                            color: AppColors.grey
                                                .withOpacity(0.6)),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const Divider(
                        color: AppColors.lightGrey,
                      ),
                      GestureDetector(
                        onTap: () {
                          city = 'Footprints Play School';
                          Get.back();
                        },
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10.w,
                              child: Column(
                                children: [
                                  SvgPicture.asset(
                                    AppSvgs.location2,
                                    color: AppColors.black,
                                  ),
                                  Text(
                                    '107 m',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(fontSize: 8.sp),
                                  )
                                ],
                              ),
                            ),
                            2.width,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Footprints Play School',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  width: 70.w,
                                  child: Text(
                                    'Plot No 189 Block C1, Gate No 3, Palam Vihar Near Spanish court Mall, Gurugram, Haryana 122017, India',
                                    maxLines: 4,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(
                                            fontSize: 8.sp,
                                            color: AppColors.grey
                                                .withOpacity(0.6)),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                2.height,
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: AppColors.lightGrey,
                        endIndent: 2.w,
                      ),
                    ),
                    Text(
                      'RECENT LOCATIONS',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.grey.withOpacity(0.7),
                          fontWeight: FontWeight.w600),
                    ),
                    Expanded(
                      child: Divider(
                        color: AppColors.lightGrey,
                        indent: 2.w,
                      ),
                    ),
                  ],
                ),
                2.height,
                CustomContainer(
                  vpadding: 2.h,
                  hpadding: 4.w,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          city = 'Artemis Hospital';
                          Get.back();
                        },
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10.w,
                              child: Column(
                                children: [
                                  SvgPicture.asset(
                                    AppSvgs.location2,
                                    color: AppColors.black,
                                  ),
                                  Text(
                                    '0 m',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(fontSize: 8.sp),
                                  )
                                ],
                              ),
                            ),
                            2.width,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Artemis Hospital',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  width: 70.w,
                                  child: Text(
                                    'Sector 51, Gurugram',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(
                                            fontSize: 8.sp,
                                            color: AppColors.grey
                                                .withOpacity(0.6)),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
