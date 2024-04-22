import 'package:flutter/material.dart';
import 'package:primera_app/config/helpers/get_yesno_answer.dart';
import 'package:primera_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier{

  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    Message(text: 'Hola !', fromWho: FromWho.me),
    Message(text: 'Ya LLegaste?', fromWho: FromWho.me)
  ];

  Future<void> sendMessage(String text) async{
    if (text.isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    if (text.endsWith('?')){
      otherReply();
    }

    notifyListeners();
    moveScrollTobottom();
  }
  Future<void> moveScrollTobottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut
    );
  }

  Future<void> otherReply() async{
    final otherMessage = await getYesNoAnswer.getAnswer();
    messageList.add(otherMessage);
    notifyListeners();
    moveScrollTobottom();
  }
}