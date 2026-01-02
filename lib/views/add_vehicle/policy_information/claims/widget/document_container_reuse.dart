import 'dart:math';

import '../../../../../export.dart';
import '../../../../../widgets/core/my_text.dart';

class DocumentContainerReuse extends StatelessWidget {
  final String heading;
  const DocumentContainerReuse({super.key, required this.heading});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.8.h),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(width: 1, color: Color.fromRGBO(235, 223, 224, 1)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                text: heading,
                color: AppColors.textColor,
              ),
              Transform.rotate(
                  angle: -pi / 2,
                  child: Icon(
                    Icons.arrow_back_ios_outlined,
                    size: 18,
                    color: AppColors.darkGrey,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
