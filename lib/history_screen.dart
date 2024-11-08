import 'package:flutter/material.dart';
import 'database.dart';

class HistoryScreen extends StatelessWidget {
  final AppDatabase database;

  const HistoryScreen({Key? key, required this.database}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Histórico de Partidas',
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)),
      body: FutureBuilder<List<Game>>(
        future: database.getAllGames(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final games = snapshot.data!;
          return ListView.builder(
            itemCount: games.length,
            itemBuilder: (context, index) {
              final game = games[index];
              return ListTile(
                title: Text('Vencedor: ${game.winner ?? 'Empate'}'),
                subtitle: Text('Data: ${game.date.toLocal()}'),
              );
            },
          );
        },
      ),
    );
  }
}
