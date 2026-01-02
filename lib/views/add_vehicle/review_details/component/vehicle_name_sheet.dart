import 'package:nanduba/widgets/core/my_text.dart';

import '../../../../export.dart';

class VehicleNameSheet extends StatelessWidget {
  const VehicleNameSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(4.w, 2.h, 4.w, 2.h),
      child: Wrap(
        children: [
          2.height,
         Row(
           children: [
           MyText(text: "Vehicle Name",fontSize: 14.sp,fontWeight: FontWeight.w600,color: AppColors.textColor,),
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
                Text(
                  "Give Your Car a Name",
                  style:
                  Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 10.sp,
                    color: AppColors.grey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                1.height,
                CustomTextField(
                  style: GoogleFonts.poppins(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textColor
                  ),
                  name: 'carname',
                  hintText: "S Sedan 4-Door",
                  prefixIcon: SvgPicture.asset(
                    AppSvgs.carIcon,
                    fit: BoxFit.scaleDown,
                    color: AppColors.primary,
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
