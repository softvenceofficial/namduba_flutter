import 'package:get/get.dart';
import 'package:nanduba/controllers/address_controler.dart';

import '../../../../export.dart';
import '../../../manage_address/manage_address_screen.dart';
import '../../gather_estimate/gathering_estimate.dart';

class RequestBottomAddressAndButton extends StatelessWidget {
  // const RequestBottomAddressAndButton({super.key});
  final AddressControler addressControler = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
                color: AppColors.shadow.withOpacity(0.2),
                blurRadius: 20,
                offset: Offset(0, 2))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppSvgs.location,
                height: 2.5.h,
                width: 2.5.w,
              ),
              SizedBox(
                width: 1.w,
              ),
              CustomHeading(
                suffixText: '',
                title: 'Delivery',
                onTap: () {},
                fontWeight: FontWeight.w500,
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  AppCustomNavigator.push(context, ManageAddressScreen(comingFromRequest: true,));
                },
                child: Text(
                  "Change",
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(
                      color: AppColors.primary,
                      fontSize: 10.sp,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primary),
                ),
              ),
            ],
          ),
          1.height,
          Obx(() {
            return Text(addressControler.address.value.toString(),
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(
                  color: AppColors.midDarkGrey,
                  fontWeight: FontWeight.w500,
                ));
          }),
          2.height,
          CustomButton(
            label: "Submit Request",
            onPressed: () {
              AppCustomNavigator.push(context, GatheringEstimate());
            },
          ),
        ],
      ),
    );
  }
}
