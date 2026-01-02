import 'dart:math';

import '../../../../export.dart';
import '../../../../widgets/core/my_text.dart';

class VehicleTypeSheet extends StatefulWidget {
  @override
  State<VehicleTypeSheet> createState() => _VehicleTypeSheetState();
}

class _VehicleTypeSheetState extends State<VehicleTypeSheet> {
  // const VehicleTypeSheet({super.key});
 String vehicleType='';

List<String> vehicleTypes=[
  "Car",
  "SUV",
  "Van",
];

bool showMore=false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(4.w, 2.h, 4.w, 2.h),
      child: Wrap(
        children: [
          2.height,
          Row(
            children: [
              MyText(text: "Vehicle Type",fontSize: 14.sp,fontWeight: FontWeight.w600,color: AppColors.textColor,),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(
                  AppSvgs.closeCircle,
                  color: AppColors.primary,
                  height: 2.5.h,
                ),
              ),
            ],
          ),
          6.height,
          Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                1.height,
                GestureDetector(
                  onTap: (){
                    setState(() {
                      showMore=!showMore;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 4.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.border)
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(AppSvgs.searchIcon),
                        2.width,
                        MyText(text: "${vehicleType}",fontSize: 12.sp,fontWeight: FontWeight.w500,color: AppColors.textColor,),
                        Spacer(),
                        Transform.rotate(
                            angle: showMore==false?pi/2:-pi/2,
                            child: Icon(Icons.arrow_forward_ios_rounded,size: 20,color: AppColors.darkGrey,))
                      ],
                    ),
                  ),
                ),
                if(showMore==true)
                Container(
                  padding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 4.w),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.border),
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: ListView.builder(
                    itemCount: vehicleTypes.length,
                    shrinkWrap: true,
                    itemBuilder: (context,index) {
                      return GestureDetector(
                        onTap: (){
                          setState(() {
                            vehicleType=vehicleTypes[index];

                          });

                        },
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(AppSvgs.carIcon),
                                2.width,
                                MyText(text: vehicleTypes[index],fontSize: 10.sp,fontWeight: FontWeight.w400,color: AppColors.textColor,),
                                Spacer(),
                                Container(
                                  height: 20,
                                  width: 20,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                  border: Border.all(color:vehicleType==vehicleTypes[index]? AppColors.primary:AppColors.border),
                                    shape: BoxShape.circle
                                  ),
                                  child: Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                        color: vehicleType==vehicleTypes[index]?AppColors.primary:Colors.transparent,
                                        shape: BoxShape.circle
                                    ),
                                  ),
                                )
                              ],
                            ),
                            1.height,
                            Divider(color: AppColors.border,)
                          ],
                        ),
                      );
                    }
                  ),
                ),
                2.height,

                CustomButton(
                  label: "Save",
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
