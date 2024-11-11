import 'package:flutter/material.dart';
import 'database.dart';
import 'game_screen.dart';
import 'history_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppDatabase database = AppDatabase();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jogo da Velha',
      theme: ThemeData.dark(),
      home: TicTacToeGame(database: database),
      routes: {
        '/historico': (context) => HistoryScreen(database: database),
      },
    );
  }
}
