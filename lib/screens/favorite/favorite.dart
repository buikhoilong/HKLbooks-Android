import 'package:flutter/material.dart';
import 'package:hkl_books/models/cart.dart';
import 'components/favorite_item.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Danh sách yêu thích",
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: ListView(children: [
          const SizedBox(height: 20),
          //Sản phẩm
          FavoritedItem(
            favorited: carts[0],
          ),
          FavoritedItem(
            favorited: carts[1],
          ),
          FavoritedItem(
            favorited: carts[2],
          ),
          const SizedBox(height: 30),
        ]),
      ),
    );
  }
}
