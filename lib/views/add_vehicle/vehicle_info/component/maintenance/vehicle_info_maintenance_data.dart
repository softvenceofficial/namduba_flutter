import 'package:nanduba/views/add_vehicle/vehicle_info/component/license/vehicle_licence_info_sheet.dart';
import 'package:nanduba/views/add_vehicle/vehicle_info/component/maintenance/vehicle_info_maintenance_sheet.dart';
import 'package:nanduba/widgets/core/my_text.dart';

import '../../../../../export.dart';

class VehicleInfoMaintenanceData extends StatelessWidget {
  List<dynamic> reminders=[
    {
      "name":"Routine Service",
      "date":"24 Dec 2024",
    "due":"Due In 2 Months"
    },
    {
      "name":"Aircon Check",
      "date":"18 Feb 2024",
      "due":"Add Due In 30 Days"
    },
  ];
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
                  text:"Reminders",
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
            1.height,
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: reminders.length,
                itemBuilder: (context,index) {
                  return GestureDetector(
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
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Divider(color: AppColors.border,),
                          1.height,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              MyText(text: reminders[index]['name'],fontSize: 11.sp,color: AppColors.textColor,fontWeight: FontWeight.w500,),
                              Spacer(),
                              MyText(text: reminders[index]['due'],fontSize: 10.sp,color: AppColors.textColor,fontWeight: FontWeight.w500,),

                            ],
                          ),
                          1.height,

                          MyText(text:reminders[index]['date'],fontSize: 10.sp,color: AppColors.textColor,fontWeight: FontWeight.w500,),
                          1.height,



                        ],
                      ),
                    ),
                  );
                }
            ),
            1.height,
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
              child: Row(
                children: [
                  Icon(
                    Icons.add,
                    size: 18,
                    color: AppColors.primary,
                  ),
                  MyText(
                    text: "Add Reminder",
                    fontSize: 11.sp,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}



