import 'package:flutter/material.dart';
import 'package:hkl_books/config.dart';
import 'package:hkl_books/models/book2.dart';

// ignore: must_be_immutable
class FavoritedItem extends StatefulWidget {
  FavoritedItem({Key? key, required this.favorited}) : super(key: key);
  Book2 favorited;

  @override
  State<FavoritedItem> createState() => _FavoritedItemState();
}

class _FavoritedItemState extends State<FavoritedItem> {
  _removeFavoritedItem() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: Image.asset(widget.favorited.imgPath,
                width: 120, height: 150),
          ),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.favorited.name,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Đơn giá: ${formatMoney.format(widget.favorited.price)}',
                  overflow: TextOverflow.visible,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  child: ElevatedButton(
                    child: const Text(
                      "Thêm vào giỏ hàng",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(110, 35),
                        primary: Colors.green,
                        side: const BorderSide(width: 2, color: Colors.green),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () => null,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: _removeFavoritedItem,
            icon: const Icon(
              Icons.favorite,
              color: myRed,
            ),
          ),
        ],
      ),
    );
  }
}
