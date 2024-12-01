import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> message = [
    const Message(text: 'Hola Laura!', fromWho: FromWho.me),
    const Message(
        text: 'Como has estado, donde te presentaras?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    message.add(Message(text: text, fromWho: FromWho.me));
    notifyListeners();
  }
}
