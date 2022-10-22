import 'package:rxdart/rxdart.dart';
import '../career/career.dart';

class DataProvider{
  static final DataProvider _instance = DataProvider._internal();

  final _listCareer = BehaviorSubject<List<Career>>();
  Stream<List<Career>> get listCareerStream => _listCareer.stream;

  DataProvider._internal();

  factory DataProvider(){
    return _instance;
  }

  setListCareer(List<Career> listTmp){
    _listCareer.sink.add(listTmp);
  }
}