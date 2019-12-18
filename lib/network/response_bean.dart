import 'dart:core';

import '../entity_factory.dart';

/// 网络数据结果
class ResponseBean<T> {
  String errCode;
  String errMsg;
  bool success;
  T data;

  ResponseBean(this.errCode, this.errMsg, this.success, this.data);

  ResponseBean.fromJson(Map<String, dynamic> json) {
    this.errCode = json['errCode'] as String;
    this.errMsg = json['errMsg'] as String;
    this.success = json['success'] as bool;
    var data = json['data'];
    if (null != data) {
      this.data = EntityFactory.generateOBJ<T>(data);
    }
  }
}
