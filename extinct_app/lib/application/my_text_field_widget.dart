import 'package:flutter/material.dart';

class MyTextFieldWidget extends StatefulWidget {
  const MyTextFieldWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyTextFieldWidgetState createState() => _MyTextFieldWidgetState();
}

class _MyTextFieldWidgetState extends State<MyTextFieldWidget> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        focusNode: _focusNode,
        controller: _controller,
        decoration: const InputDecoration(
          labelText: 'Type here...',
          border: OutlineInputBorder(),
        ),
        onEditingComplete: () {
          _focusNode
              .unfocus(); // Desenfocar el campo de texto cuando se complete la edición
        },
      ),
    );
  }
}
