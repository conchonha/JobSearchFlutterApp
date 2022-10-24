import 'package:flutter_library/base/common_list/common_data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:floor/floor.dart';

part 'job.g.dart';

@JsonSerializable()
@Entity(tableName: 'Job')
class Job extends CommonData {
  @JsonKey(name: 'id')
  @PrimaryKey(autoGenerate: false)
  int id;

  @JsonKey(name: 'Name')
  @ColumnInfo(name: 'Name')
  String title;

  @ColumnInfo(name: 'BaseSalary')
  @JsonKey(name: 'BaseSalary')
  double price;

  @JsonKey(name: 'Amount')
  @ColumnInfo(name: 'Amount')
  int amount;

  @JsonKey(name: 'Gender')
  @ColumnInfo(name: 'Gender')
  int gender;

  @JsonKey(name: 'Age')
  @ColumnInfo(name: 'Age')
  String age;

  @JsonKey(name: 'EnglishLevel')
  @ColumnInfo(name: 'EnglishLevel')
  int englishLevel;

  @JsonKey(name: 'Experience')
  @ColumnInfo(name: 'Experience')
  String experience;

  @JsonKey(name: 'OtherRequirements')
  @ColumnInfo(name: 'OtherRequirements')
  String description;

  @JsonKey(name: 'icon')
  @ColumnInfo(name: 'icon')
  String icon;

  @JsonKey(name: 'CareerId')
  @ColumnInfo(name: 'CareerId')
  int careerId;

  @JsonKey(name: 'areaId')
  @ColumnInfo(name: 'areaId')
  int areaId;

  @JsonKey(ignore: true)
  @ColumnInfo(name: 'applyJob')
  bool? applyJob;

  @JsonKey(ignore: true)
  @ColumnInfo(name: 'saveJob')
  bool? saveJob;

  Job(
      this.id,
      this.title,
      this.price,
      this.amount,
      this.gender,
      this.age,
      this.englishLevel,
      this.experience,
      this.description,
      this.icon,
      this.careerId,
      this.areaId,
      {this.applyJob,
      this.saveJob});

  factory Job.fromJson(Map<String, dynamic> json) => _$JobFromJson(json);

  Map<String, dynamic> toJson() => _$JobToJson(this);
}

class DataTypeConverter extends TypeConverter<DataType?, String?> {
  @override
  DataType? decode(String? databaseValue) {
    switch (databaseValue) {
      case "TYPE_LIST_ARROW_PREVIEW":
        return DataType.TYPE_LIST_ARROW_PREVIEW;
      case "TYPE_LIST_ARROW":
        return DataType.TYPE_LIST_ARROW;
      case "TYPE_OTHER":
        return DataType.TYPE_OTHER;
      case "TYPE_CHECKBOX":
        return DataType.TYPE_CHECKBOX;
      case "TYPE_CHECKBOX_PREVIEW":
        return DataType.TYPE_CHECKBOX_PREVIEW;
      case "TYPE_RADIO_PREVIEW":
        return DataType.TYPE_RADIO_PREVIEW;
      default:
        return DataType.TYPE_RADIO;
    }
  }

  @override
  String? encode(DataType? value) {
    return value?.name;
  }
}
