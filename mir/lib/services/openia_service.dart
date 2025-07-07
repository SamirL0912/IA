import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String _apiKey = "sk-a4ecbb226e9c482ea890fd2f70c5671e"; // 🔑

  Future<String> sendMessage(String message) async {
    const endpoint = "https://api.deepseek.com/v1/chat/completions";

    final response = await http.post(
      Uri.parse(endpoint),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $_apiKey",
      },
      body: jsonEncode({
        "model": "deepseek-chat",
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
