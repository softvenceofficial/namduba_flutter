import 'package:get/get.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/add_vehicle/review_details/review_vehicledetails_manual.dart';

import '../../../widgets/core/my_text.dart';
import 'package:country_picker/country_picker.dart' as cp;

class EnterVehicleDetails extends StatefulWidget {
  @override
  State<EnterVehicleDetails> createState() => _EnterVehicleDetailsState();
}

class _EnterVehicleDetailsState extends State<EnterVehicleDetails> {
  final TextEditingController countryController=TextEditingController();
  final TextEditingController colorController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final TextEditingController makeController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController trimController = TextEditingController();
  final TextEditingController engineController = TextEditingController();
  final TextEditingController typeController = TextEditingController();

  String countryImage='';
  RxBool showColor=false.obs;
  RxBool showYear=false.obs;
  RxBool showVehicleType=false.obs;
  RxBool showMake=false.obs;
  RxBool showModel=false.obs;
  RxBool showTrim=false.obs;
  RxBool showEngine=false.obs;

 List<String> colors=[
   "Red",
   "Blue",
   "Black",
   "Grey",
   "Pink",
   "Yellow",
   "Orange"
 ];
 List<String> years=[
   "2024",
   "2023",
   "2022",
   "2021",
   "2020",
   "2019",
   "2018",
   "2017",
   "2016",
   "2015",
 ];
 List<String> vehicleTypes=[
    "Car",
    "SUV",
    "Van",
  ];
 List<String> make=[
    "Toyota",
    "Ford",
    "Honda"
    "BMW",
    "Mercedes-Benz",
    "Chevrolet",
    "Nissan",
    "Volkswagen"
  ];
 List<String> model = [
    'Camry',
    'Mustang',
    'Accord',
    '3 Series',
    'Silverado',
  ];
 List<String> trim = [
    'Camry LE',
    'Camry XSE',
    'Mustang GT',
    'Mustang EcoBoost',
    'Accord LX',
    'Accord Touring',
    '3 Series 330i',
    '3 Series M340i',
    'Silverado LT',
    'Silverado High Country',
  ];
 List<String> engines = [
    '2.5L 4-Cylinder (Camry LE)',
    '3.5L V6 (Camry XSE)',
    '5.0L V8 (Mustang GT)',
    '2.3L EcoBoost I4 (Mustang EcoBoost)',
    '1.5L Turbo I4 (Accord LX)',
    '2.0L Turbo I4 (Accord Touring)',
    '2.0L TwinPower Turbo I4 (3 Series 330i)',
    '3.0L Turbo I6 (3 Series M340i)',
    '5.3L V8 (Silverado LT)',
    '6.2L V8 (Silverado High Country)',
  ];


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
                  title: "Enter Vehicle Details",
                ),
              ),
              Expanded(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                        Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(text: "Year",fontSize: 12.sp,fontWeight: FontWeight.w400,color: AppColors.grey,),
                          1.height,
                          CustomTextField(
                            controller: yearController,
                            readOnly: true,
                            style: GoogleFonts.poppins(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textColor
                            ),
                            name: 'yearcar',
                            hintText: '',
                            prefixIcon: SvgPicture.asset(
                              AppSvgs.calendar,
                              fit: BoxFit.scaleDown,
                              color: AppColors.primary,
                            ),
                            onTap: (){
                              showYear.value=!showYear.value;
                            },
                            suffixIcon: Icon(Icons.keyboard_arrow_down_rounded,color: AppColors.darkGrey,),
                          ),
                          // Obx(()=>
                          // showYear.value==true?
                          // Container(
                          //   padding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 4.w),
                          //   decoration: BoxDecoration(
                          //       border: Border.all(color: AppColors.border),
                          //       borderRadius: BorderRadius.circular(16)
                          //   ),
                          //   child: ListView.builder(
                          //       itemCount: years.length,
                          //       shrinkWrap: true,
                          //       physics: NeverScrollableScrollPhysics(),
                          //       itemBuilder: (context,index) {
                          //         return GestureDetector(
                          //           onTap: (){
                          //             setState(() {
                          //               yearController.text=years[index];
                          //             });
                          //
                          //           },
                          //           child: ListTile(
                          //             minVerticalPadding: 0.0,
                          //             contentPadding: EdgeInsets.zero,
                          //             minTileHeight: 0.0,
                          //
                          //             title: Column(
                          //               children: [
                          //                 Row(
                          //                   children: [
                          //                     // SvgPicture.asset(AppSvgs.carIcon),
                          //                     // 2.width,
                          //                     MyText(text: years[index],fontSize: 10.sp,fontWeight: FontWeight.w400,color: AppColors.textColor,),
                          //                     Spacer(),
                          //                     Container(
                          //                       height: 20,
                          //                       width: 20,
                          //                       alignment: Alignment.center,
                          //                       decoration: BoxDecoration(
                          //                           border: Border.all(color:yearController.text==years[index]? AppColors.primary:AppColors.border),
                          //                           shape: BoxShape.circle
                          //                       ),
                          //                       child: Container(
                          //                         height: 10,
                          //                         width: 10,
                          //                         decoration: BoxDecoration(
                          //                             color: yearController.text==years[index]?AppColors.primary:Colors.transparent,
                          //                             shape: BoxShape.circle
                          //                         ),
                          //                       ),
                          //                     )
                          //                   ],
                          //                 ),
                          //                 1.height,
                          //                 if(index!=years.length-1)
                          //                   Divider(color: AppColors.border,)
                          //               ],
                          //             ),
                          //           ),
                          //         );
                          //       }
                          //   ),
                          // ):SizedBox.shrink()),
                          ReuseDropDownContainerList(boolvalue: showYear, items: years, textController: yearController),
                          2.height,
                          MyText(text: "Make",fontSize: 12.sp,fontWeight: FontWeight.w400,color: AppColors.grey,),
                          1.height,
                          CustomTextField(
                            readOnly: true,
                            controller: makeController,
                            style: GoogleFonts.poppins(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textColor
                            ),
                            name: 'carmake',
                            hintText: '',
                            prefixIcon: SvgPicture.asset(
                              AppSvgs.global,
                              fit: BoxFit.scaleDown,
                              color: AppColors.primary,
                            ),
                            onTap: (){
                              showMake.value =!showMake.value;
                            },
                            suffixIcon: Icon(Icons.keyboard_arrow_down_rounded,color: AppColors.darkGrey,),
                          ),
                          // Obx(()=>
                          // showMake.value==true?
                          // Container(
                          //   padding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 4.w),
                          //   decoration: BoxDecoration(
                          //       border: Border.all(color: AppColors.border),
                          //       borderRadius: BorderRadius.circular(16)
                          //   ),
                          //   child: ListView.builder(
                          //       itemCount: make.length,
                          //       shrinkWrap: true,
                          //       physics: NeverScrollableScrollPhysics(),
                          //       itemBuilder: (context,index) {
                          //         return GestureDetector(
                          //           onTap: (){
                          //             setState(() {
                          //               makeController.text=make[index];
                          //             });
                          //
                          //           },
                          //           child: ListTile(
                          //             minVerticalPadding: 0.0,
                          //             contentPadding: EdgeInsets.zero,
                          //             minTileHeight: 0.0,
                          //
                          //             title: Column(
                          //               children: [
                          //                 Row(
                          //                   children: [
                          //                     // SvgPicture.asset(AppSvgs.carIcon),
                          //                     // 2.width,
                          //                     MyText(text: make[index],fontSize: 10.sp,fontWeight: FontWeight.w400,color: AppColors.textColor,),
                          //                     Spacer(),
                          //                     Container(
                          //                       height: 20,
                          //                       width: 20,
                          //                       alignment: Alignment.center,
                          //                       decoration: BoxDecoration(
                          //                           border: Border.all(color:makeController.text==make[index]? AppColors.primary:AppColors.border),
                          //                           shape: BoxShape.circle
                          //                       ),
                          //                       child: Container(
                          //                         height: 10,
                          //                         width: 10,
                          //                         decoration: BoxDecoration(
                          //                             color: makeController.text==make[index]?AppColors.primary:Colors.transparent,
                          //                             shape: BoxShape.circle
                          //                         ),
                          //                       ),
                          //                     )
                          //                   ],
                          //                 ),
                          //                 1.height,
                          //                 if(index!=make.length-1)
                          //                   Divider(color: AppColors.border,)
                          //               ],
                          //             ),
                          //           ),
                          //         );
                          //       }
                          //   ),
                          // ):SizedBox.shrink()),
                          ReuseDropDownContainerList(boolvalue: showMake, items: make, textController: makeController),


                          2.height,
                          MyText(text: "Model",fontSize: 12.sp,fontWeight: FontWeight.w400,color: AppColors.grey,),
                          1.height,
                          CustomTextField(
                            readOnly: true,
                            controller: modelController,
                            style: GoogleFonts.poppins(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textColor
                            ),
                            name: 'model',
                            hintText: '',
                            prefixIcon: SvgPicture.asset(
                              AppSvgs.carIcon,
                              fit: BoxFit.scaleDown,
                              color: AppColors.primary,
                            ),
                            onTap: (){
                            showModel.value=!showModel.value;
                              },

                            suffixIcon: Icon(Icons.keyboard_arrow_down_rounded,color: AppColors.darkGrey,),
                          ),
                          // Obx(()=>
                          // showModel.value==true?
                          // Container(
                          //   padding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 4.w),
                          //   decoration: BoxDecoration(
                          //       border: Border.all(color: AppColors.border),
                          //       borderRadius: BorderRadius.circular(16)
                          //   ),
                          //   child: ListView.builder(
                          //       itemCount: model.length,
                          //       shrinkWrap: true,
                          //       physics: NeverScrollableScrollPhysics(),
                          //       itemBuilder: (context,index) {
                          //         return GestureDetector(
                          //           onTap: (){
                          //             setState(() {
                          //               modelController.text=model[index];
                          //             });
                          //
                          //           },
                          //           child: ListTile(
                          //             minVerticalPadding: 0.0,
                          //             contentPadding: EdgeInsets.zero,
                          //             minTileHeight: 0.0,
                          //
                          //             title: Column(
                          //               children: [
                          //                 Row(
                          //                   children: [
                          //                     // SvgPicture.asset(AppSvgs.carIcon),
                          //                     // 2.width,
                          //                     MyText(text: model[index],fontSize: 10.sp,fontWeight: FontWeight.w400,color: AppColors.textColor,),
                          //                     Spacer(),
                          //                     Container(
                          //                       height: 20,
                          //                       width: 20,
                          //                       alignment: Alignment.center,
                          //                       decoration: BoxDecoration(
                          //                           border: Border.all(color:modelController.text==model[index]? AppColors.primary:AppColors.border),
                          //                           shape: BoxShape.circle
                          //                       ),
                          //                       child: Container(
                          //                         height: 10,
                          //                         width: 10,
                          //                         decoration: BoxDecoration(
                          //                             color: modelController.text==model[index]?AppColors.primary:Colors.transparent,
                          //                             shape: BoxShape.circle
                          //                         ),
                          //                       ),
                          //                     )
                          //                   ],
                          //                 ),
                          //                 1.height,
                          //                 if(index!=model.length-1)
                          //                   Divider(color: AppColors.border,)
                          //               ],
                          //             ),
                          //           ),
                          //         );
                          //       }
                          //   ),
                          // ):SizedBox.shrink()),
                          ReuseDropDownContainerList(boolvalue: showModel, items: model, textController: modelController),

                          2.height,
                          MyText(text: "Trim",fontSize: 12.sp,fontWeight: FontWeight.w400,color: AppColors.grey,),
                          1.height,
                          CustomTextField(
                            readOnly: true,
                            controller: trimController,
                            style: GoogleFonts.poppins(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textColor
                            ),
                            name: 'trim',
                            hintText: '',
                            prefixIcon: SvgPicture.asset(
                              AppSvgs.carIcon,
                              fit: BoxFit.scaleDown,
                              color: AppColors.primary,
                            ),
                            onTap: (){
                              showTrim.value =!showTrim.value;
                            },
                            suffixIcon: Icon(Icons.keyboard_arrow_down_rounded,color: AppColors.darkGrey,),
                          ),
                          ReuseDropDownContainerList(boolvalue: showTrim, items: trim, textController: trimController),

                          // Obx(()=>
                          // showTrim.value==true?
                          // Container(
                          //   padding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 4.w),
                          //   decoration: BoxDecoration(
                          //       border: Border.all(color: AppColors.border),
                          //       borderRadius: BorderRadius.circular(16)
                          //   ),
                          //   child: ListView.builder(
                          //       itemCount: trim.length,
                          //       shrinkWrap: true,
                          //       physics: NeverScrollableScrollPhysics(),
                          //       itemBuilder: (context,index) {
                          //         return GestureDetector(
                          //           onTap: (){
                          //             setState(() {
                          //               trimController.text=trim[index];
                          //             });
                          //
                          //           },
                          //           child: ListTile(
                          //             minVerticalPadding: 0.0,
                          //             contentPadding: EdgeInsets.zero,
                          //             minTileHeight: 0.0,
                          //
                          //             title: Column(
                          //               children: [
                          //                 Row(
                          //                   children: [
                          //                     // SvgPicture.asset(AppSvgs.carIcon),
                          //                     // 2.width,
                          //                     MyText(text: trim[index],fontSize: 10.sp,fontWeight: FontWeight.w400,color: AppColors.textColor,),
                          //                     Spacer(),
                          //                     Container(
                          //                       height: 20,
                          //                       width: 20,
                          //                       alignment: Alignment.center,
                          //                       decoration: BoxDecoration(
                          //                           border: Border.all(color:trimController.text==trim[index]? AppColors.primary:AppColors.border),
                          //                           shape: BoxShape.circle
                          //                       ),
                          //                       child: Container(
                          //                         height: 10,
                          //                         width: 10,
                          //                         decoration: BoxDecoration(
                          //                             color: trimController.text==trim[index]?AppColors.primary:Colors.transparent,
                          //                             shape: BoxShape.circle
                          //                         ),
                          //                       ),
                          //                     )
                          //                   ],
                          //                 ),
                          //                 1.height,
                          //                 if(index!=trim.length-1)
                          //                   Divider(color: AppColors.border,)
                          //               ],
                          //             ),
                          //           ),
                          //         );
                          //       }
                          //   ),
                          // ):SizedBox.shrink()),
                          2.height,
                          MyText(text: "Engine",fontSize: 12.sp,fontWeight: FontWeight.w400,color: AppColors.grey,),
                          1.height,
                          CustomTextField(
                            readOnly: true,
                            controller: engineController,
                            style: GoogleFonts.poppins(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textColor
                            ),
                            name: 'engine',
                            hintText: '',
                            prefixIcon: SvgPicture.asset(
                              AppSvgs.engine,
                              fit: BoxFit.scaleDown,
                              color: AppColors.primary,
                            ),
                            onTap: (){
                              showEngine.value=!showEngine.value;
                            },
                            suffixIcon: Icon(Icons.keyboard_arrow_down_rounded,color: AppColors.darkGrey,),
                          ),
                          ReuseDropDownContainerList(boolvalue: showEngine, items: engines, textController: engineController),

                          // Obx(()=>
                          // showEngine.value==true?
                          // Container(
                          //   padding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 4.w),
                          //   decoration: BoxDecoration(
                          //       border: Border.all(color: AppColors.border),
                          //       borderRadius: BorderRadius.circular(16)
                          //   ),
                          //   child: ListView.builder(
                          //       itemCount: engines.length,
                          //       shrinkWrap: true,
                          //       physics: NeverScrollableScrollPhysics(),
                          //       itemBuilder: (context,index) {
                          //         return GestureDetector(
                          //           onTap: (){
                          //             setState(() {
                          //               engineController.text=engines[index];
                          //             });
                          //
                          //           },
                          //           child: ListTile(
                          //             minVerticalPadding: 0.0,
                          //             contentPadding: EdgeInsets.zero,
                          //             minTileHeight: 0.0,
                          //
                          //             title: Column(
                          //               children: [
                          //                 Row(
                          //                   children: [
                          //                     // SvgPicture.asset(AppSvgs.carIcon),
                          //                     // 2.width,
                          //                     MyText(text: engines[index],fontSize: 10.sp,fontWeight: FontWeight.w400,color: AppColors.textColor,),
                          //                     Spacer(),
                          //                     Container(
                          //                       height: 20,
                          //                       width: 20,
                          //                       alignment: Alignment.center,
                          //                       decoration: BoxDecoration(
                          //                           border: Border.all(color:engineController.text==engines[index]? AppColors.primary:AppColors.border),
                          //                           shape: BoxShape.circle
                          //                       ),
                          //                       child: Container(
                          //                         height: 10,
                          //                         width: 10,
                          //                         decoration: BoxDecoration(
                          //                             color: engineController.text==engines[index]?AppColors.primary:Colors.transparent,
                          //                             shape: BoxShape.circle
                          //                         ),
                          //                       ),
                          //                     )
                          //                   ],
                          //                 ),
                          //                 1.height,
                          //                 if(index!=engines.length-1)
                          //                   Divider(color: AppColors.border,)
                          //               ],
                          //             ),
                          //           ),
                          //         );
                          //       }
                          //   ),
                          // ):SizedBox.shrink()),

                          2.height,
                          MyText(text: "Color",fontSize: 12.sp,fontWeight: FontWeight.w400,color: AppColors.grey,),
                          1.height,
                          CustomTextField(
                            style: GoogleFonts.poppins(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textColor
                            ),
                            name: 'color',
                            hintText: 'Blue',
                            readOnly: true,
                            controller: colorController,
                            prefixIcon: SvgPicture.asset(
                              AppSvgs.carIcon,
                              fit: BoxFit.scaleDown,
                              color: AppColors.primary,
                            ),
                            onTap: (){
                              showColor.value=!showColor.value;
                            },
                            suffixIcon: Icon(Icons.keyboard_arrow_down_rounded,color: AppColors.darkGrey,),
                          ),
                          // Obx(()=>
                          // showColor.value==true?
                          // Container(
                          //   padding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 4.w),
                          //   decoration: BoxDecoration(
                          //       border: Border.all(color: AppColors.border),
                          //       borderRadius: BorderRadius.circular(16)
                          //   ),
                          //   child: ListView.builder(
                          //       itemCount: colors.length,
                          //       shrinkWrap: true,
                          //       physics: NeverScrollableScrollPhysics(),
                          //       itemBuilder: (context,index) {
                          //         return GestureDetector(
                          //           onTap: (){
                          //             setState(() {
                          //               colorController.text=colors[index];
                          //             });
                          //
                          //           },
                          //           child: ListTile(
                          //             minVerticalPadding: 0.0,
                          //             contentPadding: EdgeInsets.zero,
                          //             minTileHeight: 0.0,
                          //
                          //             title: Column(
                          //               children: [
                          //                 Row(
                          //                   children: [
                          //                     // SvgPicture.asset(AppSvgs.carIcon),
                          //                     // 2.width,
                          //                     MyText(text: colors[index],fontSize: 10.sp,fontWeight: FontWeight.w400,color: AppColors.textColor,),
                          //                     Spacer(),
                          //                     Container(
                          //                       height: 20,
                          //                       width: 20,
                          //                       alignment: Alignment.center,
                          //                       decoration: BoxDecoration(
                          //                           border: Border.all(color:colorController.text==colors[index]? AppColors.primary:AppColors.border),
                          //                           shape: BoxShape.circle
                          //                       ),
                          //                       child: Container(
                          //                         height: 10,
                          //                         width: 10,
                          //                         decoration: BoxDecoration(
                          //                             color: colorController.text==colors[index]?AppColors.primary:Colors.transparent,
                          //                             shape: BoxShape.circle
                          //                         ),
                          //                       ),
                          //                     )
                          //                   ],
                          //                 ),
                          //                 1.height,
                          //                 if(index!=colors.length-1)
                          //                   Divider(color: AppColors.border,)
                          //               ],
                          //             ),
                          //           ),
                          //         );
                          //       }
                          //   ),
                          // ):SizedBox.shrink()),
                          ReuseDropDownContainerList(boolvalue: showColor, items: colors, textController: colorController),

                          2.height,
                          MyText(text: "Country",fontSize: 12.sp,fontWeight: FontWeight.w400,color: AppColors.grey,),
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
                                  print(countryImage);
                                });
                                },
                              );
                            },
                            suffixIcon: Icon(Icons.keyboard_arrow_down_rounded,color: AppColors.darkGrey,),
                          ),
                          2.height,
                          MyText(text: "Reg Number",fontSize: 12.sp,fontWeight: FontWeight.w400,color: AppColors.grey,),
                          1.height,
                          CustomTextField(
                            style: GoogleFonts.poppins(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textColor
                            ),
                            name: 'renumber',
                            hintText: '',
                            prefixIcon: SvgPicture.asset(
                              AppSvgs.regno,
                              fit: BoxFit.scaleDown,
                              color: AppColors.primary,
                            ),
                            onTap: (){
                            },
                          ),
                          2.height,
                          MyText(text: "Vehicle Type",fontSize: 12.sp,fontWeight: FontWeight.w400,color: AppColors.grey,),
                          1.height,
                          CustomTextField(
                            readOnly: true,
                            controller: typeController,
                            style: GoogleFonts.poppins(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textColor
                            ),
                            name: 'vehicletype',
                            hintText: '',
                            prefixIcon: SvgPicture.asset(
                              AppSvgs.carIcon,
                              fit: BoxFit.scaleDown,
                              color: AppColors.primary,
                            ),
                            onTap: (){
                              showVehicleType.value=!showVehicleType.value;
                            },
                            suffixIcon: Icon(Icons.keyboard_arrow_down_rounded,color: AppColors.darkGrey,),
                          ),
                          Obx(()=>
                          showVehicleType.value==true?
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
                          ):SizedBox.shrink()

                          ),
                        ],
                      ),
                          2.height,
                          MyText(text: "Vehicle Name",fontSize: 12.sp,fontWeight: FontWeight.w400,color: AppColors.grey,),
                          1.height,
                          CustomTextField(
                            style: GoogleFonts.poppins(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textColor
                            ),
                            name: 'vehiclename',
                            hintText: '',
                            prefixIcon: SvgPicture.asset(
                              AppSvgs.carIcon,
                              fit: BoxFit.scaleDown,
                              color: AppColors.primary,
                            ),
                            onTap: (){
                            },
                          ),
                          1.height,
                          GestureDetector(
                              onTap: (){
                                AppCustomNavigator.pop(context);
                              },

                              child: MyText(text: "Enter your Reg number to find your vehicle",color: AppColors.primary,fontWeight: FontWeight.w500,fontSize: 10.sp,decoration: TextDecoration.underline,)),
                          3.height,
                          CustomButton(
                            label: "Add Vehicle",
                            onPressed: () {
                              AppCustomNavigator.push(context, ReviewVehicledetailsManual());
                            },
                          ),
                          3.height,







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


