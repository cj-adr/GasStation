// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recordList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecordList _$RecordListFromJson(Map<String, dynamic> json) {
  return RecordList()
    ..workRecordId = json['workRecordId'] as num
    ..orderAmount = json['orderAmount'] as num
    ..endDate = json['endDate'] as num;
}

Map<String, dynamic> _$RecordListToJson(RecordList instance) =>
    <String, dynamic>{
      'workRecordId': instance.workRecordId,
      'orderAmount': instance.orderAmount,
      'endDate': instance.endDate
    };
