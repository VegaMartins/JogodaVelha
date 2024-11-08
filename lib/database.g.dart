// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $GamesTable extends Games with TableInfo<$GamesTable, Game> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GamesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _playerXMeta =
      const VerificationMeta('playerX');
  @override
  late final GeneratedColumn<String> playerX = GeneratedColumn<String>(
      'player_x', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _playerOMeta =
      const VerificationMeta('playerO');
  @override
  late final GeneratedColumn<String> playerO = GeneratedColumn<String>(
      'player_o', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _winnerMeta = const VerificationMeta('winner');
  @override
  late final GeneratedColumn<String> winner = GeneratedColumn<String>(
      'winner', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now()));
  @override
  List<GeneratedColumn> get $columns => [id, playerX, playerO, winner, date];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'games';
  @override
  VerificationContext validateIntegrity(Insertable<Game> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('player_x')) {
      context.handle(_playerXMeta,
          playerX.isAcceptableOrUnknown(data['player_x']!, _playerXMeta));
    } else if (isInserting) {
      context.missing(_playerXMeta);
    }
    if (data.containsKey('player_o')) {
      context.handle(_playerOMeta,
          playerO.isAcceptableOrUnknown(data['player_o']!, _playerOMeta));
    } else if (isInserting) {
      context.missing(_playerOMeta);
    }
    if (data.containsKey('winner')) {
      context.handle(_winnerMeta,
          winner.isAcceptableOrUnknown(data['winner']!, _winnerMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Game map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Game(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      playerX: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}player_x'])!,
      playerO: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}player_o'])!,
      winner: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}winner']),
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
    );
  }

  @override
  $GamesTable createAlias(String alias) {
    return $GamesTable(attachedDatabase, alias);
  }
}

