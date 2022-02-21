import 'package:flutter/material.dart';
import 'package:hkl_books/DB/dbconfig.dart';
import 'package:hkl_books/models/account.dart';
import 'package:hkl_books/models/book2.dart';
import 'package:hkl_books/provider/favouriteprovider.dart';
import 'package:provider/provider.dart';

import '../../config.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  AccountModel account = DBConfig.instance.account;
  List<Book2> favBooks = [];
  void initState() {
    super.initState();
    final favourite = Provider.of<FavouriteProvider>(context, listen: false);
    favourite.getAllBooks(account.id);
    print(account.id);
    favBooks =
        Provider.of<FavouriteProvider>(context, listen: false).favoritebooks;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: (favBooks.isEmpty)
            ? const Center(
                child: Text('Danh sách yêu thích rỗng!'),
              )
            : ListView.builder(
                itemCount: favBooks.length,
                itemBuilder: (context, index) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Image.asset(
                          'assets/images/${favBooks[index].imgPath}',
                          width: 120,
                          height: 150),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: (MediaQuery.of(context).size.width) / 2,
                          // padding: const EdgeInsets.only(left: 1),
                          child: Text(
                            favBooks[index].name,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Đơn giá: ${formatMoney.format(favBooks[index].price)}',
                          overflow: TextOverflow.visible,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ElevatedButton(
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
                                  side: const BorderSide(
                                      width: 2, color: Colors.green),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              onPressed: () => null,
                            ),
                            ElevatedButton(
                              child: const Text(
                                "Mua hàng",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(110, 35),
                                  primary: Colors.green,
                                  side: const BorderSide(
                                      width: 2, color: Colors.green),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              onPressed: () => null,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          IconButton(
                            onPressed: null,
                            icon: Icon(
                              Icons.favorite,
                              color: myRed,
                            ),
                          ),
                        ]),
                    const Divider(
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
