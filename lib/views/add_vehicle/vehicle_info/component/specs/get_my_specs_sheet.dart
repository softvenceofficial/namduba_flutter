import 'package:get/get.dart';
import 'package:nanduba/controllers/vehicle_profile_controller.dart';
import 'package:nanduba/views/add_vehicle/enter_regNo/component/reg_number.dart';
import 'package:nanduba/views/add_vehicle/vehicle_info/widget/vehicle_type_choice_container.dart';
import 'package:nanduba/widgets/core/my_text.dart';
import 'package:country_picker/country_picker.dart' as cp;

import '../../../../../export.dart';

class GetMySpecsSheet extends StatefulWidget {
  @override
  State<GetMySpecsSheet> createState() => _GetMySpecsSheetState();
}

class _GetMySpecsSheetState extends State<GetMySpecsSheet> {
  TextEditingController countryController=TextEditingController();
  TextEditingController vinnumber=TextEditingController();

  String countryImage='';
  RxBool isVin=false.obs;
  final VehicleProfileController controller=Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context)!.unfocus();
      },
      child: Padding(
        padding: EdgeInsets.fromLTRB(4.w, 2.h, 4.w, 2.h),
        child: Wrap(
          children: [
            2.height,
            Row(
              children: [
                MyText(text: "Get My Corolla’s Specs",fontSize: 14.sp,fontWeight: FontWeight.w600,color: AppColors.textColor,),
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
            1.height,
            Divider(color: AppColors.border,),
            3.height,
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    text:   "In order to find the details on your Corolla, we\nneed to do a quick VIN lookup. The easiest way is\nusing your license plate (don't worry, we won't\nstore your plate number).",

                    fontSize: 10.5.sp,
                    color: AppColors.grey,
                    fontWeight: FontWeight.w400,

                  ),
                  2.height,
                  Obx(()=> isVin.value==false?
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        text:   "Country",
                        fontSize: 12.sp,
                        color: AppColors.grey,
                        fontWeight: FontWeight.w400,

                      ),
                      1.height,
                      CustomTextField(
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textColor
                        ),
                        name: 'country',
                        hintText: '',
                        readOnly: true,
                        controller: countryController,
                        prefixIcon:countryImage!=''
                            ?CircleAvatar(
                          radius: 1.h,
                          backgroundColor: Colors.transparent,
                          child: Text(countryImage,style: TextStyle(fontSize: 19),),)
                            : SvgPicture.asset(
                          AppSvgs.global,
                          fit: BoxFit.scaleDown,
                          color: AppColors.primary,
                        ),
                        onTap: (){
                          cp.showCountryPicker(
                            context: context,
                            showPhoneCode: false,
                            onSelect: (cp.Country country) {
                              setState(() {
                                countryController.text=country.name;
                                countryImage=country.flagEmoji;
                              });
                            },
                          );
                        },
                        suffixIcon: Icon(Icons.keyboard_arrow_down_rounded,color: AppColors.darkGrey,),
                      ),
                        2.height,
                      MyText(
                        text:   "Reg Number",

                        fontSize: 12.sp,
                        color: AppColors.grey,
                        fontWeight: FontWeight.w400,

                      ),
                      1.height,
                      CustomTextField(
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textColor
                        ),
                        name: 'carname',
                        hintText: "AAZ 4178",
                        prefixIcon: SvgPicture.asset(
                          AppSvgs.regno,
                          fit: BoxFit.scaleDown,
                          color: AppColors.primary,
                        ),

                      ),
                    ],
                  ):
                  VinNumber(vinnumber: vinnumber),),
                  3.height,
                  CustomButton(
                    label: "Search",
                    onPressed: () {
                      controller.showSpecsDetails.value=!controller.showSpecsDetails.value;
                      Navigator.pop(context);
                    },
                  ),
                  2.height,
                    Obx(()=> isVin.value!=true?
                    Center(child: GestureDetector(

                        onTap: (){
                          isVin.value=!isVin.value;
                        },
                        child: MyText(text: "Use VIN Instead",color: AppColors.primary,fontSize: 14.sp,fontWeight: FontWeight.w500,))):
                        SizedBox.shrink(),
                    ),
                  2.height,
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