class Game extends DataClass implements Insertable<Game> {
  final int id;
  final String playerX;
  final String playerO;
  final String? winner;
  final DateTime date;
  const Game(
      {required this.id,
      required this.playerX,
      required this.playerO,
      this.winner,
      required this.date});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['player_x'] = Variable<String>(playerX);
    map['player_o'] = Variable<String>(playerO);
    if (!nullToAbsent || winner != null) {
      map['winner'] = Variable<String>(winner);
    }
    map['date'] = Variable<DateTime>(date);
    return map;
  }

  GamesCompanion toCompanion(bool nullToAbsent) {
    return GamesCompanion(
      id: Value(id),
      playerX: Value(playerX),
      playerO: Value(playerO),
      winner:
          winner == null && nullToAbsent ? const Value.absent() : Value(winner),
      date: Value(date),
    );
  }

  factory Game.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Game(
      id: serializer.fromJson<int>(json['id']),
      playerX: serializer.fromJson<String>(json['playerX']),
      playerO: serializer.fromJson<String>(json['playerO']),
      winner: serializer.fromJson<String?>(json['winner']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'playerX': serializer.toJson<String>(playerX),
      'playerO': serializer.toJson<String>(playerO),
      'winner': serializer.toJson<String?>(winner),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  Game copyWith(
          {int? id,
          String? playerX,
          String? playerO,
          Value<String?> winner = const Value.absent(),
          DateTime? date}) =>
      Game(
        id: id ?? this.id,
        playerX: playerX ?? this.playerX,
        playerO: playerO ?? this.playerO,
        winner: winner.present ? winner.value : this.winner,
        date: date ?? this.date,
      );
  Game copyWithCompanion(GamesCompanion data) {
    return Game(
      id: data.id.present ? data.id.value : this.id,
      playerX: data.playerX.present ? data.playerX.value : this.playerX,
      playerO: data.playerO.present ? data.playerO.value : this.playerO,
      winner: data.winner.present ? data.winner.value : this.winner,
      date: data.date.present ? data.date.value : this.date,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Game(')
          ..write('id: $id, ')
          ..write('playerX: $playerX, ')
          ..write('playerO: $playerO, ')
          ..write('winner: $winner, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, playerX, playerO, winner, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Game &&
          other.id == this.id &&
          other.playerX == this.playerX &&
          other.playerO == this.playerO &&
          other.winner == this.winner &&
          other.date == this.date);
}

class GamesCompanion extends UpdateCompanion<Game> {
  final Value<int> id;
  final Value<String> playerX;
  final Value<String> playerO;
  final Value<String?> winner;
  final Value<DateTime> date;
  const GamesCompanion({
    this.id = const Value.absent(),
    this.playerX = const Value.absent(),
    this.playerO = const Value.absent(),
    this.winner = const Value.absent(),
    this.date = const Value.absent(),
  });
  GamesCompanion.insert({
    this.id = const Value.absent(),
    required String playerX,
    required String playerO,
    this.winner = const Value.absent(),
    this.date = const Value.absent(),
  })  : playerX = Value(playerX),
        playerO = Value(playerO);
  static Insertable<Game> custom({
    Expression<int>? id,
    Expression<String>? playerX,
    Expression<String>? playerO,
    Expression<String>? winner,
    Expression<DateTime>? date,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (playerX != null) 'player_x': playerX,
      if (playerO != null) 'player_o': playerO,
      if (winner != null) 'winner': winner,
      if (date != null) 'date': date,
    });
  }

  GamesCompanion copyWith(
      {Value<int>? id,
      Value<String>? playerX,
      Value<String>? playerO,
      Value<String?>? winner,
      Value<DateTime>? date}) {
    return GamesCompanion(
      id: id ?? this.id,
      playerX: playerX ?? this.playerX,
      playerO: playerO ?? this.playerO,
      winner: winner ?? this.winner,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (playerX.present) {
      map['player_x'] = Variable<String>(playerX.value);
    }
    if (playerO.present) {
      map['player_o'] = Variable<String>(playerO.value);
    }
    if (winner.present) {
      map['winner'] = Variable<String>(winner.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GamesCompanion(')
          ..write('id: $id, ')
          ..write('playerX: $playerX, ')
          ..write('playerO: $playerO, ')
          ..write('winner: $winner, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $GamesTable games = $GamesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [games];
}

typedef $$GamesTableCreateCompanionBuilder = GamesCompanion Function({
  Value<int> id,
  required String playerX,
  required String playerO,
  Value<String?> winner,
  Value<DateTime> date,
});
typedef $$GamesTableUpdateCompanionBuilder = GamesCompanion Function({
  Value<int> id,
  Value<String> playerX,
  Value<String> playerO,
  Value<String?> winner,
  Value<DateTime> date,
});

class $$GamesTableFilterComposer extends Composer<_$AppDatabase, $GamesTable> {
  $$GamesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get playerX => $composableBuilder(
      column: $table.playerX, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get playerO => $composableBuilder(
      column: $table.playerO, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get winner => $composableBuilder(
      column: $table.winner, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));
}

class $$GamesTableOrderingComposer
    extends Composer<_$AppDatabase, $GamesTable> {
  $$GamesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get playerX => $composableBuilder(
      column: $table.playerX, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get playerO => $composableBuilder(
      column: $table.playerO, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get winner => $composableBuilder(
      column: $table.winner, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));
}

class $$GamesTableAnnotationComposer
    extends Composer<_$AppDatabase, $GamesTable> {
  $$GamesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get playerX =>
      $composableBuilder(column: $table.playerX, builder: (column) => column);

  GeneratedColumn<String> get playerO =>
      $composableBuilder(column: $table.playerO, builder: (column) => column);

  GeneratedColumn<String> get winner =>
      $composableBuilder(column: $table.winner, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);
}

class $$GamesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $GamesTable,
    Game,
    $$GamesTableFilterComposer,
    $$GamesTableOrderingComposer,
    $$GamesTableAnnotationComposer,
    $$GamesTableCreateCompanionBuilder,
    $$GamesTableUpdateCompanionBuilder,
    (Game, BaseReferences<_$AppDatabase, $GamesTable, Game>),
    Game,
    PrefetchHooks Function()> {
  $$GamesTableTableManager(_$AppDatabase db, $GamesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GamesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GamesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GamesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> playerX = const Value.absent(),
            Value<String> playerO = const Value.absent(),
            Value<String?> winner = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
          }) =>
              GamesCompanion(
            id: id,
            playerX: playerX,
            playerO: playerO,
            winner: winner,
            date: date,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String playerX,
            required String playerO,
            Value<String?> winner = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
          }) =>
              GamesCompanion.insert(
            id: id,
            playerX: playerX,
            playerO: playerO,
            winner: winner,
            date: date,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$GamesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $GamesTable,
    Game,
    $$GamesTableFilterComposer,
    $$GamesTableOrderingComposer,
    $$GamesTableAnnotationComposer,
    $$GamesTableCreateCompanionBuilder,
    $$GamesTableUpdateCompanionBuilder,
    (Game, BaseReferences<_$AppDatabase, $GamesTable, Game>),
    Game,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$GamesTableTableManager get games =>
      $$GamesTableTableManager(_db, _db.games);
}
