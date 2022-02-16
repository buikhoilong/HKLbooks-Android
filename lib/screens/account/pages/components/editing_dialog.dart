import 'package:flutter/material.dart';
import 'package:hkl_books/screens/account/components/my_show_dialog.dart';

showDialogEdit(
    context, String name, TextEditingController editedValue, hintText) {
  TextEditingController confirmPass = TextEditingController();
  bool isPassword = false;
  TextInputType inputType = TextInputType.name;

  if (name == 'Mật khẩu') {
    isPassword = true;
    inputType = TextInputType.visiblePassword;
  }
  if (name == 'Số điện thoại') {
    inputType = TextInputType.phone;
  }

  if (name == 'Sinh nhật') {
    inputType = TextInputType.datetime;
  }

  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Cập nhật ' + name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 18,
              letterSpacing: 0.5,
            )),
        actions: [
          Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                      keyboardType: inputType,
                      obscureText: isPassword,
                      autofocus: true,
                      controller: editedValue,
                      decoration: InputDecoration(
                        hintText: hintText,
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        contentPadding: const EdgeInsets.only(
                            left: 15, bottom: 11, top: 11, right: 15),
                      )),
                ),
                const SizedBox(
                  height: 5,
                ),
                if (name == 'Mật khẩu') ...[
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                        // autofocus: true,
                        keyboardType: inputType,
                        obscureText: isPassword,
                        controller: confirmPass,
                        decoration: const InputDecoration(
                          hintText: 'Xác nhận mật khẩu',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          contentPadding: EdgeInsets.only(
                              left: 15, bottom: 11, top: 11, right: 15),
                        )),
                  ),
                ],
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          editedValue.text.isEmpty
                              ? myShowDialog(
                                  context, 'Vui lòng nhập ' + name + ' mới')
                              : null;
                          if (name == 'Mật khẩu') {
                            editedValue.text != confirmPass.text
                                ? myShowDialog(
                                    context, 'Mật khẩu không trùng khớp!')
                                : null;
                          }
                        },
                        child: const Text('Cập nhật')),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Hủy')),
                  ],
                )
              ],
            ),
          ),
        ],
      );
    },
  );
}
