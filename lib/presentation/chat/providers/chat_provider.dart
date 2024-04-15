import 'package:flutter/material.dart';
import 'package:primera_app/domain/entities/message.dart';

class ChatProviver extends ChangeNotifier{
  List<Message> messageList = [
    Message(text: 'Hola !', fromWho: FromWho.me),
    Message(text: 'Ya LLegaste?', fromWho: FromWho.me)
  ];

  Future<void> sendMessage(String text) async{
    
  }
}