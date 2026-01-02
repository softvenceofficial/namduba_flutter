import 'package:nanduba/views/add_vehicle/enter_vehicle_details/enter_vehicle_details.dart';

import '../../../../export.dart';
import '../../../../widgets/core/my_text.dart';

class VehicleDetailsWidget extends StatelessWidget {
  final String type;
  final String detail;
  final String? message;
  final void Function()? onTap;
  const VehicleDetailsWidget({super.key, required this.type, required this.detail, this.message, this.onTap});

  @override
  Widget build(BuildContext context) {
    return    GestureDetector(
      onTap: (){
        AppCustomNavigator.push(context, EnterVehicleDetails());
      },
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            0.5.height,
            Row(
              children: [
                Icon(Icons.check_circle,color: AppColors.greenicon,),
                2.width,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          MyText(text: type,fontSize: 10.sp,fontWeight: FontWeight.w500,color: AppColors.textColor,),
                          Spacer(),
                          if(detail!='')
                            SvgPicture.asset(AppSvgs.arrowCircleRight)
                        ],

                      ),
                      0.5.height,
                      detail!=''?
                      MyText(text: detail,fontSize: 10.sp,fontWeight: FontWeight.w500,color: AppColors.grey,):
                      GestureDetector(
                          onTap: onTap,
                          child: MyText(text: message??'',fontSize: 10.sp,fontWeight: FontWeight.w500,color: AppColors.primary,decoration: TextDecoration.underline,)),
                    ],
                  ),
                ),


              ],
            ),
            0.5.height,
            Divider()
          ],
        ),
      ),
    );

  }


}
