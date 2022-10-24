// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  JobDao? _jobDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 2,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Job` (`id` INTEGER NOT NULL, `Name` TEXT NOT NULL, `BaseSalary` REAL NOT NULL, `Amount` INTEGER NOT NULL, `Gender` INTEGER NOT NULL, `Age` TEXT NOT NULL, `EnglishLevel` INTEGER NOT NULL, `Experience` TEXT NOT NULL, `OtherRequirements` TEXT NOT NULL, `icon` TEXT NOT NULL, `CareerId` INTEGER NOT NULL, `areaId` INTEGER NOT NULL, `applyJob` INTEGER, `saveJob` INTEGER, `dataType` TEXT, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  JobDao get jobDao {
    return _jobDaoInstance ??= _$JobDao(database, changeListener);
  }
}

class _$JobDao extends JobDao {
  _$JobDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _jobInsertionAdapter = InsertionAdapter(
            database,
            'Job',
            (Job item) => <String, Object?>{
                  'id': item.id,
                  'Name': item.title,
                  'BaseSalary': item.price,
                  'Amount': item.amount,
                  'Gender': item.gender,
                  'Age': item.age,
                  'EnglishLevel': item.englishLevel,
                  'Experience': item.experience,
                  'OtherRequirements': item.description,
                  'icon': item.icon,
                  'CareerId': item.careerId,
                  'areaId': item.areaId,
                  'applyJob':
                      item.applyJob == null ? null : (item.applyJob! ? 1 : 0),
                  'saveJob':
                      item.saveJob == null ? null : (item.saveJob! ? 1 : 0),
                  'dataType': _dataTypeConverter.encode(item.dataType)
                }),
        _jobUpdateAdapter = UpdateAdapter(
            database,
            'Job',
            ['id'],
            (Job item) => <String, Object?>{
                  'id': item.id,
                  'Name': item.title,
                  'BaseSalary': item.price,
                  'Amount': item.amount,
                  'Gender': item.gender,
                  'Age': item.age,
                  'EnglishLevel': item.englishLevel,
                  'Experience': item.experience,
                  'OtherRequirements': item.description,
                  'icon': item.icon,
                  'CareerId': item.careerId,
                  'areaId': item.areaId,
                  'applyJob':
                      item.applyJob == null ? null : (item.applyJob! ? 1 : 0),
                  'saveJob':
                      item.saveJob == null ? null : (item.saveJob! ? 1 : 0),
                  'dataType': _dataTypeConverter.encode(item.dataType)
                }),
        _jobDeletionAdapter = DeletionAdapter(
            database,
            'Job',
            ['id'],
            (Job item) => <String, Object?>{
                  'id': item.id,
                  'Name': item.title,
                  'BaseSalary': item.price,
                  'Amount': item.amount,
                  'Gender': item.gender,
                  'Age': item.age,
                  'EnglishLevel': item.englishLevel,
                  'Experience': item.experience,
                  'OtherRequirements': item.description,
                  'icon': item.icon,
                  'CareerId': item.careerId,
                  'areaId': item.areaId,
                  'applyJob':
                      item.applyJob == null ? null : (item.applyJob! ? 1 : 0),
                  'saveJob':
                      item.saveJob == null ? null : (item.saveJob! ? 1 : 0),
                  'dataType': _dataTypeConverter.encode(item.dataType)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Job> _jobInsertionAdapter;

  final UpdateAdapter<Job> _jobUpdateAdapter;

  final DeletionAdapter<Job> _jobDeletionAdapter;

  @override
  Future<List<Job>> getListJobApply(bool checkApply) async {
    return _queryAdapter.queryList('select * from Job where applyJob = ?1',
        mapper: (Map<String, Object?> row) => Job(
            row['id'] as int,
            row['Name'] as String,
            row['BaseSalary'] as double,
            row['Amount'] as int,
            row['Gender'] as int,
            row['Age'] as String,
            row['EnglishLevel'] as int,
            row['Experience'] as String,
            row['OtherRequirements'] as String,
            row['icon'] as String,
            row['CareerId'] as int,
            row['areaId'] as int,
            applyJob:
                row['applyJob'] == null ? null : (row['applyJob'] as int) != 0,
            saveJob:
                row['saveJob'] == null ? null : (row['saveJob'] as int) != 0),
        arguments: [checkApply ? 1 : 0]);
  }

  @override
  Future<List<Job>> getListJobSave(bool checkSave) async {
    return _queryAdapter.queryList('select * from Job where saveJob = ?1',
        mapper: (Map<String, Object?> row) => Job(
            row['id'] as int,
            row['Name'] as String,
            row['BaseSalary'] as double,
            row['Amount'] as int,
            row['Gender'] as int,
            row['Age'] as String,
            row['EnglishLevel'] as int,
            row['Experience'] as String,
            row['OtherRequirements'] as String,
            row['icon'] as String,
            row['CareerId'] as int,
            row['areaId'] as int,
            applyJob:
                row['applyJob'] == null ? null : (row['applyJob'] as int) != 0,
            saveJob:
                row['saveJob'] == null ? null : (row['saveJob'] as int) != 0),
        arguments: [checkSave ? 1 : 0]);
  }

  @override
  Future<void> insertItem(Job item) async {
    await _jobInsertionAdapter.insert(item, OnConflictStrategy.replace);
  }

  @override
  Future<void> insertTasks(List<Job> tasks) async {
    await _jobInsertionAdapter.insertList(tasks, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateItem(Job item) async {
    await _jobUpdateAdapter.update(item, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteItem(Job item) async {
    await _jobDeletionAdapter.delete(item);
  }
}

// ignore_for_file: unused_element
final _dataTypeConverter = DataTypeConverter();
