class Book {
  final String imgPath;
  final String name;
  final String author;
  final int price;

  Book(
      {required this.imgPath,
      required this.name,
      required this.author,
      required this.price});
}

final List<Book> books = [
  Book(
      imgPath: 'assets/images/thay-cau-hoi-doi-cuoc-doi.jpg',
      name: 'Thay Câu Hỏi Đổi Cuộc Đời',
      author: 'Pau Angone',
      price: 100000),
  Book(
      imgPath: 'assets/images/nhung-quy-tac-tu-duy.jpg',
      name: 'Những Quy Tắc Tư Duy',
      author: 'Napolenon Hill',
      price: 100000),
  Book(
      imgPath: 'assets/images/de-the-gioi-biet-ban-la-ai.jpg',
      name: 'Để Thế Giới Biết Bạn Là Ai',
      author: 'Richard Templar',
      price: 100000),
  Book(
      imgPath: 'assets/images/lam-chu-bo-nao.jpg',
      name: 'Làm Chủ Bộ Não',
      author: 'David Rock',
      price: 100000),
  Book(
      imgPath: 'assets/images/lam-it-duoc-nhieu.jpg',
      name: 'Làm Ít Được Nhiều',
      author: 'Jan Yager, Ph.D',
      price: 100000),
  Book(
      imgPath: 'assets/images/tu-luyen-cach-tu-duy.jpg',
      name: 'Tự Luyện Cách Tư Duy',
      author: 'Edward de Bono',
      price: 100000),
  Book(
      imgPath: 'assets/images/thoi-quen-lam-nen-sang-tao.jpg',
      name: 'Thói Quen Làm Nên Sáng Tạo',
      author: 'Twyla Tharp',
      price: 100000),
];
