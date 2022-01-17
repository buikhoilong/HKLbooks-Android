// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hkl_books/config.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late bool acceptTermOfUse = false;
  late bool showPassword = false;
  late bool showConfirmPassword = false;
  late Icon showIcon = Icon(Icons.remove_red_eye_outlined);
  late Icon showConfirmIcon = Icon(Icons.remove_red_eye_outlined);
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  @override
  void initState() {
    acceptTermOfUse = false;
    showPassword = false;
    showConfirmPassword = false;
    showIcon = Icon(Icons.remove_red_eye_outlined);
    showConfirmIcon = Icon(Icons.remove_red_eye_outlined);

    email = TextEditingController();
    password = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đăng Ký'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Image.asset('assets/images/dbb6baefe5452d1b7454.jpg',
                    height: 170, width: 800, fit: BoxFit.cover),
              ),
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.account_circle,
                              color: Colors.green, size: 25),
                          labelText: 'Họ và Tên',
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
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: Colors.green,
                            size: 25,
                          ),
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                      child: TextFormField(
                        obscureText: !showPassword,
                        validator: (String? value) {
                          if (value!.trim().isEmpty) {
                            return 'Password is required';
                          }
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.vpn_key_outlined,
                            color: Colors.green,
                            size: 25,
                          ),
                          labelText: 'Mật khẩu',
                          suffixIcon: SizedBox(
                            height: 20,
                            child: IconButton(
                              splashColor: Color.fromARGB(0, 0, 0, 0),
                              padding: EdgeInsets.only(right: 15),
                              iconSize: 25,
                              icon: showIcon,
                              color: Colors.black,
                              onPressed: () {
                                setState(() {
                                  showPassword = !showPassword;
                                  if (showPassword == true) {
                                    showIcon = Icon(Icons.remove_red_eye);
                                  } else {
                                    showIcon =
                                        Icon(Icons.remove_red_eye_outlined);
                                  }
                                });
                              },
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                      child: TextField(
                        obscureText: !showConfirmPassword,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.vpn_key_outlined,
                            color: Colors.green,
                            size: 25,
                          ),
                          labelText: 'Xác nhận mật khẩu',
                          suffixIcon: SizedBox(
                            height: 20,
                            child: IconButton(
                              splashColor: Color.fromARGB(0, 0, 0, 0),
                              padding: EdgeInsets.only(right: 15),
                              iconSize: 25,
                              icon: showConfirmIcon,
                              color: Colors.black,
                              onPressed: () {
                                setState(() {
                                  showConfirmPassword = !showConfirmPassword;
                                  if (showConfirmPassword == true) {
                                    showConfirmIcon =
                                        Icon(Icons.remove_red_eye);
                                  } else {
                                    showConfirmIcon =
                                        Icon(Icons.remove_red_eye_outlined);
                                  }
                                });
                              },
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(15, 5, 45, 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Checkbox(
                            activeColor: myGreen,
                            value: acceptTermOfUse,
                            onChanged: (value) {
                              setState(() {
                                acceptTermOfUse = value!;
                              });
                            },
                          ),
                          Text(
                            "Tôi đồng ý với các điều khoản sử dụng!",
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: ElevatedButton(
                        child: const Text(
                          "Đăng Ký",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(355, 55),
                            primary: Colors.green,
                            side:
                                const BorderSide(width: 2, color: Colors.green),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        onPressed: () {},
                      ),
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Tìm lại tài khoản",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.blue),
                                )),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Đã có tài khoản? Đăng nhập ngay!",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.blue),
                                )),
                          ]),
                    ),
                  ],
                ),
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
