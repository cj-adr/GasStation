import 'package:json_annotation/json_annotation.dart';

part 'recordList.g.dart';

@JsonSerializable()
class RecordList {
    RecordList();

    num workRecordId;
    num orderAmount;
    num endDate;
    
    factory RecordList.fromJson(Map<String,dynamic> json) => _$RecordListFromJson(json);
    Map<String, dynamic> toJson() => _$RecordListToJson(this);
}
