class RecordListEntity {
	double orderAmount;
	int endDate;
	int workRecordId;

	RecordListEntity({this.orderAmount, this.endDate, this.workRecordId});

	RecordListEntity.fromJson(Map<String, dynamic> json) {
		orderAmount = json['orderAmount'];
		endDate = json['endDate'];
		workRecordId = json['workRecordId'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['orderAmount'] = this.orderAmount;
		data['endDate'] = this.endDate;
		data['workRecordId'] = this.workRecordId;
		return data;
	}
}
