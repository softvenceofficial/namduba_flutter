import 'package:nanduba/export.dart';

class NoMessageBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 5.w, ),
      height: 68.h,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.w),
          boxShadow: [
            BoxShadow(color: AppColors.shadow.withOpacity(0.2),blurRadius: 20,offset: Offset(0, 2))
          ]
      ),
      child: Column(
        children: [
          12.height,
          SizedBox(
              width: 70.w,
              child: Image.asset(AppImages.chat)),
          3.height,
          Text("You don’t have any messages",style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: AppColors.black,
            fontWeight: FontWeight.w600,
          fontSize: 13.sp
          ),
            textAlign: TextAlign.center,
          ),
          1.height,
          Text("When you receive a new message, It\nwill appear here.",style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: AppColors.grey,
            fontWeight: FontWeight.w500,
            fontSize: 10.sp
          ),
            textAlign: TextAlign.center,
          ),



        ],
      ),
    );
  }
}
