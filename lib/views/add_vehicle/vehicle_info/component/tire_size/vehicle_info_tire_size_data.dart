import 'package:nanduba/views/add_vehicle/vehicle_info/component/tire_size/vehicle_info_tire_size_sheet.dart';
import 'package:nanduba/widgets/core/my_text.dart';

import '../../../../../export.dart';

class VehicleInfoTireSizeData extends StatelessWidget {


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
                  text:"Saved Tire Sizes",
                  fontSize: 13.sp,
                  color: AppColors.textColor5,
                  fontWeight: FontWeight.w600,
                ),
                Spacer(),
                GestureDetector(
                  onTap: () async {
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
                          return VehicleInfoTireSizeSheet();
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
                itemCount: 1,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context,index) {
                  return GestureDetector(
                    onTap: () async {
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
                            return VehicleInfoTireSizeSheet();
                          });
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        children: [
                          Divider(color: AppColors.border,),

                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyText(text: "Winter Tire",fontSize: 11.sp,color: AppColors.textColor,fontWeight: FontWeight.w500,),
                                  1.height,
                                  MyText(text: "215/45R17",fontSize: 10.sp,color: AppColors.grey,fontWeight: FontWeight.w500,),



                                ],
                              ),
                              Spacer(),
                              SvgPicture.asset(AppSvgs.arrowCircleRight)

                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }
            ),
            2.height,
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
                      return VehicleInfoTireSizeSheet();
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
                    text: "Add Tire Size",
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



