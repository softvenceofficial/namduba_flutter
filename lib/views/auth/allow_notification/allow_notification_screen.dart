import 'package:nanduba/export.dart';

class AllowNotificationScreen extends StatelessWidget {
  const AllowNotificationScreen({super.key});

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
                    title: AppText.allowNotification,
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
                            icon: AppSvgs.notification,
                            vpadding: 4.h,
                            hpadding: 9.w,
                            borderRadius: 15.w,
                            svgHeight: 10.w,
                          ),
                          3.height,
                          Text(
                            AppText.turnOnNotification,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          1.height,
                          Text(
                            textAlign: TextAlign.center,
                            AppText.turnOnNotificationDetail,
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: AppColors.midGrey,
                                    ),
                          ),
                          10.height,
                          CustomButton(
                            label: AppText.allowNotification,
                            onPressed: () {
                              AppCustomNavigator.push(
                                  context, const AllowLocationScreen());
                            },
                          ),
                          3.height,
                          GestureDetector(
                            onTap: () {
                              AppCustomNavigator.push(
                                  context, const AllowLocationScreen());
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
}
