import 'package:get/get.dart';
import 'package:nanduba/export.dart';

class AllowLocationScreen extends StatelessWidget {
  const AllowLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          CustomPaint(
            painter: CommonBackgroundPaint(),
            size: Size(100.w, 100.h),
          ),
          SafeArea(
              child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
              child: Column(
                children: [
                  const CustomAppbar(
                    title: AppText.allowLocation,
                  ),
                  CustomContainer(
                    hpadding: 6.w,
                    vMargin: 3.h,
                    width: double.maxFinite,
                    vpadding: 4.h,
                    child: FormBuilder(
                      key: formKey,
                      child: Column(
                        children: [
                          CustomVerificationContainer(
                            icon: AppSvgs.location,
                            vpadding: 4.h,
                            hpadding: 9.w,
                            borderRadius: 15.w,
                            svgHeight: 10.w,
                          ),
                          3.height,
                          Text(
                            AppText.turnOnLocation,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          1.height,
                          Text(
                            textAlign: TextAlign.center,
                            AppText.turnOnLocationDetail,
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: AppColors.midGrey,
                                    ),
                          ),
                          10.height,
                          CustomButton(
                            label: AppText.allowLocation,
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return allowLocationAlert(context);
                                },
                              );
                            },
                          ),
                          3.height,
                          GestureDetector(
                            onTap: () {
                              AppCustomNavigator.push(
                                  context, const BottomNavbar());
                            },
                            child: Text(
                              AppText.maybeLater,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.transparent,
                                    shadows: [
                                      Shadow(
                                          color: AppColors.primary,
                                          offset: Offset(0.h, -0.5.h))
                                    ],
                                    decoration: TextDecoration.underline,
                                    decorationColor: AppColors.primary,
                                  ),
                            ),
                          ),
                          26.height,
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }

//Allow Location Dialog
  Widget allowLocationAlert(context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.sp),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          2.height,
          SvgPicture.asset(AppSvgs.location),
          2.5.height,
          Text(
            AppText.allowLocationDetail,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontSize: 12.sp),
          ),
          2.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                  label: AppText.deny,
                  backgroundColor: AppColors.transparent,
                  labelFontSize: 12.sp,
                  foregroundColor: AppColors.primary,
                  width: 32.w,
                  height: 5.5.h,
                  onPressed: () {
                    AppCustomNavigator.pop(context);
                  }),
              CustomButton(
                  label: AppText.allow,
                  width: 32.w,
                  height: 5.5.h,
                  labelFontSize: 12.sp,
                  onPressed: () {
                    Get.offAll(BottomNavbar());
                  }),
            ],
          )
        ],
      ),
    );
  }
}
