import 'package:nanduba/providers/chat_provider.dart';

import '../../../../export.dart';

class MessageTextfield extends StatelessWidget {
  // const MessageTextfield({super.key});
final TextEditingController messageController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    final chatprovider=context.read<ChatProvider>();
    return   Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                boxShadow:
                [
                  const BoxShadow(
                    color: AppColors.shadow,
                    spreadRadius: 2,
                    blurRadius: 10,
                  ),
                ]
            ),
            child: TextField(
              controller: messageController,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Enter your message...',
                hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColors.textColor4,
                ),
                prefixIcon:Container(
                    height: 20,
                    width: 20,
                    alignment: Alignment.center,
                    child: SvgPicture.asset(AppSvgs.smileface)),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(AppSvgs.attachfile),
                    SizedBox(width: 3.w),
                    GestureDetector(
                      onTap: (){
                        if(messageController.text.isNotEmpty){
                        chatprovider.sendMessage(messageController);
                        }
                      },
                      child: Container(
                          height: 5.5.h,
                          width: 11.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(4.w)
                          ),
                          child: SvgPicture.asset(AppSvgs.send)

                      ),
                    ),
                    SizedBox(width: 3.w),

                  ],
                ),
                contentPadding: EdgeInsets.all(15),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14.sp),
                    borderSide: BorderSide.none
                ),
              ),
            ),
          ),
        ),
      ],
    );

  }
}
