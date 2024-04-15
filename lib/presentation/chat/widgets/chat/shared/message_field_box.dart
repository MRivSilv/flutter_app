import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override 
  Widget build(BuildContext context) {

    final focusNode = FocusNode();
    final textController = TextEditingController();

    final OutlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40)
    );

    final inputDecoration = InputDecoration(
      hintText: 'Termina el mensaje con "?"',
        enabledBorder: OutlineInputBorder,
        focusedBorder:OutlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send_outlined),
          onPressed: (){
            final textValue = textController.value.text;
            print("buton $textValue");
            textController.clear();
          },
        )
      );

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        print("Enviar Valor $value");
        textController.clear();
        focusNode.requestFocus();
      },
      );
  }
}