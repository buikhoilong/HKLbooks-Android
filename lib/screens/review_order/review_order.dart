import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ReviewOrder extends StatefulWidget {
  const ReviewOrder({Key? key}) : super(key: key);

  @override
  _ReviewOrderState createState() => _ReviewOrderState();
}

class _ReviewOrderState extends State<ReviewOrder> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Review Order',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          ),
        ),
        body: ListView(
          children: [
            // ignore: avoid_unnecessary_containers
            Container(
              height: 250,
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "Đánh Giá  - Nhận Xét Từ Khách Hàng",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  // ignore: avoid_unnecessary_containers
                  Container(
                    // child: RatingBar.builder(
                    //   initialRating: 3,
                    //   minRating: 1,
                    //   direction: Axis.horizontal,
                    //   allowHalfRating: true,
                    //   itemCount: 5,
                    //   itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    //   itemBuilder: (context, _) => const Icon(
                    //     Icons.star,
                    //     color: Colors.amber,
                    //   ),
                    //   onRatingUpdate: (rating) {
                    //     // ignore: avoid_print
                    //     print(rating);
                    //   },
                    // ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.star_border),
                          color: Colors.grey,
                          iconSize: 50,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.star_border),
                          color: Colors.grey,
                          iconSize: 50,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.star_border),
                          color: Colors.grey,
                          iconSize: 50,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.star_border),
                          color: Colors.grey,
                          iconSize: 50,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.star_border),
                          color: Colors.grey,
                          iconSize: 50,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // ignore: avoid_unnecessary_containers
            Container(
              child: Column(
                children: [
                  // ignore: avoid_unnecessary_containers
                  Container(
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const SizedBox(
                          width: 80,
                          height: 80,
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/avatar.jpg'),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          "Đỗ Quang Huy",
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  ),
                  // ignore: avoid_unnecessary_containers
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                      child: TextField(
                        maxLines: 12,
                        cursorColor: Colors.black,
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                          labelText: "Bình luận",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                  )
                ],
              ),
            ),
          ],
        ),
      );
}
