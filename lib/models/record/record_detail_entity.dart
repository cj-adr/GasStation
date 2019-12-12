import 'package:gas_station/models/record/record_item_entity.dart';

class RecordDetailEntity {
  double orderAmount;
  int endDate;
  double discountAmount;
  List<RecordItemEntity> orderList;
  List<RecordItemEntity> proSkuCount;
  double realPayAmount;
  List<RecordItemEntity> mbrCardSpec;
  String userName;
  int startDate;

  RecordDetailEntity(
      {this.orderAmount,
      this.endDate,
      this.discountAmount,
      this.orderList,
      this.proSkuCount,
      this.realPayAmount,
      this.mbrCardSpec,
      this.userName,
      this.startDate});

  RecordDetailEntity.fromJson(Map<String, dynamic> json) {
    orderAmount = json['orderAmount'];
    endDate = json['endDate'];
    discountAmount = json['discountAmount'];
    if (json['orderList'] != null) {
      orderList = new List<RecordItemEntity>();
      (json['orderList'] as List).forEach((v) {
        orderList.add(new RecordItemEntity.fromJson(v));
      });
    }
    if (json['proSkuCount'] != null) {
      proSkuCount = new List<RecordItemEntity>();
      (json['proSkuCount'] as List).forEach((v) {
        proSkuCount.add(new RecordItemEntity.fromJson(v));
      });
    }
    realPayAmount = json['realPayAmount'];
    if (json['mbrCardSpec'] != null) {
      mbrCardSpec = new List<RecordItemEntity>();
      (json['mbrCardSpec'] as List).forEach((v) {
        mbrCardSpec.add(new RecordItemEntity.fromJson(v));
      });
    }
    userName = json['userName'];
    startDate = json['startDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderAmount'] = this.orderAmount;
    data['endDate'] = this.endDate;
    data['discountAmount'] = this.discountAmount;
    if (this.orderList != null) {
      data['orderList'] = this.orderList.map((v) => v.toJson()).toList();
    }
    if (this.proSkuCount != null) {
      data['proSkuCount'] = this.proSkuCount.map((v) => v.toJson()).toList();
    }
    data['realPayAmount'] = this.realPayAmount;
    if (this.mbrCardSpec != null) {
      data['mbrCardSpec'] = this.mbrCardSpec.map((v) => v.toJson()).toList();
    }
    data['userName'] = this.userName;
    data['startDate'] = this.startDate;
    return data;
  }
}
