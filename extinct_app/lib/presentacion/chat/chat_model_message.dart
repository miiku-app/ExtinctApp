import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:google_generative_ai/src/content.dart';

class ChatMessage extends StatelessWidget {
  final Content content;

  const ChatMessage({super.key, required this.content});

  bool isFromModel() => content.role == 'model';

  @override
  Widget build(BuildContext context) {
    final message = (content.parts.first as TextPart).text;
    return Row(
      mainAxisAlignment:
          isFromModel() ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.width * 0.7),
          decoration: BoxDecoration(
            color: isFromModel()
                ? Theme.of(context).colorScheme.tertiaryContainer
                : Theme.of(context).colorScheme.surfaceContainer,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text(
            message,
            textAlign: isFromModel() ? TextAlign.left : TextAlign.right,
          ),
        )
      ],
    );
  }
}
