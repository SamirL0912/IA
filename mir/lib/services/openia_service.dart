import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String _apiKey =
      "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"; // cambia por la tuya

  Future<String> sendMessage(String message) async {
    const endpoint = "https://api.openai.com/v1/chat/completions";

    final response = await http.post(
      Uri.parse(endpoint),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $_apiKey",
      },
      body: jsonEncode({
        "model": "gpt-4o", // o el modelo que tengas disponible
        "messages": [
          {"role": "user", "content": message},
        ],
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final aiReply = data["choices"][0]["message"]["content"];
      return aiReply.trim();
    } else {
      throw Exception("Error al llamar a OpenAI: ${response.body}");
    }
  }
}
