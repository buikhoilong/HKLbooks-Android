class Promote {
  String? id;
  String? name;
  String? description;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  Promote(
      {this.id,
      this.name,
      this.description,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Promote.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    description = json['Description'];
    status = json['Status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = id;
    data['Name'] = name;
    data['Description'] = description;
    data['Status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}
