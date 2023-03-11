import 'package:dictionary_app/bloc/dictionary_cubit.dart';
import 'package:dictionary_app/repo/word_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/homescreen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dictionary App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: BlocProvider(
        create: (context) => DictionaryCubit(WordRepo()),
        child: const HomeScreen(),
      ),
    );
  }
}
