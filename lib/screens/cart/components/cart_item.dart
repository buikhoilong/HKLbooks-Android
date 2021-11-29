import 'package:flutter/material.dart';
import 'package:hkl_books/config.dart';
import 'package:hkl_books/models/cart.dart';

// ignore: must_be_immutable
class CartItem extends StatefulWidget {
  CartItem({Key? key, required this.cart}) : super(key: key);
  Cart cart;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  _increaseQuantity() {
    setState(() {
      widget.cart.quantity++;
    });
  }

  _decreaseQuantity() {
    setState(() {
      widget.cart.quantity--;
    });
  }

  _deleteCartItem() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child:
                Image.asset(widget.cart.book.imgPath, width: 120, height: 150),
          ),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.cart.book.name,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Đơn giá: ${formatMoney.format(widget.cart.book.price)}',
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
                  'Tổng tiền: ${formatMoney.format(widget.cart.book.price * widget.cart.quantity)}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: myGreen,
                  ),
                ),
              ],
            ),
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
