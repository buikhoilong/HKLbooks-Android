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
  AccountModel account = DBConfig.instance.account;
  late final Book2 bookModel;
  List<Book2> favBooks = [];
  @override
  void initState() {
    super.initState();
        DBConfig.instance.getAccount();
    account = DBConfig.instance.account;
    final favourite = Provider.of<FavouriteProvider>(context, listen: false);
    favourite.getAllBooks(account.id);
    favBooks =
        Provider.of<FavouriteProvider>(context, listen: false).favoritebooks;
  }

  // ignore: non_constant_identifier_names
  ShowDialog(context, text) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                  letterSpacing: 0.5,
                )),
            actions: [
              Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Đóng'))
                  ],
                ),
              ),
            ],
          );
        });
  }

  void toggeFavorite() {
    // Provider.of<FavouriteProvider>(context, listen: false)
    //   .deleteFav(account.id, bookModel.id);
      print(bookModel.id);
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
                        children:  [
                          IconButton(
                            // ignore: prefer_const_constructors
                            icon: Icon(
                              // IconData(0xf0516, fontFamily: 'MaterialIcons'),
                              Icons.no_accounts_rounded,
                              color: myRed,
                            ),
                            onPressed: (){
                              setState(() {
                                  Provider.of<FavouriteProvider>(context, listen: false).deleteFav(account.id, favBooks[index].id);
                              bool check =Provider.of<FavouriteProvider>(context, listen: false).isSuccess;
                              if(check){
                                ShowDialog(context, 'Đã xóa ra khỏi danh sách yêu thích!');
                              }else{
                                  ShowDialog(context, 'Xóa thất bại!');
                              }
                              
                                });
                            },
                          )
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
