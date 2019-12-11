// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recordItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecordItem _$RecordItemFromJson(Map<String, dynamic> json) {
  return RecordItem()
    ..name = json['name'] as String
    ..quantity = json['quantity'] as num
    ..totalAmount = json['totalAmount'] as num
    ..totalCount = json['totalCount'] as num;
}

Map<String, dynamic> _$RecordItemToJson(RecordItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'quantity': instance.quantity,
      'totalAmount': instance.totalAmount,
      'totalCount': instance.totalCount
    };
