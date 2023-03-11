import 'package:dictionary_app/models/word_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../repo/word_repo.dart';

class DictionaryCubit extends Cubit<DictionaryState> {
  final WordRepo _repo;
  DictionaryCubit(this._repo) : super(InitialState());

  searchAgain() {
    emit(InitialState());
  }

  Future getMeaning(String word) async {
    emit(SearchingState());
    try {
      final meaning = await _repo.getWordMeaning(word);
      if (meaning == null) {
        emit(
          ErrorState(message: "No Words Found"),
        );
      } else {
        emit(
          GotMeaningState(meaning),
        );
        emit(
          InitialState(),
        );
      }
    } on Exception catch (e) {
      emit(ErrorState(
        message: e.toString(),
      ));

      emit(
        InitialState(),
      );
    }
  }
}

abstract class DictionaryState {}

class InitialState extends DictionaryState {}

class SearchingState extends DictionaryState {}

class GotMeaningState extends DictionaryState {
  final List<WordResponse>? words;

  GotMeaningState(this.words);
}

class ErrorState extends DictionaryState {
  final String message;

  ErrorState({required this.message});
}
