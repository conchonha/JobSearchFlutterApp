import '../services/database/app_database.dart';

class DatabaseUtils {

  late AppDatabase _database;

  Future databaseBuilder() async {
    _database =
        await $FloorAppDatabase.databaseBuilder('job_search.db').build();
  }

   AppDatabase getDb() {
    return _database;
  }
}
