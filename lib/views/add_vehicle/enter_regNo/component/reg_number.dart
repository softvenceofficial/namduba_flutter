
import 'package:get/get.dart';

import '../../../../export.dart';
import 'package:country_picker/country_picker.dart' as cp;

import '../../../../widgets/core/my_text.dart';

class RegNumber extends StatefulWidget {
  final TextEditingController countryController;
  final TextEditingController  regnumber;
  final TextEditingController  typeController;
  final TextEditingController  nameCotroller;
   const RegNumber({super.key, required this.countryController, required this.regnumber, required this.typeController, required this.nameCotroller});

  @override
  State<RegNumber> createState() => _RegNumberState();
}

class _RegNumberState extends State<RegNumber> {
  RxBool showType=false.obs;

  List<String> vehicleTypes=[
    "Car",
    "SUV",
    "Van",
  ];

  @override
  Widget build(BuildContext context) {
    print("widget build");
    return   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(text: "Country",fontSize: 12.sp,fontWeight: FontWeight.w400,color: AppColors.grey,),
        1.height,
        CustomTextField(
          style: GoogleFonts.poppins(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.textColor
          ),
          name: 'regnumber',
          hintText: '',
          readOnly: true,
          controller: widget.countryController,
          prefixIcon: SvgPicture.asset(
            AppSvgs.global,
            fit: BoxFit.scaleDown,
            color: AppColors.primary,
          ),
          onTap: (){
            cp.showCountryPicker(
              context: context,
              showPhoneCode: false,
              onSelect: (cp.Country country) {
                widget.countryController.text=country.name;
              },
            );
          },
          suffixIcon: Icon(Icons.keyboard_arrow_down_rounded,color: AppColors.darkGrey,),
        ),
        3.height,
        MyText(text: "Reg Number",fontSize: 12.sp,fontWeight: FontWeight.w400,color: AppColors.grey,),
        1.height,
        CustomTextField(
          controller: widget.regnumber,
          style: GoogleFonts.poppins(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.textColor
          ),
          name: 'regnumber',
          hintText: '',
          prefixIcon: SvgPicture.asset(
            AppSvgs.regno,
            fit: BoxFit.scaleDown,
            color: AppColors.primary,
          ),
          suffixIcon: Icon(Icons.check_circle,color: AppColors.greenicon,),
        ),
        3.height,
        MyText(text: "Type",fontSize: 12.sp,fontWeight: FontWeight.w400,color: AppColors.grey,),
        1.height,
        CustomTextField(
          style: GoogleFonts.poppins(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.textColor
          ),
          name: 'type',
          hintText: 'Car',
          readOnly: true,
          controller: widget.typeController,
          // prefixIcon: SvgPicture.asset(
          //   AppSvgs.carIcon,
          //   fit: BoxFit.scaleDown,
          //   color: AppColors.primary,
          // ),
          onTap: (){
          showType.value=!showType.value;
          },
          suffixIcon: Icon(Icons.keyboard_arrow_down_rounded,color: AppColors.darkGrey,),
        ),
        Obx(()=>
        showType.value==true?
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
                      widget.typeController.text=vehicleTypes[index];
                    });

                  },
                  child: ListTile(
                    minVerticalPadding: 0.0,
                    contentPadding: EdgeInsets.zero,
                    minTileHeight: 0.0,

                    title: Column(
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
                                  border: Border.all(color:widget.typeController.text==vehicleTypes[index]? AppColors.primary:AppColors.border),
                                  shape: BoxShape.circle
                              ),
                              child: Container(
                                height: 10,
                                width: 10,
                                decoration: BoxDecoration(
                                    color: widget.typeController.text==vehicleTypes[index]?AppColors.primary:Colors.transparent,
                                    shape: BoxShape.circle
                                ),
                              ),
                            )
                          ],
                        ),
                        1.height,
                        if(index!=vehicleTypes.length-1)
                        Divider(color: AppColors.border,)
                      ],
                    ),
                  ),
                );
              }
          ),
        ):SizedBox.shrink()

        ),

        3.height,

        MyText(text: "Name Your Car",fontSize: 12.sp,fontWeight: FontWeight.w400,color: AppColors.grey,),
        1.height,
        CustomTextField(
          controller: widget.regnumber,
          style: GoogleFonts.poppins(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.textColor
          ),
          name: 'nameyourcar',
          hintText: 'Ex. School Pick Car',
          // prefixIcon: SvgPicture.asset(
          //   AppSvgs.carIcon,
          //   fit: BoxFit.scaleDown,
          //   color: AppColors.primary,
          // ),
          // suffixIcon: Icon(Icons.check_circle,color: AppColors.greenicon,),
        ),
      ],
    );

  }
}


