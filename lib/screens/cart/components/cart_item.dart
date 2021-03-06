import 'package:flutter/material.dart';
import 'package:hkl_books/config.dart';
import 'package:hkl_books/models/book2.dart';
import 'package:hkl_books/models/cart.dart';

// ignore: must_be_immutable
class CartItem extends StatefulWidget {
  CartItem({Key? key, required this.cart, required this.book})
      : super(key: key);
  Cart cart;
  Book2 book;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  _increaseQuantity() {
    setState(() {
      // widget.cart.quantity++;
    });
  }

  _decreaseQuantity() {
    setState(() {
      // widget.cart.quantity--;
    });
  }

  _deleteCartItem() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
              image: NetworkImage(booksImgURL + widget.book.imgPath),
              // AssetImage(
              //     'assets/images/${widget.book.imgPath}'), //NetworkImage(booksImgURL + widget.book.imgPath)
              width: 120,
              height: 150),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: Text(
                  widget.book.name,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Đơn giá: ${formatMoney.format(widget.book.price)}',
                overflow: TextOverflow.visible,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'Số lượng:',
                overflow: TextOverflow.visible,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.remove,
                        color: Colors.black,
                        size: 10,
                      ),
                      onPressed: _decreaseQuantity,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 70,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Text(
                      '${widget.cart.quantity}',
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.add,
                        color: Colors.black,
                        size: 10,
                      ),
                      onPressed: _increaseQuantity,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'Tổng tiền: ${formatMoney.format(widget.book.price * widget.cart.quantity!)}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: myGreen,
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: _deleteCartItem,
            icon: const Icon(
              Icons.delete,
              color: myRed,
            ),
          ),
        ],
      ),
    );
  }
}
