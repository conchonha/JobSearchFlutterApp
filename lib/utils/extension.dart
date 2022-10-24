import 'package:untitled_folder/pages/job_storage_or_apply/job_storage_or_apply_screen.dart';

extension NumberExt on num{
  String get convertEngListLevel{
    switch(this){
      case 1:
        return "Not Required";
      case 2:
        return "Basic";
      case 3:
        return "Good";
      default:
        return "";
    }
  }
}

