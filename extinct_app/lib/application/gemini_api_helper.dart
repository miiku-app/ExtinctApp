import 'package:extinct_app/application/animals_system_instruction.dart';
import 'package:extinct_app/domain/animal/animal.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

const apiKey = 'AIzaSyCTkH2NnpHsY8lHl68Dk0CCvLIeL0POZ9Q';

class GeminiApiHelper {
  GenerativeModel? model;
  ChatSession? chatSession;

  Iterable<Content>? get chatHistory => null;

  void init(Animal animal) {
    model ??= GenerativeModel(
      model: "gemini-1.5-pro",
      apiKey: apiKey,
      systemInstruction: AnimalsSystemInstruction
          .dodo(), // generar Prompt dependiendo del animal
    );
  }

  void startChat([List<Content>? history]) {
    chatSession ??= model!.startChat(history: history);
  }

  Future<GenerateContentResponse> sendMenssage(Content message) async {
    return await chatSession!.sendMessage(message);
  }
}
