import 'package:untitled_folder/model/job/job.dart';
import 'package:floor/floor.dart';
import '../abstrac_dao.dart';

@dao
abstract class JobDao extends BaseDao<Job>{
  @Query("select * from Job where applyJob = :checkApply")
  Future<List<Job>> getListJobApply(bool checkApply);

  @Query("select * from Job where saveJob = :checkSave")
  Future<List<Job>> getListJobSave(bool checkSave );
}