import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'namer app/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
    var favorites = <WordPair>{};
  bool isFavourite = false;

  void getNext() {
    isFavourite = false;
    current = WordPair.random();
    checkIfFavourite(current);
    notifyListeners();
  }

  void checkIfFavourite(WordPair word){
    if(favorites.contains(word)){
    isFavourite = true;
    notifyListeners();
    print(isFavourite);
    }
  }

  void toggleFavorite(WordPair current) {
    if (favorites.contains(current)) {
      favorites.remove(current);
      isFavourite = false;
    } else {
      favorites.add(current);
      isFavourite = true;
    }
    notifyListeners();
  }
}





