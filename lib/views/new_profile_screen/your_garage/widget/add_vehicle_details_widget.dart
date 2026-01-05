import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';

class MakeItemWidget extends StatelessWidget {
  final String title;
  final String value;
  final VoidCallback? onTap;

  const MakeItemWidget({
    super.key,
    required this.title,
    required this.value,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Stack(
        children: [
          Row(
            children: [
              SvgPicture.asset(AppSvgs.tickcircle),
              2.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Textfontstyle.TextStyle12w500c212121poppins.copyWith(
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    value,
                    style: Textfontstyle.TextStyle12w500c212121poppins.copyWith(
                        color: AppColors.grey),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            right: 12,
            top: 0,
            bottom: 0,
            child: SvgPicture.asset(AppSvgs.arrowCircleRight),
          ),
        ],
      ),
    );
  }
}
