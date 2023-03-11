import 'dart:convert';

List<WordResponse> wordResponseFromJson(String str) => List<WordResponse>.from(
    json.decode(str).map((x) => WordResponse.fromJson(x)));

String wordResponseToJson(List<WordResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WordResponse {
  WordResponse({
    required this.word,
    required this.phonetic,
    required this.phonetics,
    required this.meanings,
    required this.license,
    required this.sourceUrls,
  });

  String word;
  String phonetic;
  List<Phonetic> phonetics;
  List<Meaning> meanings;
  License license;
  List<String> sourceUrls;

  factory WordResponse.fromJson(Map<String, dynamic> json) => WordResponse(
        word: json["word"] ?? "",
        phonetic: json["phonetic"] ?? "",
        phonetics: List<Phonetic>.from(
            json["phonetics"].map((x) => Phonetic.fromJson(x))),
        meanings: List<Meaning>.from(
            json["meanings"].map((x) => Meaning.fromJson(x))),
        license: License.fromJson(json["license"]),
        sourceUrls: List<String>.from(json["sourceUrls"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "word": word,
        "phonetic": phonetic,
        "phonetics": List<dynamic>.from(phonetics.map((x) => x.toJson())),
        "meanings": List<dynamic>.from(meanings.map((x) => x.toJson())),
        "license": license.toJson(),
        "sourceUrls": List<dynamic>.from(sourceUrls.map((x) => x)),
      };
}

class License {
  License({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory License.fromJson(Map<String, dynamic> json) => License(
        name: json["name"] ?? "",
        url: json["url"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

class Meaning {
  Meaning({
    required this.partOfSpeech,
    required this.definitions,
    required this.synonyms,
    required this.antonyms,
  });

  String partOfSpeech;
  List<Definition> definitions;
  List<dynamic> synonyms;
  List<dynamic> antonyms;

  factory Meaning.fromJson(Map<String, dynamic> json) => Meaning(
        partOfSpeech: json["partOfSpeech"] ?? "",
        definitions: List<Definition>.from(
            json["definitions"].map((x) => Definition.fromJson(x))),
        synonyms: List<dynamic>.from(json["synonyms"].map((x) => x)),
        antonyms: List<dynamic>.from(json["antonyms"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "partOfSpeech": partOfSpeech,
        "definitions": List<dynamic>.from(definitions.map((x) => x.toJson())),
        "synonyms": List<dynamic>.from(synonyms.map((x) => x)),
        "antonyms": List<dynamic>.from(antonyms.map((x) => x)),
      };
}

class Definition {
  Definition({
    required this.definition,
    required this.synonyms,
    required this.antonyms,
    required this.example,
  });

  String definition;
  List<dynamic> synonyms;
  List<dynamic> antonyms;
  String example;

  factory Definition.fromJson(Map<String, dynamic> json) => Definition(
        definition: json["definition"] ?? "",
        synonyms: List<dynamic>.from(json["synonyms"].map((x) => x)),
        antonyms: List<dynamic>.from(json["antonyms"].map((x) => x)),
        example: json["example"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "definition": definition,
        "synonyms": List<dynamic>.from(synonyms.map((x) => x)),
        "antonyms": List<dynamic>.from(antonyms.map((x) => x)),
        "example": example,
      };
}

class Phonetic {
  Phonetic({
    required this.text,
    required this.audio,
    required this.sourceUrl,
    required this.license,
  });

  String text;
  String audio;
  String sourceUrl;
  License license;

  factory Phonetic.fromJson(Map<String, dynamic> json) => Phonetic(
        text: json["text"] ?? "",
        audio: json["audio"] ?? "",
        sourceUrl: json["sourceUrl"] ?? "",
        license: json["license"] == null
            ? License(name: "", url: "")
            : License.fromJson(json["license"]),
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "audio": audio,
        "sourceUrl": sourceUrl,
        "license": license.toJson(),
      };
}
