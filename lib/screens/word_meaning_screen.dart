import 'package:dictionary_app/utils/colors.dart';
import 'package:flutter/material.dart';

import '../models/word_response.dart';

class WordMeaningScreen extends StatelessWidget {
  final WordResponse wordResponse;

  const WordMeaningScreen(this.wordResponse, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor,
        title: const Text(
          "Meaning",
          style: TextStyle(color: secondaryColor),
        ),
      ),
      backgroundColor: Colors.blueGrey[900],
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 14, top: 14),
              child: Text(
                wordResponse.word,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 42,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    final meaning = wordResponse.meanings[index];
                    final definations = meaning.definitions;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(8)),
                          child: Text(
                            meaning.partOfSpeech,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        ListView.separated(
                          itemBuilder: (context, index) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Defination : ${definations[index].definition}",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                "Sentence  : ${definations[index].example}",
                                style: const TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 8,
                          ),
                          itemCount: definations.length,
                          shrinkWrap: true,
                        )
                      ],
                    );
                  },
                  itemCount: wordResponse.meanings.length,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 32,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
