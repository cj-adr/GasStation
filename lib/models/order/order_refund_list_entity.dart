class OrderRefundListBean {
  double refundAmount;
  String refundStatus = '';
  String refundTime = '';

  OrderRefundListBean({this.refundAmount, this.refundStatus, this.refundTime});

  OrderRefundListBean.fromJson(Map<String, dynamic> json) {
    refundAmount = json['refundAmount'];
    refundStatus = json['refundStatus'];
    refundTime = json['refundTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['refundAmount'] = this.refundAmount;
    data['refundStatus'] = this.refundStatus;
    data['refundTime'] = this.refundTime;
    return data;
  }
}
