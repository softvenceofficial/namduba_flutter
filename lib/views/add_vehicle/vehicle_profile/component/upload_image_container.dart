import 'package:get/get.dart';
import 'package:nanduba/controllers/vehicle_profile_controller.dart';

import '../../../../export.dart';

class UploadImageContainer extends StatelessWidget {
  // const UploadImageContainer({super.key});
final VehicleProfileController controller=Get.find();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        controller.pickImage();
      },
      child: DottedBorder(
        borderType: BorderType.RRect,
        color: AppColors.primary,
        radius: Radius.circular(16),
        padding: EdgeInsets.zero,
        child: Container(
            height: 9.h,
            width: 20.w,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.lightpinks,
            ),
            child: SvgPicture.asset(AppSvgs.upload)),
      ),
    );

  }
}
