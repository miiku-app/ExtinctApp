import 'package:extinct_app/presentacion/chat/chat_model_message.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ChatView extends StatelessWidget {
  final Iterable<Content>? chatHistory;

  const ChatView({
    super.key,
    this.chatHistory,
  });

  @override
  Widget build(BuildContext context) {
    if (chatHistory == null) {
      return const SizedBox();
    }

    final contentList = chatHistory!.toList();
    return ListView.builder(
      itemCount: contentList.length,
      itemBuilder: (context, i) {
        final content = contentList[i];

        if (content.parts.isEmpty) {
          return const SizedBox();
        }

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ChatMessage(content: content),
        );
      },
    );
  }
}
