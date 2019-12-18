class RoleEntity {
	int industryId;
	String code;
	dynamic merchantId;
	String enable;
	String name;
	int id;

	RoleEntity({this.industryId, this.code, this.merchantId, this.enable, this.name, this.id});

	RoleEntity.fromJson(Map<String, dynamic> json) {
		industryId = json['industryId'];
		code = json['code'];
		merchantId = json['merchantId'];
		enable = json['enable'];
		name = json['name'];
		id = json['id'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['industryId'] = this.industryId;
		data['code'] = this.code;
		data['merchantId'] = this.merchantId;
		data['enable'] = this.enable;
		data['name'] = this.name;
		data['id'] = this.id;
		return data;
	}
}
