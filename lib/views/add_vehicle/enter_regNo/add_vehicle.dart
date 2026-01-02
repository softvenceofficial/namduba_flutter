import 'package:nanduba/export.dart';
import 'package:nanduba/views/add_vehicle/enter_vehicle_details/enter_vehicle_details.dart';
import 'package:nanduba/views/add_vehicle/review_details/review_vehicledetails_manual.dart';
import 'package:nanduba/widgets/core/my_text.dart';
import 'component/reg_number.dart';

class AddVehicle extends StatefulWidget {
  @override
  State<AddVehicle> createState() => _AddVehicleState();
}

class _AddVehicleState extends State<AddVehicle> {
  // const AddVehicle({super.key});
int selectedButtonIndex=1;
TextEditingController countryController=TextEditingController();
TextEditingController regnumber=TextEditingController();
TextEditingController vinnumber=TextEditingController();
TextEditingController nameController=TextEditingController();
TextEditingController typeController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                child: const CustomAppbar(
                  title: "Add a Vehicle",
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomContainer(
                          vpadding: 2.h,
                            hpadding: 4.w,
                            borderRadius: 20,
                            child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(text: "Enter Your Reg Number or VIN",fontSize: 14.sp,fontWeight: FontWeight.w600,color: AppColors.textColor5,),
                            0.5.height,
                            MyText(text: "Write your vehicle registration number or VIN number to add vehicle.",fontSize: 11.sp,fontWeight: FontWeight.w400,color: AppColors.grey,),

                          ],
                        )),
                        2.height,
                        Row(
                          children: [
                            CustomButton(
                              width: 30.w,
                              height: 4.8.h,
                              hPadding: 0,
                              vPadding: 0,
                              borderColor: AppColors.transparent,
                              label: "Reg Number",
                              labelFontSize: 10.sp,
                              onPressed: () {
                                setState(() {
                                  selectedButtonIndex = 1;
                                });
                              },

                              backgroundColor: selectedButtonIndex == 1
                                  ? AppColors.primary
                                  : Colors.transparent,
                              foregroundColor: selectedButtonIndex == 1
                                  ? AppColors.white
                                  : AppColors.grey,
                            ),
                            Spacer(),
                            CustomButton(

                              width: 30.w,
                              height: 4.8.h,
                              hPadding: 0,
                              vPadding: 0,
                              borderColor: AppColors.transparent,
                              label: "VIN Number",
                              labelFontSize: 10.sp,
                              onPressed: () {
                                setState(() {
                                  selectedButtonIndex = 2;
                                });
                              },

                              backgroundColor: selectedButtonIndex == 2
                                  ? AppColors.primary
                                  : Colors.transparent,
                              foregroundColor: selectedButtonIndex == 2
                                  ? AppColors.white
                                  : AppColors.grey,

                            ),
                            Spacer(),

                          ],
                        ),
                        3.height,
                        selectedButtonIndex==1?
                        RegNumber(countryController: countryController,regnumber: regnumber,nameCotroller: nameController,typeController: typeController,):VinNumber(vinnumber: vinnumber,),
                        6.height,
                        CustomButton(
                          label: "Let's Go",
                          onPressed: () {
                            AppCustomNavigator.push(context, ReviewVehicledetailsManual());

                          },
                        ),
                        3.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            5.width,

                           Expanded(
                             child: Container(
                              color: AppColors.dulPink,
                               height: 1,

                             ),
                           ),
                            3.width,
                            MyText(text: "or",fontSize: 12.sp,fontWeight: FontWeight.w400,color: AppColors.grey,),
                            3.width,
                            Expanded(
                              child: Container(
                                color: AppColors.dulPink,
                                height: 1,
                              ),

                            ),
                            5.width,

                          ],
                        ),
                        3.height,
                        CustomButton(
                          label: "Enter Vehicle Details", onPressed: (){
                            AppCustomNavigator.push(context, EnterVehicleDetails());
                        },
                          backgroundColor: Colors.transparent,
                          foregroundColor:AppColors.primary,


                        ),
                        1.height,






                      ],
                    ),
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
