import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    const Message(text: 'Hola Laura!', fromWho: FromWho.me),
    const Message(
        text: 'Como has estado, donde te presentaras?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    await Future.delayed(const Duration(milliseconds: 100));
    if (text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    if (text.endsWith('?')) {
      await herReply();
    }

    notifyListeners(); //!Notifica a los widgets que escuchan este provider
    scrollToBottom(); //!Hace scroll hasta el final
  }

//!Para obtener la respuesta de Laura
  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    messageList.add(herMessage);
    notifyListeners();
    scrollToBottom();
  }

  void scrollToBottom() {
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
