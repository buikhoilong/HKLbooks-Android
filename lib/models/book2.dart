class Book2 {
  String id;
  String name;
  int price;
  int stock;
  int? saleOff;
  int? saleOffStart;
  int? saleOffEnd;
  String imgPath;
  String detail;
  String author;
  String publisher;
  String categoryId;
  int status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  Book2(
      {required this.id,
      required this.name,
      required this.price,
      required this.stock,
      required this.saleOff,
      required this.saleOffStart,
      required this.saleOffEnd,
      required this.imgPath,
      required this.detail,
      required this.author,
      required this.publisher,
      required this.categoryId,
      required this.status,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  factory Book2.fromJson(Map<String, dynamic> json) => Book2(
        id: json['Id'],
        name: json['Name'],
        price: json['Price'],
        stock: json['Stock'],
        saleOff: json['SaleOff'],
        saleOffStart: json['SaleOffStart'],
        saleOffEnd: json['SaleOffEnd'],
        imgPath: json['ImgPath'],
        detail: json['Detail'],
        author: json['Author'],
        publisher: json['Publisher'],
        categoryId: json['CategoryId'],
        status: json['Status'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        deletedAt: json['deleted_at'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['Name'] = name;
    data['Price'] = price;
    data['Stock'] = stock;
    data['SaleOff'] = saleOff;
    data['SaleOffStart'] = saleOffStart;
    data['SaleOffEnd'] = saleOffEnd;
    data['ImgPath'] = imgPath;
    data['Detail'] = detail;
    data['Author'] = author;
    data['Publisher'] = publisher;
    data['CategoryId'] = categoryId;
    data['Status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}
