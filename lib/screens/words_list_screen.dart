import 'package:dictionary_app/screens/word_meaning_screen.dart';
import 'package:dictionary_app/utils/colors.dart';
import 'package:flutter/material.dart';

import '../models/word_response.dart';

class WordsListScreen extends StatelessWidget {
  final List<WordResponse>? words;

  const WordsListScreen(this.words, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor,
        title: const Text(
          "List of Words",
          style: TextStyle(color: secondaryColor),
        ),
      ),
      backgroundColor: Colors.blueGrey[900],
      body: ListView.separated(
        itemBuilder: (context, index) => ListTile(
          title: Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: secondaryColor,
            ),
            child: Text(
              "${index + 1}. ${words![index].word}",
              style: const TextStyle(color: Colors.white),
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WordMeaningScreen(words![index]),
              ),
            );
          },
        ),
        separatorBuilder: (context, index) => const Divider(
          color: Colors.grey,
        ),
        itemCount: words!.length,
      ),
    );
  }
}
