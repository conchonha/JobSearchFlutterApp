import 'package:rxdart/rxdart.dart';
import 'package:untitled_folder/model/area/area.dart';
import '../career/career.dart';

class DataProvider{
  static final DataProvider _instance = DataProvider._internal();

  final _listCareer = BehaviorSubject<List<Career>>();
  Stream<List<Career>> get listCareerStream => _listCareer.stream;

  final _listArea = BehaviorSubject<List<Area>>();
  Stream<List<Area>> get listAreaStream => _listArea.stream;

  DataProvider._internal();

  factory DataProvider(){
    return _instance;
  }

  setListCareer(List<Career> listTmp){
    _listCareer.sink.add(listTmp);
  }

  setListArea(List<Area> listTmp){
    _listArea.sink.add(listTmp);
  }
}