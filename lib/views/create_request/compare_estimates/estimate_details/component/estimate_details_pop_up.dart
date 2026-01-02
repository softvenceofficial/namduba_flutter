import 'package:get/get.dart';
import 'package:nanduba/controllers/vehicle_profile_controller.dart';

import '../../../../../export.dart';
import '../../../view_requests/component/triangle_painter.dart';



class EstimateDetailPopUp extends StatelessWidget {
  final void Function()? onTap;
  const EstimateDetailPopUp({super.key, this.onTap});
  @override
  Widget build(BuildContext context) {
    final VehicleProfileController controller=Get.find();

    return  Positioned(
        top: 0,
        right: 4.w,
        child: Visibility(
          maintainAnimation: true,
          maintainState: true,
          visible:controller.isOpen.value,
          child: AnimatedOpacity(
            duration:
            Duration(milliseconds: 200),
            opacity:controller.isOpen.value==true ? 1 : 0,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topRight,
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(3.w),
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.shadow,
                            blurRadius: 20,
                            offset: Offset(0, 2)
                        )
                      ]

                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 5.h,
                            width: 10.5.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: AppColors.secondary,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: SvgPicture.asset(AppSvgs.note),

                          ),
                          3.width,
                          GestureDetector(
                            onTap: (){
                              AppCustomNavigator.push(context, BookAppointment());
                            },
                            child: Text("Book Appointment",
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.w500,
                                )),
                          ),
                        ],
                      ),
                      2.height,
                      GestureDetector(
                        onTap: onTap,
                        child: Row(
                          children: [
                            Container(
                              height: 5.h,
                              width: 10.5.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: AppColors.secondary,
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: SvgPicture.asset(AppSvgs.trash),

                            ),                          3.width,
                            Text("Reject Estimate",
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.w500,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: -14,
                  right: 8,
                  child: CustomPaint(
                    size: Size(40, 20),
                    painter: TrianglePainter(),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
