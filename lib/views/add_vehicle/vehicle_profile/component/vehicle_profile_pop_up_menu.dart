import 'package:get/get.dart';
import 'package:nanduba/controllers/vehicle_profile_controller.dart';

import '../../../../export.dart';
import '../../../create_request/view_requests/component/triangle_painter.dart';
import '../../review_details/component/vehicle_type_sheet.dart';

class VehicleProfilePopUpMenu extends StatelessWidget {
  final int listingIndex;
   const VehicleProfilePopUpMenu({super.key, required this.listingIndex});

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
                      GestureDetector(
                        onTap: ()async{
                          await  showModalBottomSheet(
                                    backgroundColor: AppColors.white,
                                    context: context,
                                    useSafeArea: true,
                                    isScrollControlled: true,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(top: Radius.circular(20.sp)),
                                    ),
                                    builder: (BuildContext context){
                                      return VehicleTypeSheet();
                                    });
                        },
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
                              child: SvgPicture.asset(AppSvgs.edit),

                            ),
                            3.width,
                            Text("Edit Ride Type",
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.w500,
                                )),
                          ],
                        ),
                      ),
                      2.height,
                      GestureDetector(
                        onTap: (){
                          Get.back();
                          controller.listings.removeAt(listingIndex);
                          Get.snackbar("Success", "Vehicle deleted");

                        },
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
                            Text("Delete",
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
