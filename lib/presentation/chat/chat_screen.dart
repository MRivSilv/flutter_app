import 'package:flutter/material.dart';
import 'package:primera_app/domain/entities/message.dart';
import 'package:primera_app/presentation/chat/providers/chat_provider.dart';
import 'package:primera_app/presentation/chat/widgets/chat/my_messages_bubble.dart';
import 'package:primera_app/presentation/chat/widgets/chat/other_messages_bubble.dart';
import 'package:primera_app/presentation/chat/widgets/chat/shared/message_field_box.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar (
            backgroundImage: NetworkImage('https://www.radiosport.cl/web/wp-content/uploads/2024/02/Lucas-Cepeda-CCcl-Edit-2.jpg')
          ),
        ),
        title: const Text('Lucas Cepeda'),
        centerTitle: true,
      ),
      body: (
        _ChatView()
      )
      );
  }
}

class _ChatView extends StatelessWidget{
  const _ChatView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(child: ListView.builder(
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messageList.length,
              itemBuilder: (context, index){

                final message = chatProvider.messageList[index];

                return (message.fromWho == FromWho.others)
                ? OtherMessageBubble()
                : MyMessageBubble(message: message);
              }
            )
            ),
            MessageFieldBox(onValue: (value) => chatProvider.sendMessage(value),
            ),
        ],
        ),
        ),
      );
    }
}