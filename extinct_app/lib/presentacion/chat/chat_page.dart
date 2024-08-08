import 'package:extinct_app/application/gemini_api_helper.dart';
import 'package:extinct_app/domain/animal/animal.dart';
import 'package:extinct_app/presentacion/chat/chat_view.dart';
import 'package:extinct_app/presentacion/widgets/app_bar_leading_button/app_bar_leading_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ChatPage extends StatefulWidget {
  final Animal animal;
  const ChatPage({super.key, required this.animal});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final GeminiApiHelper _geminiApiHelper = GeminiApiHelper();
  final TextEditingController _inputController = TextEditingController();
  final List<Content> _chatHistory =
      []; // Lista para almacenar el historial del chat

  @override
  void initState() {
    super.initState();
    _geminiApiHelper.init(widget.animal);
    _geminiApiHelper.startChat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBarLeadingButton(
          icon: Icons.arrow_upward,
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.animal.name.toUpperCase(),
              style: GoogleFonts.merriweather(
                  fontWeight: FontWeight.w900,
                  textStyle: Theme.of(context).textTheme.headlineSmall),
            ),
            Text(
              'Extinct at ${widget.animal.extinctYear}',
              style: GoogleFonts.montserrat(
                  textStyle: Theme.of(context).textTheme.bodySmall),
            ),
          ],
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ChatView(
                  chatHistory: _chatHistory), // Mostrar el historial del chat
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _inputController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        hintText: 'Type here...',
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  FloatingActionButton(
                    child: const Icon(Icons.send),
                    onPressed: () {
                      _sendMessage();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _sendMessage() async {
    try {
      if (_inputController.text.isEmpty) {
        print('Message cannot be empty.');
        return;
      }

      final response = await _geminiApiHelper
          .sendMenssage(Content.text(_inputController.text));

      print('>>>>>>> ${response.text}');
    } catch (e) {
      print('Error sending message: $e');
    }
  }
}
