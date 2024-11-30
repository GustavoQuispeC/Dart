import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    final textController =
        TextEditingController(); //!Para manejar el texto del campo de texto

    final colors =
        Theme.of(context).colorScheme; //!Para obtener los colores del tema

    final focusNode = FocusNode(); //!Para manejar el foco del campo de texto

//!Para darle estilo al campo de texto
    final outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(color: colors.primary),
      borderRadius: BorderRadius.circular(20),
    );

//!Para darle estilo al campo de texto
    final inputDecoration = InputDecoration(
      hintText: 'Escribe un mensaje...',
      border: outlineInputBorder,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send),
        onPressed: () {
          final textValue = textController.value.text;
          print('Mensaje enviado: ${textValue}');
          textController.clear();
        },
      ),
    );

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus(); //!Para quitar el foco del campo de texto, ocultando el teclado
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        print('Mensaje enviado: $value');
        textController.clear();
        focusNode.requestFocus(); //!Para que el campo de texto recupere el foco
      },
    );
  }
}
