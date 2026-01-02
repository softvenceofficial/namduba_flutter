import 'package:nanduba/export.dart';
import 'package:nanduba/views/add_vehicle/review_details/component/vehicle_name_sheet.dart';
import 'package:nanduba/views/add_vehicle/review_details/component/vehicle_type_sheet.dart';
import 'package:nanduba/views/add_vehicle/review_details/widget/vehicle_details_info.dart';

import '../../../widgets/core/my_text.dart';
import '../vehicle_listings/vehicle_listing.dart';


class ReviewVehicledetailsManual extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
              child: const CustomAppbar(
                title: "Details",
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w, ),
                    child: Column(
                      children: [
                        CustomContainer(
                            vpadding: 2.h,
                            hpadding: 4.w,
                
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText(text: "Nice Vehicle",fontSize: 16.sp,fontWeight: FontWeight.w600,color: AppColors.textColor5,),
                                0.5.height,
                                MyText(text: "Here's what we've gathered and we'll save \nthis in your garage.",fontSize: 11.5.sp,fontWeight: FontWeight.w400,color: AppColors.grey,),
                                3.height,
                                VehicleDetailsWidget(type: "Make", detail: "Toyota"),

                                VehicleDetailsWidget(type: "Model", detail: "Corolla"),
                                VehicleDetailsWidget(type: "Year", detail: "2024"),
                                VehicleDetailsWidget(type: "Trim", detail: "S Sedan 4-Door"),
                                VehicleDetailsWidget(type: "Engine", detail: "1.8L 1798CC 110Cu. In. l4 GAS DOHC\nNaturally Aspirated"),
                                VehicleDetailsWidget(type: "Color", detail: "Blue"),
                                VehicleDetailsWidget(type: "Vehicle Type", detail: "Car",message: "Select Vehicle Type",
                                  // onTap: ()async{
                                  //   await  showModalBottomSheet(
                                  //       backgroundColor: AppColors.white,
                                  //       context: context,
                                  //       useSafeArea: true,
                                  //       isScrollControlled: true,
                                  //       shape: RoundedRectangleBorder(
                                  //         borderRadius: BorderRadius.vertical(top: Radius.circular(20.sp)),
                                  //       ),
                                  //       builder: (BuildContext context){
                                  //         return VehicleTypeSheet();
                                  //       });
                                  // },

                                ),
                                VehicleDetailsWidget(type: "Vehicle Name", detail: "PathFinder",message: "Select Vehicle Name",
                                //   onTap: ()async{
                                //   await  showModalBottomSheet(
                                //       backgroundColor: AppColors.white,
                                //       context: context,
                                //       useSafeArea: true,
                                //       isScrollControlled: true,
                                //       shape: RoundedRectangleBorder(
                                //         borderRadius: BorderRadius.vertical(top: Radius.circular(20.sp)),
                                //       ),
                                //       builder: (BuildContext context){
                                //    return VehicleNameSheet();
                                //  });
                                // },

                                ),
                              ],
                            )),
                        3.height,
                        CustomButton(
                          label: "Go",
                          onPressed: () {
                            AppCustomNavigator.push(context,VehicleListings());
                          },
                        ),
                        3.height,

                      ],
                    )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


