import 'dart:math';

import '../../../../export.dart';

class ServiceDateWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String hint;
  final int? maxLength;
  final void Function()? onTap;
  final bool readOnly;
  const ServiceDateWidget({super.key,  this.controller, required this.hint, this.maxLength, this.onTap,  this.readOnly =false});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: 28.w,
      child: TextFormField(
        readOnly: readOnly,
        onTap: onTap,
        controller: controller,
        keyboardType: TextInputType.datetime,
        maxLength: maxLength,
        style: GoogleFonts.poppins(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.textColor
        ),
        decoration: InputDecoration(
            counter: SizedBox.shrink(),
            hintText: hint,
            hintStyle:  GoogleFonts.poppins(
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.midDarkGrey
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: AppColors.border)
            ),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: AppColors.border)
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: AppColors.border)
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: AppColors.primary)
            ),


            suffixIcon: Transform.rotate(
                angle: -pi/2,
                child: Icon(Icons.arrow_back_ios_new_rounded,size: 18,color: AppColors.darkGrey,))


        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
