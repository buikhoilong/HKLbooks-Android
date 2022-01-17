import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hkl_books/config.dart';

class ReviewOrder extends StatefulWidget {
  const ReviewOrder({Key? key}) : super(key: key);

  @override
  _ReviewOrderState createState() => _ReviewOrderState();
}

class _ReviewOrderState extends State<ReviewOrder> {
  double rating = 0;
  String feedback = "";

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
        body: ListView(children: [
          // ignore: avoid_unnecessary_containers
          Container(
            //height: double.maxFinite,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Đánh Giá: $rating",
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const Icon(Icons.star, color: Colors.amber, size: 30),
                  ],
                ),
                const SizedBox(height: 20),
                // ignore: avoid_unnecessary_containers
                Container(
                  child: RatingBar.builder(
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    updateOnDrag: true,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      setState(() {
                        this.rating = rating;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
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
                    Container(
                      child: Expanded(
                        child: Container(
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
                      ),
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          color: myGreen,
                          child: const Text(
                            "Gửi đánh giá",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ]),
      );
}
