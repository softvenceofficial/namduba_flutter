
import '../export.dart';

class ChatProvider with ChangeNotifier{
  List<Map<String,dynamic>> _messages=[
    {
      "message":"Hi, are there any openings on Monday at all?",
      "time":"04:50 PM",
      "role": "me"
    },
    {
      "message":"Hi, are there any openings on Monday at all?",
      "time":"04:50 PM",
      "role": "other"
    },
    {
      "message":"Hi, are there any openings on Monday at all?",
      "time":"04:50 PM",
      "role": "other"
    },

    {
      "message":"Hi, are there any openings on Monday at all?",
      "time":"04:50 PM",
      "role": "me"
    },

  ];
  final ScrollController _scrollController = ScrollController();

  List<Map<String, dynamic>> get messages => _messages;
  ScrollController get scrollController => _scrollController;


  void sendMessage(TextEditingController messageController) {
    _messages.add({
      'message':messageController.text,
      'time':"12:58 PM",
      'role':'me'
    });
    messageController.clear();
    notifyListeners();
    scrollToEnd();
  }

  void scrollToEnd() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

}