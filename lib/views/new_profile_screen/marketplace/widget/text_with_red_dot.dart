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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(AppSvgs.reddot),
        2.width,
        Expanded(
          child: Text(
            text,
            style: Textfontstyle.TextStyle12w500c212121poppins.copyWith(
              color: AppColors.c252628,
              fontSize: 10.sp,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
