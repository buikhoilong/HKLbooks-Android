class Favourite {
  int? id;
  String? accountId;
  String? bookId;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  Favourite(
      {this.id,
      this.accountId,
      this.bookId,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Favourite.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    accountId = json['AccountId'];
    bookId = json['BookId'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['AccountId'] = accountId;
    data['BookId'] = bookId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}