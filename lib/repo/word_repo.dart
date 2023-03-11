import '../models/word_response.dart';
import '../service/http_service.dart';

class WordRepo {
  Future<List<WordResponse>?> getWordMeaning(String word) async {
    try {
      final response = await HttpService.getMeaning(word);
      if (response.statusCode == 200) {
        final result = wordResponseFromJson(response.body);
        return result;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
