
class AccountModel {
  String? id;
  String? name;
  String? birthday;
  String? address;
  String? phone;
  int? status;
  String? email;
  String? password;
  int? role;
  String? avatar;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  AccountModel(
      {this.id,
      this.name,
      this.birthday,
      this.address,
      this.phone,
      this.status,
      this.email,
      this.password,
      this.role,
      this.avatar,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  AccountModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    birthday = json['Birthday'];
    address = json['Address'];
    phone = json['Phone'];
    status = json['Status'];
    email = json['Email'];
    password = json['password'];
    role = json['Role'];
    avatar = json['Avatar'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['Name'] = name;
    data['Birthday'] = birthday;
    data['Address'] = address;
    data['Phone'] = phone;
    data['Status'] = status;
    data['Email'] = email;
    data['password'] = password;
    data['Role'] = role;
    data['Avatar'] = avatar;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}