class ReuseDropDownContainerList extends StatefulWidget {
  final RxBool boolvalue;
  final List<String> items;
  final TextEditingController textController;
  const ReuseDropDownContainerList({super.key, required this.boolvalue, required this.items, required this.textController});

  @override
  State<ReuseDropDownContainerList> createState() => _ReuseDropDownContainerListState();
}

class _ReuseDropDownContainerListState extends State<ReuseDropDownContainerList> {
  @override
  Widget build(BuildContext context) {
   return Obx(()=>
   widget.boolvalue.value==true?
    Container(
      padding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 4.w),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.border),
          borderRadius: BorderRadius.circular(16)
      ),
      child: ListView.builder(
          itemCount: widget.items.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context,index) {
            return GestureDetector(
              onTap: (){
                setState(() {
                  widget.textController.text=widget.items[index];

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
                        // SvgPicture.asset(AppSvgs.carIcon),
                        // 2.width,
                        MyText(text: widget.items[index],fontSize: 10.sp,fontWeight: FontWeight.w400,color: AppColors.textColor,),
                        Spacer(),
                        Container(
                          height: 20,
                          width: 20,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(color:widget.textController.text==widget.items[index]? AppColors.primary:AppColors.border),
                              shape: BoxShape.circle
                          ),
                          child: Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                                color: widget.textController.text==widget.items[index]?AppColors.primary:Colors.transparent,
                                shape: BoxShape.circle
                            ),
                          ),
                        )
                      ],
                    ),
                    1.height,
                    if(index!=widget.items.length-1)
                      Divider(color: AppColors.border,)
                  ],
                ),
              ),
            );
          }
      ),
    ):SizedBox.shrink());

  }
}
