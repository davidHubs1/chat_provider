import 'package:flutter/material.dart';

class TextFormFieldBubble extends StatelessWidget {
  final ValueChanged<String> onValue;
  const TextFormFieldBubble({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final focusNode = FocusNode();
    final textController = TextEditingController();
    final outlineInputBorder = UnderlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(
        color: Colors.transparent,
      ),
    );
    final inputDecoration = InputDecoration(
      hintText: 'End Your Message in "?"',
      hintStyle: const TextStyle(
        color: Color.fromRGBO(33, 33, 33, 0.4),
      ),
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      suffixIcon: IconButton(
        onPressed: () {
          final textValue = textController.value.text;
          onValue(textValue);
          textController.clear();
        },
        icon: const Icon(Icons.send),
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
        onValue(value);
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}
