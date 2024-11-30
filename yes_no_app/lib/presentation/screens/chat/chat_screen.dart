import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
            padding: EdgeInsets.all(4.0),
            child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://www.eltelegrafo.com.ec/media/k2/items/cache/49bb9a6f071bd5ac6092b268bc439719_XL.jpg'))),
        title: const Text('Laura Pausini ❤️'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return (index % 2 == 0)
                        ? const HerMessageBubble()
                        : const MyMessageBubble();
                  }),
            ),

            //!Implementando el campo de texto
            const MessageFieldBox(),
            const SizedBox(height: 5.0),
          ],
        ),
      ),
    );
  }
}
