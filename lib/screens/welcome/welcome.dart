import 'package:flutter/material.dart';
import 'package:hkl_books/screens/main_screen/main_screen.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            Container(
              child: Image.asset(
                'assets/images/64953cce6364ab3af275.jpg',
                fit: BoxFit.cover,
                width: 1000,
              ),
            ),
            // ignore: avoid_unnecessary_containers
            Container(
              margin: const EdgeInsets.fromLTRB(30, 50, 50, 50),
              child: Column(
                children: [
                  // ignore: avoid_unnecessary_containers
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                    child: const Text(
                      'Chào mừng bạn đến với ứng dụng',
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontFamily: "BalihoScript",
                        fontSize: 50,
                        height: 1.5,
                        color: Colors.white,
                        wordSpacing: 6,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // ignore: avoid_unnecessary_containers
                  Container(
                    child: Column(
                      children: [
                        // ignore: avoid_unnecessary_containers
                        Container(
                          child: Row(
                            children: const [
                              Icon(Icons.menu_book_rounded,
                                  color: Colors.white),
                              Text(
                                "  CUNG CẤP CÁC ĐẦU SÁCH MỚI NHẤT.",
                                style: TextStyle(
                                    fontSize: 14.5,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        // ignore: avoid_unnecessary_containers
                        Container(
                          child: Row(
                            children: const [
                              Icon(Icons.menu_book_rounded,
                                  color: Colors.white),
                              Text(
                                "  CÓ HƠN 1000+ ĐẦU SÁCH KHÁC NHAU.",
                                style: TextStyle(
                                    fontSize: 14.5,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        // ignore: avoid_unnecessary_containers
                        Container(
                          child: Row(
                            children: const [
                              Icon(Icons.menu_book_rounded,
                                  color: Colors.white),
                              Text(
                                "  NHIỀU THỂ LOẠI PHÙ HỢP VỚI TỪNG NGƯỜI",
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                    fontSize: 14.5,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // ignore: avoid_unnecessary_containers
                  Container(
                    child: Image.asset(
                      'assets/images/Reading_Book_01.png',
                      width: 2000,
                      height: 260,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // ignore: avoid_unnecessary_containers
                  Container(
                    child: ElevatedButton(
                      child: const Text(
                        "Bắt đầu",
                        style: TextStyle(
                            color: Colors.lightGreen,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(135, 55),
                          primary: Colors.white,
                          side: const BorderSide(width: 2, color: Colors.green),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MainScreen()),
                            (route) => false);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
