// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hkl_books/screens/cart/cart.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key}) : super(key: key);
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  int counter = 0;
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
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
                          icon: Icon(Icons.arrow_back_ios),
                          color: Colors.white,
                          iconSize: 30,
                        )
                      ],
                    ),
                    margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
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
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      // ignore: avoid_unnecessary_containers
                                      Container(
                                        child: Column(
                                          children: [
                                            Text(
                                              "Số lượng",
                                              style: TextStyle(fontSize: 15),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        counter--;
                                                      });
                                                    },
                                                    icon: Icon(Icons
                                                        .exposure_minus_1)),
                                                Text(
                                                  '$counter',
                                                  style: const TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.black),
                                                ),
                                                IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        counter++;
                                                      });
                                                    },
                                                    icon: Icon(Icons
                                                        .plus_one_outlined)),
                                              ],
                                            )
                                          ],
                                        ),
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 10, 10, 0),
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
                                                  width: 2,
                                                  color: Colors.green),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                          onPressed: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Cart())),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 20, 0)),
                              // ignore: avoid_unnecessary_containers
                              Container(
                                child: Flexible(
                                  child: Text(
                                    "Sự biến đổi nào, kể cả đới với cá nhân hoặc tổ chức đều bắt nguồn từ các câu hỏi mới.\nMarilee Adams mang đến cho chúng ta những công cụ đơn giản nhưng vô cùng mạnh mẽ để tìm ra các câu hỏi cho những câu hỏi sẽ thay đổi cuộc đời của chúng ta.” – Myron Rogers “Thay Đổi Câu Hỏi – Thay Đổi Cuộc Đời là một cuốn sách tuyệt vời.\nVới văn phong rõ ràng, dễ hiểu, Marilee đưa ra cách thức mà chúng ta có thể làm theo để chủ đích thay đổi cách nghĩ của mình.\nBà đã giới thiệu một công cụ vô cùng hữu dụng cho các huấn luyện viên, các nhà tư vấn, các chuyên gia và tất cả những người khao khát muốn thay đổi cuộc đời minh.” Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành.\nTuy nhiên tuỳ vào từng loại sản phẩm hoặc phương thức, địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, …",
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                    // maxLines: 3,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                padding:
                                    const EdgeInsets.fromLTRB(15, 20, 15, 15),
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
                                'assets/images/thay-cau-hoi-doi-cuoc-doi.jpg',
                                width: 130,
                                height: 250,
                                fit: BoxFit.contain,
                              ),
                              // ignore: avoid_unnecessary_containers
                              Container(
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text(
                                        "Thay Câu Hỏi Đổi Cuộc Đời",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "- Paul Angone -",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white),
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
                        Text('Thông tin chi tiết'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Ngày xuất bản'),
                            Text('11/10/2021')
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [Text('Thể loại'), Text('Kỹ năng')],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Tác giả'),
                            Text('Paul Angone')
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [Text('Giá bán lẻ'), Text('69.000đ')],
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
                  Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Text(
                            "BẠN CÓ THỂ THÍCH",
                            style: TextStyle(fontSize: 20),
                          ),
                          padding: const EdgeInsets.fromLTRB(0, 0, 200, 0),
                          margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
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
                    padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                    margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text(
                          'Đánh Giá - Nhận Xét Từ Khách Hàng',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '4.8',
                                  style: TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold),
                                ),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.star_outlined),
                                          color: Colors.yellow,
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.star_outlined),
                                          color: Colors.yellow,
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.star_outlined),
                                          color: Colors.yellow,
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.star_outlined),
                                          color: Colors.yellow,
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.star_outlined),
                                          color: Colors.yellow,
                                        ),
                                      ],
                                    ),
                                    Container(
                                      child: Text(
                                        "541 nhận xét",
                                        textAlign: TextAlign.left,
                                      ),
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 0, 130, 0),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            margin: const EdgeInsets.fromLTRB(0, 30, 0, 30)),
                        // ignore: avoid_unnecessary_containers
                        Container(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons
                                          .supervised_user_circle_outlined),
                                      iconSize: 60,
                                      color: Colors.lightGreen,
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          child: Text(
                                            "Cực kỳ hài lòng",
                                            textAlign: TextAlign.left,
                                          ),
                                          margin: const EdgeInsets.fromLTRB(
                                              0, 0, 120, 0),
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.star_outlined),
                                              color: Colors.yellow,
                                            ),
                                            IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.star_outlined),
                                              color: Colors.yellow,
                                            ),
                                            IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.star_outlined),
                                              color: Colors.yellow,
                                            ),
                                            IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.star_outlined),
                                              color: Colors.yellow,
                                            ),
                                            IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.star_outlined),
                                              color: Colors.yellow,
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Text(
                                    "Nhận sách trước thời hạn giao hàng. Sách không được bọc lại nên gáy hơi móp xíu nhưng không sao. Sách thơm và nội dung đọc okay lắm. Cảm ơn shop và anh shipper ạ.")
                              ],
                            ),
                            padding: const EdgeInsets.fromLTRB(40, 10, 40, 20),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0.5, color: Colors.grey))),
                        Container(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons
                                          .supervised_user_circle_outlined),
                                      color: Colors.lightGreen,
                                      iconSize: 60,
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          child: Text(
                                            "Cực kỳ hài lòng",
                                            textAlign: TextAlign.left,
                                          ),
                                          margin: const EdgeInsets.fromLTRB(
                                              0, 0, 120, 0),
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.star_outlined),
                                              color: Colors.yellow,
                                            ),
                                            IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.star_outlined),
                                              color: Colors.yellow,
                                            ),
                                            IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.star_outlined),
                                              color: Colors.yellow,
                                            ),
                                            IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.star_outlined),
                                              color: Colors.yellow,
                                            ),
                                            IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.star_outlined),
                                              color: Colors.yellow,
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Text(
                                    "Nhận sách trước thời hạn giao hàng. Sách không được bọc lại nên gáy hơi móp xíu nhưng không sao. Sách thơm và nội dung đọc okay lắm. Cảm ơn shop và anh shipper ạ.")
                              ],
                            ),
                            padding: const EdgeInsets.fromLTRB(40, 10, 40, 20),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0.5, color: Colors.grey))),
                        Container(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons
                                          .supervised_user_circle_outlined),
                                      color: Colors.lightGreen,
                                      iconSize: 60,
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          child: Text(
                                            "Cực kỳ hài lòng",
                                            textAlign: TextAlign.left,
                                          ),
                                          margin: const EdgeInsets.fromLTRB(
                                              0, 0, 120, 0),
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.star_outlined),
                                              color: Colors.yellow,
                                            ),
                                            IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.star_outlined),
                                              color: Colors.yellow,
                                            ),
                                            IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.star_outlined),
                                              color: Colors.yellow,
                                            ),
                                            IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.star_outlined),
                                              color: Colors.yellow,
                                            ),
                                            IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.star_outlined),
                                              color: Colors.yellow,
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Text(
                                    "Nhận sách trước thời hạn giao hàng. Sách không được bọc lại nên gáy hơi móp xíu nhưng không sao. Sách thơm và nội dung đọc okay lắm. Cảm ơn shop và anh shipper ạ.")
                              ],
                            ),
                            padding: const EdgeInsets.fromLTRB(40, 10, 40, 20),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0.5, color: Colors.grey))),
                        Container(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons
                                          .supervised_user_circle_outlined),
                                      color: Colors.lightGreen,
                                      iconSize: 60,
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          child: Text(
                                            "Cực kỳ hài lòng",
                                            textAlign: TextAlign.left,
                                          ),
                                          margin: const EdgeInsets.fromLTRB(
                                              0, 0, 120, 0),
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.star_outlined),
                                              color: Colors.yellow,
                                            ),
                                            IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.star_outlined),
                                              color: Colors.yellow,
                                            ),
                                            IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.star_outlined),
                                              color: Colors.yellow,
                                            ),
                                            IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.star_outlined),
                                              color: Colors.yellow,
                                            ),
                                            IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.star_outlined),
                                              color: Colors.yellow,
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Text(
                                    "Nhận sách trước thời hạn giao hàng. Sách không được bọc lại nên gáy hơi móp xíu nhưng không sao. Sách thơm và nội dung đọc okay lắm. Cảm ơn shop và anh shipper ạ.")
                              ],
                            ),
                            padding: const EdgeInsets.fromLTRB(40, 10, 40, 20),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0.5, color: Colors.grey))),
                        Container(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons
                                          .supervised_user_circle_outlined),
                                      color: Colors.lightGreen,
                                      iconSize: 60,
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          child: Text(
                                            "Cực kỳ hài lòng",
                                            textAlign: TextAlign.left,
                                          ),
                                          margin: const EdgeInsets.fromLTRB(
                                              0, 0, 120, 0),
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.star_outlined),
                                              color: Colors.yellow,
                                            ),
                                            IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.star_outlined),
                                              color: Colors.yellow,
                                            ),
                                            IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.star_outlined),
                                              color: Colors.yellow,
                                            ),
                                            IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.star_outlined),
                                              color: Colors.yellow,
                                            ),
                                            IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.star_outlined),
                                              color: Colors.yellow,
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Text(
                                    "Nhận sách trước thời hạn giao hàng. Sách không được bọc lại nên gáy hơi móp xíu nhưng không sao. Sách thơm và nội dung đọc okay lắm. Cảm ơn shop và anh shipper ạ.")
                              ],
                            ),
                            padding: const EdgeInsets.fromLTRB(40, 10, 40, 20),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0.5, color: Colors.grey))),
                        Container(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons
                                          .supervised_user_circle_outlined),
                                      color: Colors.lightGreen,
                                      iconSize: 60,
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          child: Text(
                                            "Cực kỳ hài lòng",
                                            textAlign: TextAlign.left,
                                          ),
                                          margin: const EdgeInsets.fromLTRB(
                                              0, 0, 120, 0),
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.star_outlined),
                                              color: Colors.yellow,
                                            ),
                                            IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.star_outlined),
                                              color: Colors.yellow,
                                            ),
                                            IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.star_outlined),
                                              color: Colors.yellow,
                                            ),
                                            IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.star_outlined),
                                              color: Colors.yellow,
                                            ),
                                            IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.star_outlined),
                                              color: Colors.yellow,
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Text(
                                    "Nhận sách trước thời hạn giao hàng. Sách không được bọc lại nên gáy hơi móp xíu nhưng không sao. Sách thơm và nội dung đọc okay lắm. Cảm ơn shop và anh shipper ạ.")
                              ],
                            ),
                            padding: const EdgeInsets.fromLTRB(40, 10, 40, 20),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0.5, color: Colors.grey))),
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    margin: const EdgeInsets.fromLTRB(5, 20, 5, 20),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    ));
  }
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
