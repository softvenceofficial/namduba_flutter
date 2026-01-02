import 'package:nanduba/views/add_vehicle/policy_information/policy_information.dart';
import 'package:nanduba/widgets/core/my_text.dart';

import '../../../../../export.dart';
import 'vehicle_info_policy_sheet.dart';

class VehicleInfoInsuranceData extends StatelessWidget {
  final String errorText;

  const VehicleInfoInsuranceData({super.key,required this.errorText,});

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
                  text:"Insurance",
                  fontSize: 13.sp,
                  color: AppColors.textColor5,
                  fontWeight: FontWeight.w600,
                ),
                Spacer(),
                Container(
                  height: 5.h,
                  width: 10.5.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.circular(10)),
                  child: SvgPicture.asset(AppSvgs.edit),
                ),
              ],
            ),
            1.height,
            ListView.builder(
              shrinkWrap: true,
              itemCount: 1,
              itemBuilder: (context,index) {
                return GestureDetector(
                  onTap: (){
                    AppCustomNavigator.push(context, PolicyInformation());
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 1.5.h),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.border),
                      borderRadius: BorderRadius.circular(14)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            MyText(text: "Comprehensive",fontSize: 11.sp,color: AppColors.textColor,fontWeight: FontWeight.w500,),
                            Spacer(),
                            CircleAvatar(
                              radius: 0.5.h,
                              backgroundColor: AppColors.green2,
                            ),
                            1.width,
                            MyText(text: "Active",fontSize: 10.sp,color: AppColors.textColor,fontWeight: FontWeight.w500,),

                          ],
                        ),
                        1.height,
                        MyText(text: "Private Motor, Hollard",fontSize: 10.sp,color: AppColors.grey,fontWeight: FontWeight.w500,),
                        1.height,

                        Row(
                          children: [
                            MyText(text: "Expires: ",fontSize: 10.sp,color: AppColors.grey,fontWeight: FontWeight.w500,),
                            MyText(text: "24 Dec 2024",fontSize: 10.sp,color: AppColors.textColor,fontWeight: FontWeight.w500,),
                            Spacer(),
                            SvgPicture.asset(AppSvgs.arrowCircleRight)


                          ],
                        )


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
                  return VehicleInfoPolicySheet();
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
                    text: errorText,
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



