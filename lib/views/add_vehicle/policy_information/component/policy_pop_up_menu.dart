import '../../../../export.dart';
import '../../../create_request/view_requests/component/triangle_painter.dart';
import '../../review_details/component/vehicle_type_sheet.dart';

class PolicyPopUpMenu extends StatelessWidget {
  final bool isOpen;
  const PolicyPopUpMenu({super.key, required this.isOpen, });

  @override
  Widget build(BuildContext context) {

    return  Positioned(

        top: 7.h,
        right: 0,
        child: Visibility(
          maintainAnimation: true,
          maintainState: true,
          visible:isOpen,
          child: AnimatedOpacity(
            duration:
            Duration(milliseconds: 200),
            opacity:isOpen==true ? 1 : 0,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topRight,
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(3.w),
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.shadow,
                            blurRadius: 20,
                            offset: Offset(0, 2)
                        )
                      ]

                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     ReusePopupRow(icon: AppSvgs.carIcon, title: "Add Vehicle"),
                      2.height,
                      ReusePopupRow(icon: AppSvgs.carIcon, title: "Add Driver"),
                      2.height,
                      ReusePopupRow(icon: AppSvgs.report, title: "Migrate Policy"),
                      2.height,
                      ReusePopupRow(icon: AppSvgs.sheild, title: "Upgrade Cover"),
                    ],
                  ),
                ),
                Positioned(
                  top: -14,
                  right:0,
                  child: CustomPaint(
                    size: Size(40, 20),
                    painter: TrianglePainter(),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class ReusePopupRow extends StatelessWidget {
  final String icon;
  final String title;
  const ReusePopupRow({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
      onTap: (){
      },
      child: Row(
        children: [
          Container(
            height: 5.h,
            width: 10.5.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.circular(10)
            ),
            child: SvgPicture.asset(icon,height: 3.h,color: AppColors.primary,),

          ),                          3.width,
          Text(title,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: AppColors.textColor,
                fontWeight: FontWeight.w500,
              )),
        ],
      ),
    );

  }
}

