import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hkl_books/DB/dbconfig.dart';
import 'package:hkl_books/config.dart';
import 'package:hkl_books/models/account.dart';
import 'package:hkl_books/models/book2.dart';
import 'package:hkl_books/models/rate.dart';
import 'package:hkl_books/provider/favouriteprovider.dart';
import 'package:hkl_books/provider/rateprovider.dart';
import 'package:hkl_books/screens/cart/cart.dart';
import 'package:provider/provider.dart';

class Detail extends StatefulWidget {
  final Book2 bookModel;
  const Detail({Key? key, required this.bookModel}) : super(key: key);
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  AccountModel account = AccountModel();
  late bool isFavorited;
  List<Rate> rates = [];
  var star = 1.0;
  @override
  void initState() {
    super.initState();
    DBConfig.instance.getAccount();
    account = DBConfig.instance.account;
    Provider.of<FavouriteProvider>(context, listen: false)
        .checkFavavorite(account.id, widget.bookModel.id);
    Provider.of<RateProvider>(context, listen: false)
        .getRatesByBookId(widget.bookModel.id);
    isFavorited =
        Provider.of<FavouriteProvider>(context, listen: false).isFavorite;

    rates = Provider.of<RateProvider>(context, listen: false).rates;
    int allStar = Provider.of<RateProvider>(context, listen: false).allStar;
    star = (allStar * 1.0 / rates.length);
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
    if (isFavorited == true) {
      ShowDialog(context, "Đã có trong danh sach yêu thích");
    } else {
      Provider.of<FavouriteProvider>(context, listen: false)
          .addFav(account.id, widget.bookModel.id);
      String mess =
          Provider.of<FavouriteProvider>(context, listen: false).Message;
      ShowDialog(context, mess);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      Stack(
        children: [
          // ignore: avoid_unnecessary_containers
          Container(
            child: Image.asset(
              'assets/images/BG-2.jpg',
              fit: BoxFit.contain,
            ),
          ),
          // ignore: avoid_unnecessary_containers
          Container(
              child: Column(
            children: [
              // ignore: avoid_unnecessary_containers
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                      iconSize: 30,
                    )
                  ],
                ),
                margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              ),
              // ignore: avoid_unnecessary_containers
              Container(
                child: Stack(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          // ignore: avoid_unnecessary_containers
                          Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        150, 0, 30, 10),
                                    child: IconButton(
                                      padding: const EdgeInsets.all(0),
                                      alignment: Alignment.centerRight,
                                      icon: (isFavorited
                                          ? const Icon(Icons.favorite)
                                          : const Icon(Icons.favorite_border)),
                                      color: Colors.red[500],
                                      onPressed: toggeFavorite,
                                    ),
                                  ),
                                  // ignore: avoid_unnecessary_containers
                                  Container(
                                    child: ElevatedButton(
                                      child: const Text(
                                        "Chọn Mua",
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
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      onPressed: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const CartScreen())),
                                    ),
                                  ),
                                ],
                              ),
                              // padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0)),

