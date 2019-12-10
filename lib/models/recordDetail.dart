import 'package:json_annotation/json_annotation.dart';
import "recordItem.dart";
part 'recordDetail.g.dart';

@JsonSerializable()
class RecordDetail {
    RecordDetail();

    num discountAmount;
    num endDate;
    List<RecordItem> mbrCardSpec;
    num orderAmount;
    List<RecordItem> orderList;
    List<RecordItem> proSkuCount;
    num realPayAmount;
    num startDate;
    String userName;
    
    factory RecordDetail.fromJson(Map<String,dynamic> json) => _$RecordDetailFromJson(json);
    Map<String, dynamic> toJson() => _$RecordDetailToJson(this);
}
