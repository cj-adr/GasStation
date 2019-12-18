class OrderListBean {
  String gasType = '';
  String payType = '';
  String createTime = '';
  double amount;
  String status = '';

  OrderListBean(
      {this.gasType, this.payType, this.createTime, this.amount, this.status});

  OrderListBean.fromJson(Map<String, dynamic> json) {
    gasType = json['gasType'];
    payType = json['payType'];
    createTime = json['createTime'];
    amount = json['amount'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gasType'] = this.gasType;
    data['payType'] = this.payType;
    data['createTime'] = this.createTime;
    data['status'] = this.status;
    return data;
  }
}
