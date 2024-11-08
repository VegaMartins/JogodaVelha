import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift;

import 'database.dart';

class TicTacToeGame extends StatefulWidget {
  final AppDatabase database;

  const TicTacToeGame({Key? key, required this.database}) : super(key: key);

  @override
  _TicTacToeGameState createState() => _TicTacToeGameState();
}

class _TicTacToeGameState extends State<TicTacToeGame> {
  List<String> board = List.filled(9, '');
  String currentPlayer = 'X';
  String winner = '';
  bool gameEnded = false;

  void _handleTap(int index) {
    if (board[index] == '' && !gameEnded) {
      setState(() {
        board[index] = currentPlayer;
        if (_checkWinner(currentPlayer)) {
          winner = currentPlayer;
          gameEnded = true;
          _saveGame(winner);
        } else if (!board.contains('')) {
          winner = 'Empate';
          gameEnded = true;
          _saveGame(winner);
        } else {
          currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
        }
      });
    }
  }

  bool _checkWinner(String player) {
    List<List<int>> winningCombinations = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];
    for (var combo in winningCombinations) {
      if (board[combo[0]] == player &&
          board[combo[1]] == player &&
          board[combo[2]] == player) {
        return true;
      }
    }
    return false;
  }

  void _saveGame(String winner) {
    final game = GamesCompanion(
      playerX: drift.Value('Jogador X'),
      playerO: drift.Value('Jogador O'),
      winner: drift.Value(winner),
      date: drift.Value(DateTime.now()),
    );
    widget.database.addGame(game);
  }

  void _resetGame() {
    setState(() {
      board = List.filled(9, '');
      currentPlayer = 'X';
      winner = '';
      gameEnded = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jogo da Velha'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            gameEnded ? 'Vencedor: $winner' : "Jogador $currentPlayer",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
            ),
            itemCount: 9,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => _handleTap(index),
                child: Container(
                  color: Colors.blueAccent,
                  child: Center(
                    child: Text(
                      board[index],
                      style: const TextStyle(
                        fontSize: 36,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _resetGame,
            child: const Text('Reiniciar'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // Navega para a tela de histórico de partidas
              Navigator.pushNamed(context, '/historico');
            },
            child: const Text('Histórico'),
          ),
        ],
      ),
    );
  }
}
