import 'package:flutter/material.dart';

myShowDialog(context, text) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(text,
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
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Đóng'))
                ],
              ),
            ),
          ],
        );
      });
}
