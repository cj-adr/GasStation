import 'role_entity.dart';

class UserEntity {
	int merchantId;
	String nickName;
	List<RoleEntity> roles;
	int id;
	int staffId;
	String token;

	UserEntity({this.merchantId, this.nickName, this.roles, this.id, this.staffId, this.token});

	UserEntity.fromJson(Map<String, dynamic> json) {
		merchantId = json['merchantId'];
		nickName = json['nickName'];
		if (json['roles'] != null) {
			roles = new List<RoleEntity>();(json['roles'] as List).forEach((v) { roles.add(new RoleEntity.fromJson(v)); });
		}
		id = json['id'];
		staffId = json['staffId'];
		token = json['token'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['merchantId'] = this.merchantId;
		data['nickName'] = this.nickName;
		if (this.roles != null) {
      data['roles'] =  this.roles.map((v) => v.toJson()).toList();
    }
		data['id'] = this.id;
		data['staffId'] = this.staffId;
		data['token'] = this.token;
		return data;
	}
}