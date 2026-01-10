import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';

class textwithreddot extends StatelessWidget {
  final String text;
  const textwithreddot({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(AppSvgs.reddot),
        2.width,
        Text(
          text,
          style: Textfontstyle.TextStyle12w500c212121poppins.copyWith(
              color: AppColors.c252628, fontSize: 12.sp),
        ),
      ],
    );
  }
}
