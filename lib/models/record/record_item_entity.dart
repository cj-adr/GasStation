class RecordItemEntity {
	num totalAmount;
	num quantity;
	String name;
	int totalCount;

	RecordItemEntity({this.totalAmount, this.quantity, this.name, this.totalCount});

	RecordItemEntity.fromJson(Map<String, dynamic> json) {
		totalAmount = json['totalAmount'];
		quantity = json['quantity'];
		name = json['name'];
		totalCount = json['totalCount'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['totalAmount'] = this.totalAmount;
		data['quantity'] = this.quantity;
		data['name'] = this.name;
		data['totalCount'] = this.totalCount;
		return data;
	}
}
