import 'package:get/get.dart';
import 'package:nanduba/views/add_vehicle/vehicle_info/widget/vehicle_type_choice_container.dart';
import 'package:nanduba/widgets/core/my_text.dart';
import 'package:pin_code_fields/pin_code_fields.dart'as pininput;
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../export.dart';

class OdometerReadingSheet extends StatefulWidget {
  final TextEditingController odoController;
  const OdometerReadingSheet({super.key, required this.odoController});

  @override
  State<OdometerReadingSheet> createState() => _OdometerReadingSheetState();
}

class _OdometerReadingSheetState extends State<OdometerReadingSheet> {
  final TextEditingController meter = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(4.w, 2.h, 4.w, 2.h),
      child: Wrap(
        children: [
          2.height,
          Row(
            children: [
              MyText(text: "Odometer reading adjustment",fontSize: 14.sp,fontWeight: FontWeight.w600,color: AppColors.textColor,),
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
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              children: [
                SizedBox(
                    height: 183,
                    width: 232,
                    child: Image.asset(AppImages.odometers)),
                2.height,
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 5.w),
                  child: pininput.PinCodeTextField(
                    controller: meter,
                                appContext: context,
                                length: 6,
                                onChanged: (value) {},
                                pinTheme: pininput.PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(11),
                  fieldHeight: 42,
                  fieldWidth: 42,
                  activeFillColor: Colors.white,
                  inactiveFillColor: Colors.white,
                  selectedFillColor: Colors.white,
                  activeColor: AppColors.primary,
                  inactiveColor: AppColors.border,
                  selectedColor: AppColors.border,
                                ),
                                keyboardType: TextInputType.number,
                                boxShadows: [
                  BoxShadow(
                    offset: Offset(0, 1),
                    color: Colors.black26,
                    blurRadius: 10,
                  )
                                ],
                                onCompleted: (value) {
                  print("Completed: $value");
                                },
                              ),
                ),

                2.height,
                CustomButton(
                  label: "Save",
                  onPressed: () {
                      widget.odoController.text=meter.text;
                      setState(() {

                      });
                      Get.back();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
