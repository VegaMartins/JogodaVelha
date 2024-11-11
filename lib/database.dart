import 'package:drift/drift.dart';
import 'package:drift/native.dart';

part 'database.g.dart';

@DataClassName('Game')
class Games extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get playerX => text().withLength(min: 1, max: 50)();
  TextColumn get playerO => text().withLength(min: 1, max: 50)();
  TextColumn get winner => text().nullable()(); 
  DateTimeColumn get date => dateTime().withDefault(Constant(DateTime.now()))();
}

@DriftDatabase(tables: [Games])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(NativeDatabase.memory());

  @override
  int get schemaVersion => 1;

 Future<int> addGame(GamesCompanion game) => into(games).insert(game);

  Future<List<Game>> getAllGames() => select(games).get();
}
