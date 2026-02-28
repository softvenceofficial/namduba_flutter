// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:nanduba/widgets/core/my_text.dart';

import '../../../../export.dart';

class OdometerReadingSheet extends StatefulWidget {
  final TextEditingController odoController;
  const OdometerReadingSheet({super.key, required this.odoController});

  @override
  State<OdometerReadingSheet> createState() => _OdometerReadingSheetState();
}

class _OdometerReadingSheetState extends State<OdometerReadingSheet> {
  late final TextEditingController meter;

  @override
  void initState() {
    super.initState();
    meter = TextEditingController(text: widget.odoController.text);
  }

  @override
  void dispose() {
    meter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 42,
      height: 42,
      textStyle: const TextStyle(fontSize: 16, color: Colors.black),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(11),
        border: Border.all(color: AppColors.border),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 1),
            color: Colors.black26,
            blurRadius: 10,
          ),
        ],
      ),
    );

    return Padding(
      padding: EdgeInsets.fromLTRB(4.w, 2.h, 4.w, 2.h),
      child: Wrap(
        children: [
          2.height,
          Row(
            children: [
              MyText(
                text: "Odometer reading adjustment",
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.textColor,
              ),
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
          const Divider(color: AppColors.border),
          4.height,
          Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              children: [
                SizedBox(
                  height: 183,
                  width: 232,
                  child: Image.asset(AppImages.odometers),
                ),
                2.height,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Pinput(
                    length: 6,
                    controller: meter,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration!.copyWith(
                        border: Border.all(color: AppColors.primary),
                      ),
                    ),
                    submittedPinTheme: defaultPinTheme,
                    keyboardType: TextInputType.number,
                    onCompleted: (value) {
                      debugPrint("Completed: $value");
                    },
                  ),
                ),
                2.height,
                CustomButton(
                  label: "Save",
                  onPressed: () {
                    widget.odoController.text = meter.text;
                    setState(() {});
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