                          Container(
                            child: Text(
                              widget.bookModel.detail,
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                              // maxLines: 3,
                              textAlign: TextAlign.justify,
                            ),
                            padding: const EdgeInsets.fromLTRB(15, 20, 15, 15),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      margin: const EdgeInsets.fromLTRB(0, 190, 0, 0),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/${widget.bookModel.imgPath}',
                            width: 130,
                            height: 250,
                            fit: BoxFit.contain,
                          ),
                          // ignore: avoid_unnecessary_containers
                          Container(
                            width: 230,
                            child: Column(
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.bookModel.name,
                                    style: const TextStyle(
                                        fontFamily: 'BalihoScript',
                                        fontSize: 25,
                                        color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "- ${widget.bookModel.author} -",
                                    style: const TextStyle(
                                        fontFamily: 'BalihoScript',
                                        fontSize: 25,
                                        color: Colors.white),
                                    textAlign: TextAlign.center,
                                  )
                                ]),
                            margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          )
                        ],
                      ),
                      padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
                    ),
                  ],
                ),
              ),

              // ignore: avoid_unnecessary_containers
              Container(
                child: Column(
                  children: [
                    const Text('Thông tin chi tiết'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Thể loại'),
                        Text(widget.bookModel.categoryName)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Tác giả'),
                        Text(widget.bookModel.author)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Nhà xuất bản'),
                        Container(
                          width: 150,
                          child: Text(widget.bookModel.publisher),
                          padding: const EdgeInsets.only(left: 35),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Giá bán lẻ'),
                        Text(formatMoney.format(widget.bookModel.price))
                      ],
                    ),
                  ],
                ),
                margin: const EdgeInsets.fromLTRB(70, 10, 70, 10),
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
              ),

              // ignore: avoid_unnecessary_containers
              // Container(
              //   child: Column(
              //     children: <Widget>[
              //       Container(
              //         child: const Text(
              //           "BẠN CÓ THỂ THÍCH",
              //           style: TextStyle(fontSize: 20),
              //         ),
              //         padding: const EdgeInsets.fromLTRB(0, 0, 200, 0),
              //         margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              //       ),
              //       // ignore: avoid_unnecessary_containers
              //       Container(
              //         margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              //         child: SingleChildScrollView(
              //           scrollDirection: Axis.horizontal,
              //           child: Row(
              //             children: const <Widget>[
              //               book2(),
              //               book2(),
              //               book2(),
              //               book2(),
              //               book2(),
              //             ],
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              //   padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
              //   margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
              //   decoration: BoxDecoration(
              //       color: Colors.white,
              //       borderRadius: BorderRadius.circular(15)),
              // ),
              //header Rates
              Container(
                color: Colors.white,
                padding: EdgeInsets.only(top: 15),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: const Text(
                        'Đánh Giá - Nhận Xét Từ Khách Hàng',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            (star).toString(),
                            style: const TextStyle(
                                fontSize: 50, fontWeight: FontWeight.bold),
                          ),
                          const Icon(
                            Icons.star_outlined,
                            color: Colors.yellow,
                            size: 40,
                          ),
                          Column(
                            children: [
                              Container(
                                child: Text(
                                  "${rates.length} Đánh giá",
                                  textAlign: TextAlign.left,
                                ),
                                margin: const EdgeInsets.fromLTRB(0, 0, 130, 0),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    ...rates.map((e) => Container(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(Icons.supervised_user_circle_outlined, color: Colors.lightGreen,size: 60,),
                              
                              Column(
                                children: [
                                  Container(
                                    child: Text(
                                      e.accountId,
                                      textAlign: TextAlign.left,
                                    ),
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 0, 120, 0),
                                  ),
                                  Row(
                                    children: getStar(e.star),
                                  )
                                ],
                              )
                            ],
                          ),
                          Text(e.comment)
                        ],
                      ),
                      padding: const EdgeInsets.fromLTRB(40, 10, 40, 20),
                      decoration: BoxDecoration(
                        border: Border.all(width: 0.5, color: Colors.grey),
                      ),
                    )).toList(),
                  ],
                ),
              ),
            ],
          ))
        ],
      )
    ]));
  }
}

getStar(int star) {
  List<Widget> list = [];
  for (var i = 0; i < star; i++) {
    list.add(const Icon(Icons.star_outlined, color: Colors.yellow));
  }
  return list;
}

// ignore: camel_case_types
class book extends StatelessWidget {
  const book({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      width: 180,
      height: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {},
            child: Column(
              children: [
                Container(
                  child: Image.asset(
                    'assets/images/tu-luyen-cach-tu-duy.jpg',
                    width: 100,
                    height: 150,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(60))),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Thoi quen lam neen sang tao',
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ),
                Text("Twyla Thacp"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class book2 extends StatelessWidget {
  const book2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
            child: Image.asset('assets/images/tu-luyen-cach-tu-duy.jpg',
                width: 100, height: 150, fit: BoxFit.cover),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60), color: Colors.amber),
          ),
          Text(
            'Thói quen làm nên sáng tạo',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          Text(
            'Twyla Thacp',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ]),
        decoration: BoxDecoration(
          border: Border.all(width: 0.3, color: Colors.grey),
          borderRadius: BorderRadius.circular(20),
        ));
  }
}
