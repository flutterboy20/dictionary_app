import 'package:dictionary_app/bloc/dictionary_cubit.dart';
import 'package:dictionary_app/screens/words_list_screen.dart';
import 'package:dictionary_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<DictionaryCubit>();
    return SafeArea(
      child: BlocListener<DictionaryCubit, DictionaryState>(
        listener: (context, state) {
          if (state is GotMeaningState && state.words != null) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => WordsListScreen(state.words),
              ),
            );
          } else {
            ErrorWidget(cubit: cubit);
          }
        },
        child: Scaffold(
          backgroundColor: primaryColor,
          body: cubit.state is InitialState
              ? dictionaryWidget(context)
              : cubit.state is SearchingState
                  ? loadingWidget()
                  : cubit.state is ErrorState
                      ? ErrorWidget(cubit: cubit)
                      : Container(),
        ),
      ),
    );
  }

  dictionaryWidget(BuildContext context) {
    final cubit = context.watch<DictionaryCubit>();
    TextEditingController wordController = TextEditingController();
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "English Dictionary",
            style: TextStyle(
              color: Colors.white,
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const Text(
            "Enter the word to know the meaning of it!!!",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          TextField(
            controller: wordController,
            decoration: InputDecoration(
              hintText: "Search any word",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
              fillColor: Colors.grey[100],
              filled: true,
              prefixIcon: const Icon(
                Icons.search,
                color: primaryColor,
                size: 32,
              ),
              hintStyle: const TextStyle(color: primaryColor),
            ),
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                cubit.getMeaning(wordController.text);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: secondaryColor,
                  padding: const EdgeInsets.all(16)),
              child: const Text("SEARCH"),
            ),
          ),
        ],
      ),
    );
  }

  loadingWidget() {
    return const Center(child: CircularProgressIndicator());
  }
}

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({
    super.key,
    required this.cubit,
  });

  final DictionaryCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Something went wrong",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          GestureDetector(
            onTap: () {
              cubit.searchAgain();
            },
            child: Container(
              height: 30,
              width: 150,
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                  child: Text(
                "Search Again!",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              )),
            ),
          )
        ],
      ),
    );
  }
}
