// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _MycustomState createState() => _MycustomState();
}

class _MycustomState extends State<Home> {
  // This widget is the root of your application.
  var chitiet = <Widget>{
    Padding(
      padding: EdgeInsets.all(9.0),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Image.asset(
          'images/lam-chu-bo-nao.jpg',
          width: 100,
          height: 100,
        ),
        Text('Hello'),
        Text("nội dung")
      ]),
    )
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            toolbarHeight: 90,
            leading: Icon(Icons.ac_unit_rounded),
            // ignore: avoid_unnecessary_containers
            title: Container(
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.green,
                    size: 25,
                  ),
                  hintText: 'Nhập từ khóa tìm kiếm',
                  hintStyle: TextStyle(color: Colors.white),
                  fillColor: Colors.white38,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
            ),
          ),
          body: ListView(
            children: [
              Column(
                children: [
                  // ignore: avoid_unnecessary_containers
                  Container(
                    child: Image.asset(
                      'images/Untitled.png',
                    ),
                  ),
                  // ignore: avoid_unnecessary_containers
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        // ignore: avoid_unnecessary_containers
                        Container(
                          margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("SÁCH MỚI NHẤT"),
                              TextButton(
                                onPressed: () {},
                                child: Text("XEM TẤT CẢ"),
                              )
                            ],
                          ),
                        ),
                        // ignore: avoid_unnecessary_containers
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: const <Widget>[
                                book2(),
                                book2(),
                                book2(),
                                book2(),
                                book2(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        // ignore: avoid_unnecessary_containers
                        Container(
                          margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("TRUYỆN"),
                              TextButton(
                                onPressed: () {},
                                child: Text("XEM TẤT CẢ"),
                              )
                            ],
                          ),
                        ),
                        // ignore: avoid_unnecessary_containers
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: const <Widget>[
                                book2(),
                                book2(),
                                book2(),
                                book2(),
                                book2(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        // ignore: avoid_unnecessary_containers
                        Container(
                          margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("MIẾN PHÍ ĐỌC"),
                              TextButton(
                                onPressed: () {},
                                child: Text("XEM TẤT CẢ"),
                              )
                            ],
                          ),
                        ),
                        // ignore: avoid_unnecessary_containers
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: const <Widget>[
                                book2(),
                                book2(),
                                book2(),
                                book2(),
                                book2(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // ignore: avoid_unnecessary_containers
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 0.4, color: Colors.grey)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                icon: Icon(Icons.home,
                                    size: 30, color: Colors.green),
                                onPressed: () {},
                              ),
                              Text(
                                'Kho Sách',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                icon: Icon(Icons.shopping_cart_outlined,
                                    size: 30),
                                onPressed: () {},
                              ),
                              Text(
                                'Giỏ Hàng',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                icon:
                                    Icon(Icons.notifications_active, size: 30),
                                onPressed: () {},
                              ),
                              Text(
                                'Thông Báo',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.account_circle,
                                  size: 30,
                                ),
                                onPressed: () {},
                              ),
                              Text(
                                'Tài Khoản',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          )),
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
            child: Image.asset('images/tu-luyen-cach-tu-duy.jpg',
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
