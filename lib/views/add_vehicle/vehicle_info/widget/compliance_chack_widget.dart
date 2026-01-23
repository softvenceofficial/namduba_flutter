import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/add_vehicle/vehicle_info/widget/compliance_popup.dart';

class ComplianceChackWidget extends StatefulWidget {
  const ComplianceChackWidget({super.key});

  @override
  State<ComplianceChackWidget> createState() => _ComplianceChackWidgetState();
}

class _ComplianceChackWidgetState extends State<ComplianceChackWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: CustomContainer(
          vpadding: 15,
          hpadding: 15,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Compliance check",
                style: Textfontstyle.TextStyle14w400midgreypoppins.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.textColor,
                    fontSize: 14.sp),
              ),
              .5.height,
              Text(
                "View your Corolla's compliance details using license plate",
                style: Textfontstyle.TextStyle14w400midgreypoppins.copyWith(
                    fontWeight: FontWeight.w400, fontSize: 10.sp),
              ),
              2.height,
              CustomButton(
                label: "Check Compliance",
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return const CompliancePopup();
                    },
                  );
                },
                backgroundColor: AppColors.white,
                borderColor: AppColors.cCA2626,
                textcolor: AppColors.cCA2626,
              )
            ],
          )),
    );
  }
}
