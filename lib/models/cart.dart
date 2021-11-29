import 'book.dart';

class Cart {
   Book book;
   int quantity;

  Cart({required this.book, required this.quantity});
}

List<Cart> carts = [
  Cart(book: books[0], quantity: 2),
  Cart(book: books[1], quantity: 4),
  Cart(book: books[2], quantity: 1),
];
