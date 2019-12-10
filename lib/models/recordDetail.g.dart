// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recordDetail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecordDetail _$RecordDetailFromJson(Map<String, dynamic> json) {
  return RecordDetail()
    ..discountAmount = json['discountAmount'] as num
    ..endDate = json['endDate'] as num
    ..mbrCardSpec = (json['mbrCardSpec'] as List)
        ?.map((e) =>
            e == null ? null : RecordItem.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..orderAmount = json['orderAmount'] as num
    ..orderList = (json['orderList'] as List)
        ?.map((e) =>
            e == null ? null : RecordItem.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..proSkuCount = (json['proSkuCount'] as List)
        ?.map((e) =>
            e == null ? null : RecordItem.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..realPayAmount = json['realPayAmount'] as num
    ..startDate = json['startDate'] as num
    ..userName = json['userName'] as String;
}

Map<String, dynamic> _$RecordDetailToJson(RecordDetail instance) =>
    <String, dynamic>{
      'discountAmount': instance.discountAmount,
      'endDate': instance.endDate,
      'mbrCardSpec': instance.mbrCardSpec,
      'orderAmount': instance.orderAmount,
      'orderList': instance.orderList,
      'proSkuCount': instance.proSkuCount,
      'realPayAmount': instance.realPayAmount,
      'startDate': instance.startDate,
      'userName': instance.userName
    };
