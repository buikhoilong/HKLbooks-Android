// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            // ignore: avoid_unnecessary_containers
            Container(
            child: Column(
            children: <Widget> [
              // ignore: avoid_unnecessary_containers
              Container(
                child: Row(
                      children: [
                        Text(
                      "Đăng nhập",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                      textAlign: TextAlign.center,
                    ),
                    IconButton(
                      onPressed: (){}, 
                      icon: Icon(Icons.clear,color: Colors.white,)
                    ),
                    ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
              height: 50, 
              padding: const EdgeInsets.fromLTRB(160, 10, 40, 10),
              color: Colors.lightGreen,
              ),
              // ignore: avoid_unnecessary_containers
              Container(
                margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Image.asset('images/dbb6baefe5452d1b7454.jpg',height: 170,width: 800,fit: BoxFit.cover),
              ),
              // ignore: avoid_unnecessary_containers
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.account_circle,color: Colors.green,size: 25 ),
                          labelText: 'Tên đăng nhập/Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ),
                    ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.vpn_key_outlined,color: Colors.green,size: 25,),
                          labelText: 'Mật khẩu',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ),
                    ),
                    // ignore: avoid_unnecessary_containers
                    Container(
                      child: ElevatedButton(
                        child: const Text(
                          "Đăng nhập",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(355, 55),
                          primary: Colors.green,
                          side: const BorderSide(width: 2, color: Colors.green),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)
                          )
                        ),
                        onPressed: (){},
                      ),
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    ),

                    // ignore: avoid_unnecessary_containers
                    Container(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: (){},
                            child: Text(
                              "Đăng ký ngay!",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.blue
                              ),
                            )
                          ),
                          TextButton(
                            onPressed: (){},
                            child: Text(
                              "Quên mật khẩu?",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.blue
                              ),
                            )
                          ),
                        ],
                      ),
                    ),

                    // ignore: avoid_unnecessary_containers
                    Container(
                      child: Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(10, 13, 0, 0),
                            width: 350,
                            height: 1,
                            color: Colors.black,
                            child: Padding(
                              padding: const EdgeInsets.all(9.0)
                              
                            ),
                          ),
                          // ignore: avoid_unnecessary_containers
                          Container(
                            margin: const EdgeInsets.fromLTRB(155, 0, 100, 0),
                            color: Colors.white,
                            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                            child: Text(
                              "Hoặc",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15
                              ),
                            ),
                          ),
                          // ignore: avoid_unnecessary_containers
                          Container(
                            margin: const EdgeInsets.fromLTRB(100, 35, 100, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  child: Center(
                                    child: IconButton(
                                      icon: Icon(Icons.facebook,color: Colors.blue,),
                                      onPressed: (){},
                                    ),
                                  ),
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: CircleBorder(
                                      side: BorderSide(
                                        width: 1,
                                        color: Colors.blue
                                      )
                                    ),
                                  ),
                                ), 

                                Container(
                                  width: 50,
                                  height: 50,
                                  child: Center(
                                    child: IconButton(
                                      icon: Icon(Icons.backpack,color: Colors.deepOrangeAccent,),
                                      onPressed: (){},
                                    ),
                                  ),
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: CircleBorder(
                                      side: BorderSide(
                                        width: 1,
                                        color: Colors.deepOrange
                                      )
                                    ),
                                  ),
                                ), 

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
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