import 'package:flutter/material.dart';
import 'package:hkl_books/DB/dbconfig.dart';
import 'package:hkl_books/provider/accountprovider.dart';
import 'package:hkl_books/screens/account/components/my_show_dialog.dart';
import 'package:hkl_books/screens/main_screen/main_screen.dart';
import 'package:hkl_books/screens/register/register.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  login(email, password) {}
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool validatePassword = false, validateEmail = false;
  String validateEmailMessage = "", validatePasswordMessage = "";
  @override
  void initState() {
    email = TextEditingController();
    password = TextEditingController();
    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đăng Nhập'),
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
                        controller: email,
                        decoration: InputDecoration(
                          errorText:
                              validateEmail ? validateEmailMessage : null,
                          prefixIcon: const Icon(Icons.account_circle,
                              color: Colors.green, size: 25),
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
                        controller: password,
                        obscureText: true,
                        decoration: InputDecoration(
                          errorText:
                              validatePassword ? validatePasswordMessage : null,
                          prefixIcon: const Icon(
                            Icons.vpn_key_outlined,
                            color: Colors.green,
                            size: 25,
                          ),
                          labelText: 'Mật khẩu',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ),
                    ),
                    Consumer<AccountProvider>(
                      builder: (context, data, child) {
                        return ElevatedButton(
                          child: const Text(
                            "Đăng nhập",
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
                            if (email.text.isEmpty || password.text.isEmpty) {
                              setState(() {
                                email.text.isEmpty
                                    ? {
                                        validateEmail = true,
                                        validateEmailMessage =
                                            'Vui lòng điền Email!'
                                      }
                                    : validateEmail = false;
                                password.text.isEmpty
                                    ? {
                                        validatePassword = true,
                                        validatePasswordMessage =
                                            'Vui lòng điền Mật khẩu'
                                      }
                                    : validatePassword = false;
                              });
                            } else {
                              await Provider.of<AccountProvider>(context,
                                      listen: false)
                                  .login(email.text, password.text);
                              setState(() {
                                if (data.account.status == 401) {
                                  validateEmail = true;
                                  validateEmailMessage =
                                      'Email chưa đăng ký tài khoản!';
                                  // ShowDialog(
                                  //     context, 'Email chưa đăng ký tài khoản!');
                                } else {
                                  validateEmail = false;
                                }

                                if (data.account.status == 402) {
                                  validatePassword = true;
                                  validatePasswordMessage =
                                      'Mật khẩu không đúng!';
                                  // ShowDialog(
                                  //     context, 'Email chưa đăng ký tài khoản!');
                                } else {
                                  validatePassword = false;
                                }
                              });
                              if (data.account.status! < 400) {
                                myShowDialog(context, 'Đăng Nhập thành công!');
                                DBConfig.instance.insertAccount(data.account);
                                Future.delayed(
                                    const Duration(seconds: 1),
                                    () => Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const MainScreen()),
                                        (route) => false));
                              }
                            }
                          },
                        );
                      },
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Register()));
                              },
                              child: const Text(
                                "Đăng ký ngay!",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.blue),
                              )),
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Quên mật khẩu?",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.blue),
                              )),
                        ],
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 13, 0, 0),
                          width: 350,
                          height: 1,
                          color: Colors.black,
                          child: const Padding(padding: EdgeInsets.all(9.0)),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(155, 0, 100, 0),
                          color: Colors.white,
                          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                          child: const Text(
                            "Hoặc",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                        ),
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
                                    icon: const Icon(
                                      Icons.facebook,
                                      color: Colors.blue,
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                                decoration: const ShapeDecoration(
                                  color: Colors.white,
                                  shape: CircleBorder(
                                      side: BorderSide(
                                          width: 1, color: Colors.blue)),
                                ),
                              ),
                              Container(
                                width: 50,
                                height: 50,
                                child: Center(
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.g_mobiledata_outlined,
                                      color: Colors.deepOrangeAccent,
                                      size: 35,
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                                decoration: const ShapeDecoration(
                                  color: Colors.white,
                                  shape: CircleBorder(
                                      side: BorderSide(
                                          width: 1, color: Colors.deepOrange)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
