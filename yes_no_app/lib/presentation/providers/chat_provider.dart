import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [
    const Message(text: 'Hola Laura!', fromWho: FromWho.me),
    const Message(
        text: 'Como has estado, donde te presentaras?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    messageList.add(Message(text: text, fromWho: FromWho.me));
    notifyListeners();
  }
}
