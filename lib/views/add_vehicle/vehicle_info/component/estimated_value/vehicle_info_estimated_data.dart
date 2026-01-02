import 'package:nanduba/views/add_vehicle/vehicle_info/component/license/vehicle_licence_info_sheet.dart';
import 'package:nanduba/views/add_vehicle/vehicle_info/component/maintenance/vehicle_info_maintenance_sheet.dart';
import 'package:nanduba/widgets/core/my_text.dart';

import '../../../../../export.dart';

class VehicleInfoEstimatedData extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
        hpadding: 4.w,
        hMargin: 4.w,
        vpadding: 1.h,
        vMargin: 1.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                MyText(
                  text:"Estimated Value",
                  fontSize: 13.sp,
                  color: AppColors.textColor5,
                  fontWeight: FontWeight.w600,
                ),
                Spacer(),
                GestureDetector(
                  onTap: ()async{

                        await showModalBottomSheet(
                            backgroundColor: AppColors.white,
                            context: context,
                            useSafeArea: true,
                            isScrollControlled: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20.sp)),
                            ),
                            builder: (BuildContext context) {
                              return VehicleInfoMaintenanceSheet();
                            });
                      },

                  child: Container(
                    height: 5.h,
                    width: 10.5.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.circular(10)),
                    child: SvgPicture.asset(AppSvgs.edit),
                  ),
                ),
              ],
            ),
            0.5.height,
            MyText(text: "\$5000",fontSize: 11.sp,color: AppColors.textColor,fontWeight: FontWeight.w500,),
            0.5.height,


          ],
        ));
  }
}



