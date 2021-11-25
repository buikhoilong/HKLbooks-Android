// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

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
                      IconButton(
                      onPressed: (){}, 
                      icon: Icon(Icons.arrow_back_ios,color: Colors.white,)
                    ),
                        Text(
                      "Đăng Ký",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
              height: 50, 
              padding: const EdgeInsets.fromLTRB(30, 5, 170, 5),
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
                          labelText: 'Tên đăng nhập',
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
                          prefixIcon: const Icon(Icons.email_outlined,color: Colors.green,size: 25,),
                          labelText: 'Email',
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

                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.vpn_key_outlined,color: Colors.green,size: 25,),
                          labelText: 'Xác nhận mật khẩu',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ),
                    ),

                    // ignore: avoid_unnecessary_containers
                    Container(
                      margin: const EdgeInsets.fromLTRB(15, 5 , 45, 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {}, 
                            icon: Icon(Icons.check_box_outlined,),color: Colors.grey,),
                          Text(
                            "Tôi đồng ý với các điều khoản sử dụng!",
                            style: TextStyle(
                              fontSize: 15
                            ),
                          ),
                        ],
                      ),
                    ),

                    // ignore: avoid_unnecessary_containers
                    Container(
                      child: ElevatedButton(
                        child: const Text(
                          "Đăng Ký",
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
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: (){},
                            child: Text(
                              "Tìm lại tài khoản",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.blue
                              ),
                            )
                          ),
                          TextButton(
                            onPressed: (){},
                            child: Text(
                              "Đã có tài khoản? Đăng nhập ngay!",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.blue
                              ),
                            )
                          ),
                        ]
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