import 'package:get/get.dart';
import 'package:nanduba/controllers/vehicle_profile_controller.dart';
import 'package:nanduba/views/add_vehicle/enter_vehicle_details/enter_vehicle_details.dart';
import 'package:nanduba/views/add_vehicle/vehicle_info/widget/vehicle_type_choice_container.dart';
import 'package:nanduba/widgets/core/my_text.dart';

import '../../../../../export.dart';
import '../../widget/service_date_field_widget.dart';

class VehicleInfoTireSizeSheet extends StatefulWidget {
  @override
  State<VehicleInfoTireSizeSheet> createState() =>
      _VehicleInfoTireSizeSheetState();
}

class _VehicleInfoTireSizeSheetState extends State<VehicleInfoTireSizeSheet> {
  final VehicleProfileController controller=Get.find();
  final TextEditingController widthController = TextEditingController();
  final TextEditingController ratioController = TextEditingController();
  final TextEditingController diameterController = TextEditingController();

  RxInt selectedChoice = 0.obs;
  RxBool showWidth=false.obs;
  RxBool showRatio=false.obs;
  RxBool showDiameter=false.obs;

  List<String> width = [
    "165",
    "175",
    "185",
    "195",
    "205",
    "215",
    "225",
    "235",
    "245",
    "255",
    "265",
    "275",
    "285",
    "295",
    "305",
    "315",
    "325",
  ];
  List<String> ratio = [
    '30',
    '35',
    '40',
    '45',
    '50',
    '55',
    '60',
    '65',
    '70',
    '75',
    '80',
    '85',
  ];
  List<String> diameters = [
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
  ];


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(4.w, 2.h, 4.w, 2.h),
      child: SingleChildScrollView(
        child: Wrap(
          children: [
            2.height,
            Row(
              children: [
                MyText(text: "2023 Toyota Corolla",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textColor,),
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
            4.height,
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery
                      .of(context)
                      .viewInsets
                      .bottom),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    text: "Tire Details",
              
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
                    name: 'tires',
                    hintText: "Winter Tires",
                  ),
                  1.height,
                  Row(
                    children: [
                      MyText(text: "Examples: ",
                        color: AppColors.primary,
                        fontWeight: FontWeight.w400,
                        fontSize: 9.sp,),
                      MyText(text: " Winter, Mudders, Spare",
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 9.sp,),
                    ],
                  ),
                  2.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(
                        text: "Tire Size",
              
                        fontSize: 12.sp,
                        color: AppColors.grey,
                        fontWeight: FontWeight.w400,
              
                      ),
                      MyText(
                        text: "Clear",
              
                        fontSize: 10.sp,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline,
              
                      ),
                    ],
                  ),
                  1.height,
                  Row(
                    // mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            ServiceDateWidget(hint: "Width",controller: widthController,onTap: (){
                              showWidth.value = !showWidth.value;

                            },
                            readOnly: true,
                            ),
                            ReuseDropDownContainerList(boolvalue: showWidth, items: width, textController: widthController)
                          ],
                        ),
                      ),
                      3.width,
                      Expanded(
                        child: Column(
                          children: [
                            ServiceDateWidget(hint: "Ratio",controller: ratioController,onTap: (){
                              showRatio.value = !showRatio.value;
                            },
                              readOnly: true,
                            ),
                            ReuseDropDownContainerList(boolvalue: showRatio, items: ratio, textController: ratioController)
              
                          ],
                        ),
                      ),
                       3.width,
                       Expanded(
                         child: Column(
                           children: [
                             ServiceDateWidget(hint: "Diameter", controller: diameterController, onTap: (){
                               showDiameter.value = !showDiameter.value;
                             },
                               readOnly: true,
                             ),
                             ReuseDropDownContainerList(boolvalue: showDiameter, items: diameters, textController: diameterController)

                           ],
                         ),
                       ),
              
              
                    ],
                  ),
                  2.height,
                  MyText(text: "OEM Standard Sizes",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textColor,),
                  1.height,
                  Obx(() {
              
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        VehicleTypeChoiceContainer(
                          choice: "215/45R17",
                          selectedChoice: selectedChoice.value,
                          selection: 1,
                          onTap: () {
                            selectedChoice.value = 1;
                          },
                        ),
                        1.height,
                        VehicleTypeChoiceContainer(
                          choice: "195/65R15",
                          selectedChoice: selectedChoice.value,
                          selection: 2,
                          onTap: () {
                            selectedChoice.value = 2;
                          },
                        ),
                        1.height,
                        VehicleTypeChoiceContainer(
                          choice: "205/55R16",
                          selectedChoice: selectedChoice.value,
                          selection: 3,
                          onTap: () {
                            selectedChoice.value = 3;
                          },),
                      ],
                    );
                  }),
              
              
                  3.height,
              
                  CustomButton(
                    label: "Save",
                    onPressed: () {
                      controller.showSavedTiresDetails.value=!controller.showSavedTiresDetails.value;
                      Navigator.pop(context);
              
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

