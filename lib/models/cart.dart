class Cart {
  int? id;
  String? accountId;
  String? bookId;
  int? quantity;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  Cart(
      {this.id,
      this.accountId,
      this.bookId,
      this.quantity,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Cart.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    accountId = json['AccountId'];
    bookId = json['BookId'];
    quantity = json['Quantity'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['AccountId'] = accountId;
    data['BookId'] = bookId;
    data['Quantity'] = quantity;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}
