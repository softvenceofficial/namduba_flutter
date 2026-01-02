import 'package:nanduba/export.dart';
import 'package:nanduba/providers/chat_provider.dart';

class MessagesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<ChatProvider>(
       builder: (context, provider, child) {
         provider.scrollToEnd();
         return ListView.builder(
          controller: provider.scrollController,
          itemCount: provider.messages.length,
          shrinkWrap: true,
          itemBuilder: (context,index) {
            final message=provider.messages[index];
            final role= message['role'];
            return role=='me'?CurrentUserMessageContainer(message: message)
                :OtherUserMessageContainer(message: message,);
          }
      );
  },
),
    );
  }
}



// For current user who is sender;
class CurrentUserMessageContainer extends StatelessWidget {
 final Map<String,dynamic> message;
  const CurrentUserMessageContainer({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 0.8.h),
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width / 1.6,
                  ),
                  decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(14),topRight: Radius.circular(14),bottomLeft: Radius.circular(14))
                  ),
                  child: Text(message['message'],style: Theme.of(context)!.textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w500
                  ),),
                ),
                0.5.height,
                Text(message['time'],style: Theme.of(context)!.textTheme.bodyMedium!.copyWith(
                    color: AppColors.grey,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400
                ),),
              ],
            ),
            2.width,
            CircleAvatar(
              radius: 2.5.h,
              foregroundImage: const AssetImage(AppImages.boy1),
            ),
          ],
        ),
        3.height,
      ],
    );
  }
}


// For current user who is receiving;
class OtherUserMessageContainer extends StatelessWidget {
 final Map<String,dynamic> message;
  const OtherUserMessageContainer({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 2.5.h,
              foregroundImage: const AssetImage(AppImages.girl1),
            ),
            2.width,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 1.h),
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width / 1.6,
                  ),
                  decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(14),topRight: Radius.circular(14),bottomLeft: Radius.circular(0),bottomRight: Radius.circular(14))
                  ),
                  child: Text(message['message'],style: Theme.of(context)!.textTheme.bodyMedium!.copyWith(
                      color: AppColors.grey,
                      fontWeight: FontWeight.w500
                  ),),
                ),
                0.5.height,
                Text(message['time'],style: Theme.of(context)!.textTheme.bodyMedium!.copyWith(
                    color: AppColors.grey,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400
                ),),
              ],
            ),

          ],
        ),
        3.height,
      ],
    );
  }
}
