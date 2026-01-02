
import 'package:nanduba/export.dart';
import 'package:nanduba/views/inbox/chat_screen/component/message_textfield.dart';
import 'package:nanduba/views/inbox/chat_screen/component/messages_list.dart';
import 'package:nanduba/views/inbox/chat_screen/component/warning_dialog_box.dart';


class ChatScreenMain extends StatefulWidget {
  @override
  State<ChatScreenMain> createState() => _ChatScreenMainState();
}

class _ChatScreenMainState extends State<ChatScreenMain> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((val){
      showWarningDialog(context);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Padding(
          padding:EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              2.height,
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 6.h,
                      width: 6.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(15.w),
                      ),
                      child: const Center(
                        child: Icon(Icons.arrow_back_ios_new_rounded),
                      ),
                    ),
                  ),
                  2.width,
                  CircleAvatar(
                    radius: 3.h,
                    foregroundImage: const AssetImage(AppImages.girl1),
                  ),
                  1.width,
                  Expanded(
                    child: Text(
                      "Anika Philips",
                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontSize: 14.sp,
                      ),
                    ),
                  ),

                ],
              ),
              2.height,
              Divider(color: AppColors.secondaryborder,),
              1.height,
              MessagesList(),
              MessageTextfield(),
              2.height,


            ],
          ),
        ),
      ),
    );
  }
}










