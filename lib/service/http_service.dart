import 'package:http/http.dart' as http;

class HttpService {
  static const baseUrl = "https://api.dictionaryapi.dev/api/v2/entries/en/";

  static Future<http.Response> getMeaning(word) async {
    final url = Uri.parse("$baseUrl$word");
    try {
      final response = await http.get(url);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
