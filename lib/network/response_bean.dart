/// 网络数据结果
class ResponseBean {
  String errCode;
  String errMsg;
  bool success;
  var data;

  ResponseBean(this.errCode, this.errMsg, this.success, this.data);

  ResponseBean.fromJSON(Map<String, dynamic> json) {
    this.errCode = json['errCode'] as String;
    this.errMsg = json['errMsg'] as String;
    this.success = json['success'] as bool;
    this.data = json['data'];
  }
}
