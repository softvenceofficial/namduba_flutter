
import 'package:nanduba/views/create_request/view_requests/component/triangle_painter.dart';

import '../../../../export.dart';
import '../../../../providers/view_request_provider.dart';

class CancelRequestPopUp extends StatelessWidget {
  final ViewRequestProvider viewRequestProvider;
  final int requestcategoryindex;
  const CancelRequestPopUp({super.key, required this.viewRequestProvider, required this.requestcategoryindex});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 30,
        right: 5,
        child: Visibility(
          maintainAnimation: true,
          maintainState: true,
          visible: viewRequestProvider.showCancelRequest == requestcategoryindex ? true : false,
          child: AnimatedOpacity(
            duration:
            Duration(milliseconds: 200),
            opacity: viewRequestProvider.showCancelRequest == requestcategoryindex ? 1 : 0,
            child: GestureDetector(
              onTap: () {
                print("cancel request");
              },
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topRight,
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.3.h),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(3.w)),
                    child: Row(
                      children: [
                        SvgPicture.asset(AppSvgs.closeCircle, color: AppColors.primary,),
                        1.width,
                        Text("Cancel Request",
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w500,
                            )),
                      ],
                    ),
                  ),
                  Positioned(
                    top: -10,
                    right: -2,
                    child: CustomPaint(
                      size: Size(40, 20),
                      painter: TrianglePainter(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
