import 'package:nanduba/export.dart';

class PolicyDetails extends StatefulWidget {
  const PolicyDetails({super.key});

  @override
  State<PolicyDetails> createState() => _PolicyDetailsState();
}

class _PolicyDetailsState extends State<PolicyDetails> {
  int selectedButtonIndex = 0;
  List documents = [
    'Certificate and Insurance',
    'Policy Schedule',
    'Delat Note',
    'Receipt',
    'Policy Wording',
    'Policy Claims'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 4.w,
              ),
              child: Column(
                children: [
                  2.height,
                  CustomAppbar(
                    title: 'Policy Details',
                    toggleIcon: AppImages.toggle,
                  ),
                  2.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildCustomButton(
                        label: "Overview",
                        index: 0,
                      ),
                      _buildCustomButton(
                        label: "Documents",
                        index: 1,
                      ),
                    ],
                  ),
                  1.height,
                ],
              ),
            ),
            Expanded(
                child: selectedButtonIndex == 0 ? _details() : _documents())
          ],
        ),
      ),
    );
  }

  Widget _title({required String title}) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineSmall,
    );
  }

  Widget _documents() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 4.w,
        ),
        child: Column(
          children: [
            for (int i = 0; i < documents.length; i++)
              CustomContainer(
                vMargin: 1.h,
                vpadding: 1.5.h,
                hpadding: 3.w,
                borderRadius: 20.sp,
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          CustomContainer(
                            borderRadius: 15.sp,
                            color: AppColors.primary.withOpacity(0.1),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 1.7.h, horizontal: 4.w),
                              child: SvgPicture.asset(
                                AppSvgs.pdf,
                                height: 3.h,
                              ),
                            ),
                          ),
                          2.width,
                          Flexible(
                            child: Text(
                              documents[i],
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(1.5.h),
                      child: SvgPicture.asset(
                        AppSvgs.download,
                        height: 2.5.h,
                      ),
                    ),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }

  Widget _details() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 4.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            1.height,
            _title(title: 'Insured Details'),
            _containerWidget(
              title: [
                'Landfarow Investments',
                '33 Skyline Avenue west Texas, USA'
              ],
            ),
            1.height,
            _title(title: 'Premium'),
            _containerWidget(
                title: ['Gross Prmium', 'Net Premium'],
                titleDecs: ['\$500', '\$420'],
                isInt: [true, true]),
            1.height,
            _title(title: 'Payment Info'),
            _containerWidget(title: [
              'Paid to Date',
              'Premium Frequency',
              'Next Payment Date'
            ], titleDecs: [
              '\$500',
              'Annual',
              '30 Mar 2025'
            ], isInt: [
              true,
              false,
              false
            ]),
            1.height,
            _title(title: 'Renewal Details'),
            _containerWidget(
              title: ['Effective Date', 'Expiration Date'],
              titleDecs: ['1 April 2024', '31 Mar 2025'],
            ),
            1.height,
            _title(title: 'Additional Details'),
            _containerWidget(
              title: [
                'Broker/ Agent',
              ],
              titleDecs: [
                'Direct',
              ],
            ),
            1.height,
            _title(title: 'Insurer Details'),
            _containerWidget(
              title: ['Hallmark Insurance', 'Stand 3276, Florida Park, USA'],
            ),
          ],
        ),
      ),
    );
  }

  Widget _containerWidget(
      {required List title, List? titleDecs, List<bool>? isInt}) {
    isInt ??= List.generate(title.length, (index) => false);
    return CustomContainer(
      vMargin: 1.h,
      vpadding: 2.h,
      hpadding: 4.w,
      borderRadius: 15.sp,
      child: Column(
        children: [
          for (int i = 0; i < title.length; i++)
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Icon(
                        Icons.circle,
                        size: 6.sp,
                        color: AppColors.primary,
                      ),
                      2.width,
                      Flexible(
                        child: Text(
                          title[i],
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  fontWeight: FontWeight.w600, fontSize: 10.sp),
                        ),
                      ),
                    ],
                  ),
                ),
                if (titleDecs != null && titleDecs.isNotEmpty)
                  Text(
                    titleDecs[i],
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                          color: isInt[i] ? AppColors.primary : AppColors.black,
                        ),
                  ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildCustomButton({
    required String label,
    required int index,
  }) {
    return CustomButton(
      borderColor: AppColors.white,
      label: label,
      labelFontSize: 12.sp,
      labelFontWeight: FontWeight.w400,
      onPressed: () {
        setState(() {
          selectedButtonIndex = index;
        });
      },
      height: 5.h,
      width: 45.w,
      backgroundColor:
          selectedButtonIndex == index ? AppColors.primary : Colors.transparent,
      foregroundColor:
          selectedButtonIndex == index ? AppColors.white : AppColors.grey,
    );
  }
}
