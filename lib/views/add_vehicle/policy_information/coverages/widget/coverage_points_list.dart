import '../../../../../export.dart';
import '../../../../../widgets/core/my_text.dart';

class CoveragePointsList extends StatelessWidget {
  final List<String> points;
  const CoveragePointsList({super.key, required this.points});

  @override
  Widget build(BuildContext context) {
    return   Column(
        children:List.generate(points.length, (index)=>Padding(
          padding:  EdgeInsets.symmetric(vertical: 0.5.h),
          child: Row(
            children: [
              Container(
                height: 5,
                width: 5,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary,
                ),
              ),
              2.width,
              MyText(
                text: points[index].toString(),
                fontWeight: FontWeight.w500,
                fontSize: 11.sp,
                color: AppColors.black,
              ),
            ],
          ),
        ))
    );
  }
}
