import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../model/job/job.dart';
import 'job_dao/job_dao.dart';

part 'app_database.g.dart';

@Database(version: 2, entities: [Job])
@TypeConverters([DataTypeConverter])
abstract class AppDatabase extends FloorDatabase {
  JobDao get jobDao;
}
