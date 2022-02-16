// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hkl_books/config.dart';
import 'package:hkl_books/provider/accountprovider.dart';
import 'package:hkl_books/screens/account/components/my_show_dialog.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late bool acceptTermOfUse = true;
  late bool showPassword = false, showConfirmPassword = false;

  late Icon showIcon = Icon(Icons.remove_red_eye_outlined),
      showConfirmIcon = Icon(Icons.remove_red_eye_outlined);

  late TextEditingController name = TextEditingController(),
      email = TextEditingController(),
      phone = TextEditingController(),
      password = TextEditingController(),
      confirmPassword = TextEditingController(),
      address = TextEditingController();

  late bool validateName = false,
      validateEmail = false,
      validatePassword = false,
      validateConfirmPassword = false,
      validatePhone = false,
      validateAddress = false;
  String validateEmailMessage = "", validatePhoneMessage = "";

  @override
  void initState() {
    acceptTermOfUse = false;
    showPassword = false;
    showConfirmPassword = false;
    showIcon = Icon(Icons.remove_red_eye_outlined);
    showConfirmIcon = Icon(Icons.remove_red_eye_outlined);

    name = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    confirmPassword = TextEditingController();
    address = TextEditingController();
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
                        keyboardType: TextInputType.name,
                        controller: name,
                        decoration: InputDecoration(
                          errorText:
                              validateName ? 'Vui lòng điền Họ và Tên' : null,
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
                        controller: email,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          errorText:
                              validateEmail ? validateEmailMessage : null,
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
                      child: TextField(
                        controller: phone,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          errorText:
                              validatePhone ? validatePhoneMessage : null,
                          prefixIcon: const Icon(Icons.phone_android,
                              color: Colors.green, size: 25),
                          labelText: 'Số điện thoại',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                      child: TextFormField(
                        controller: password,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: !showPassword,
                        decoration: InputDecoration(
                          errorText: validatePassword
                              ? 'Vui lòng điền Mật khẩu'
                              : null,
                          prefixIcon: const Icon(
                            Icons.vpn_key_outlined,
                            color: Colors.green,
                            size: 25,
                          ),
                          labelText: 'Mật khẩu',
                          suffixIcon: Container(
                            width: 13   ,
                            height: 13,
                            margin: EdgeInsets.only(right: 15),
                            child: IconButton(
                              // splashColor: Color.fromARGB(0, 0, 0, 0),
                              // padding: EdgeInsets.only(right: 15),
                              // iconSize: 25,
                              icon: showIcon,
                              color: myGreen,
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
                        controller: confirmPassword,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: !showConfirmPassword,
                        decoration: InputDecoration(
                          errorText: validateConfirmPassword
                              ? 'Mậu khẩu không trùng khớp!'
                              : null,
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                      child: TextField(
                        keyboardType: TextInputType.streetAddress,
                        controller: address,
                        decoration: InputDecoration(
                          errorText: validateAddress
                              ? 'Vui lòng điền Địa chỉ (nhận hàng)'
                              : null,
                          prefixIcon: const Icon(Icons.home,
                              color: Colors.green, size: 25),
                          labelText: 'Địa chỉ',
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
                      child: Consumer<AccountProvider>(
                        builder: (context, data, child) {
                          return ElevatedButton(
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
                                side: const BorderSide(
                                    width: 2, color: Colors.green),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50))),
                            onPressed: () async {
                              if (name.text.isEmpty ||
                                  email.text.isEmpty ||
                                  phone.text.isEmpty ||
                                  password.text.isEmpty ||
                                  confirmPassword.text.isEmpty ||
                                  address.text.isEmpty) {
                                setState(() {
                                  // print('Name: ' + name.text);
                                  name.text.isEmpty
                                      ? validateName = true
                                      : validateName = false;
                                  email.text.isEmpty
                                      ? {
                                          validateEmail = true,
                                          validateEmailMessage =
                                              'Vui lòng điền Email!'
                                        }
                                      : validateEmail = false;
                                  phone.text.isEmpty
                                      ? {
                                          validatePhone = true,
                                          validatePhoneMessage =
                                              'Vui lòng điền Số điện thoại!'
                                        }
                                      : validateEmail = false;
                                  password.text.isEmpty
                                      ? validatePassword = true
                                      : validatePassword = false;
                                  confirmPassword.text != password.text
                                      ? validateConfirmPassword = true
                                      : validateConfirmPassword = false;
                                  address.text.isEmpty
                                      ? validateAddress = true
                                      : validateAddress = false;
                                });
                              } else {
                                await Provider.of<AccountProvider>(context,
                                        listen: false)
                                    .register(name.text, email.text, phone.text,
                                        password.text, address.text);
                                if (data.account.status == 401) {
                                  setState(() {
                                    validateEmail = true;
                                    validateEmailMessage = 'Email đã tồn tại!';
                                    validatePhone = false;
                                  });
                                } else if (data.account.status == 402) {
                                  setState(() {
                                    validateEmail = false;
                                    validatePhone = true;
                                    validatePhoneMessage =
                                        'Số điện thoại đã tồn tại!';
                                  });
                                } else {
                                  validateEmail = false;
                                  validatePhone = false;
                                  myShowDialog(context, 'Đăng Ký thành công!');
                                  Future.delayed(const Duration(seconds: 1),
                                      () => Navigator.pop(context));
                                }
                              }
                            },
                          );
                        },
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
