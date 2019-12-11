import 'package:json_annotation/json_annotation.dart';

part 'recordItem.g.dart';

@JsonSerializable()
class RecordItem {
    RecordItem();

    String name;
    num quantity;
    num totalAmount;
    num totalCount;
    
    factory RecordItem.fromJson(Map<String,dynamic> json) => _$RecordItemFromJson(json);
    Map<String, dynamic> toJson() => _$RecordItemToJson(this);
}
