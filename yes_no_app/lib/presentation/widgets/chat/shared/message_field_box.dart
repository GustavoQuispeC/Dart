import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;
  const MessageFieldBox({
    super.key,
    required this.onValue,
  });

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
          onValue(textValue); //!Para enviar el mensaje
          textController.clear();
          focusNode.requestFocus(); //! Volver a enfocar el campo de texto
        },
      ),
    );

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        textController.clear();
        focusNode.requestFocus();
        onValue(value);
      },
    );
  }
}
