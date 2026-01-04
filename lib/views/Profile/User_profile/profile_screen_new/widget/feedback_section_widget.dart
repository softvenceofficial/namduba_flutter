import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';

class FeedbackSectionWidget extends StatelessWidget {
  const FeedbackSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: CustomContainer(
            borderRadius: 20,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: const AssetImage(AppImages.Person),
                        radius: 5.w,
                      ),
                      2.2.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppText.john,
                            style: Textfontstyle.TextStyle14w500c212121poppins
                                .copyWith(
                              fontSize: 8.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: List.generate(
                              5,
                              (_) => const Icon(
                                Icons.star,
                                color: AppColors.yellow,
                                size: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  1.6.height,
                  Text(
                    AppText.john,
                    style: Textfontstyle.TextStyle14w500c212121poppins.copyWith(
                      color: AppColors.midGrey,
                      fontSize: 8.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
