import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';

class JobDetailsWidget extends StatefulWidget {
  const JobDetailsWidget({super.key});

  @override
  State<JobDetailsWidget> createState() => _JobDetailsWidgetState();
}

class _JobDetailsWidgetState extends State<JobDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            const CustomAppbar(
              title: "Job Details",
              centerTitle: true,
            ),
            2.height,
            CustomContainer(
                child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "JOB-2003",
                        style: Textfontstyle.TextStyle14w400c212121poppins
                            .copyWith(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp),
                      ),
                      2.width,
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.green,
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(AppSvgs.minivan),
                            1.width,
                            Text(
                              "Completed",
                              style: Textfontstyle.TextStyle12w500c212121poppins
                                  .copyWith(color: AppColors.boxColor),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  .5.height,
                  Row(
                    children: [
                      Text("Created December 13, 2025 from ",
                          style: Textfontstyle.TextStyle12w500c212121poppins
                              .copyWith(
                            color: AppColors.midDarkGrey,
                            fontSize: 10.sp,
                          )),
                      Text("ORD-12956",
                          style: Textfontstyle.TextStyle12w500c212121poppins
                              .copyWith(
                            color: AppColors.red,
                            fontSize: 10.sp,
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      
                    ],
                  ) 
                ],
              ),
            ))
          ],
        ),
      )),
    );
  }
}