class VinNumber extends StatefulWidget {
final TextEditingController vinnumber;
const VinNumber({super.key, required this.vinnumber, });

  @override
  State<VinNumber> createState() => _VinNumberState();
}

class _VinNumberState extends State<VinNumber> {
  final TextEditingController typeController=TextEditingController();
  RxBool showType=false.obs;
  List<String> vehicleTypes=[
    "Car",
    "SUV",
    "Van",
  ];
  @override
  Widget build(BuildContext context) {
    return   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(text: "VIN Number",fontSize: 12.sp,fontWeight: FontWeight.w400,color: AppColors.grey,),

        1.height,
        CustomTextField(
          style: GoogleFonts.poppins(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.textColor
          ),
          controller: widget.vinnumber,
          name: 'vinnumber',
          hintText: '',
          prefixIcon: SvgPicture.asset(
            AppSvgs.regno,
            fit: BoxFit.scaleDown,
            color: AppColors.primary,
          ),
          suffixIcon: Icon(Icons.check_circle,color: AppColors.greenicon,),
        ),
        3.height,
        MyText(text: "Type Of Vehicle",fontSize: 12.sp,fontWeight: FontWeight.w400,color: AppColors.grey,),
        1.height,
        CustomTextField(
          style: GoogleFonts.poppins(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.textColor
          ),
          name: 'type',
          hintText: 'Car',
          readOnly: true,
          controller: typeController,
          // prefixIcon: SvgPicture.asset(
          //   AppSvgs.carIcon,
          //   fit: BoxFit.scaleDown,
          //   color: AppColors.primary,
          // ),
          onTap: (){
            showType.value=!showType.value;
          },
          suffixIcon: Icon(Icons.keyboard_arrow_down_rounded,color: AppColors.darkGrey,),
        ),
        Obx(()=>
        showType.value==true?
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
                      typeController.text=vehicleTypes[index];
                    });

                  },
                  child: ListTile(
                    minVerticalPadding: 0.0,
                    contentPadding: EdgeInsets.zero,
                    minTileHeight: 0.0,

                    title: Column(
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
                                  border: Border.all(color:typeController.text==vehicleTypes[index]? AppColors.primary:AppColors.border),
                                  shape: BoxShape.circle
                              ),
                              child: Container(
                                height: 10,
                                width: 10,
                                decoration: BoxDecoration(
                                    color: typeController.text==vehicleTypes[index]?AppColors.primary:Colors.transparent,
                                    shape: BoxShape.circle
                                ),
                              ),
                            )
                          ],
                        ),
                        1.height,
                        if(index!=vehicleTypes.length-1)
                          Divider(color: AppColors.border,)
                      ],
                    ),
                  ),
                );
              }
          ),
        ):SizedBox.shrink()),
        3.height,
        MyText(text: "Name Your Ride",fontSize: 12.sp,fontWeight: FontWeight.w400,color: AppColors.grey,),
        1.height,
        CustomTextField(
          style: GoogleFonts.poppins(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.textColor
          ),
          name: 'nameyourcar',
          hintText: 'Ex. School Pick Car',
          // prefixIcon: SvgPicture.asset(
          //   AppSvgs.carIcon,
          //   fit: BoxFit.scaleDown,
          //   color: AppColors.primary,
          // ),
          // suffixIcon: Icon(Icons.check_circle,color: AppColors.greenicon,),
        ),
      ],

    );

  }
}