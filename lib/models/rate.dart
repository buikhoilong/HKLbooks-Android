class Rate {
  int id;
  String accountId;
  String bookId;
  int star;
  String comment;
  String reply;
  int status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  Rate(
      {required this.id,
      required this.accountId,
      required this.bookId,
      required this.star,
      required this.comment,
      required this.reply,
      required this.status,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  factory Rate.fromJson(Map<String, dynamic> json) => Rate(
    id : json['Id'],
    accountId : json['AccountId'],
    bookId : json['BookId'],
    star : json['Star'],
    comment : json['Comment'],
    reply : json['Reply'],
    status : json['Status'],
    createdAt : json['created_at'],
    updatedAt : json['updated_at'],
    deletedAt : json['deleted_at'],
  );
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['AccountId'] = accountId;
    data['BookId'] = bookId;
    data['Star'] = star;
    data['Comment'] = comment;
    data['Reply'] = reply;
    data['Status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}