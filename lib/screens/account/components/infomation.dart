import 'package:flutter/material.dart';
import 'package:hkl_books/config.dart';

class Infomation extends StatelessWidget {
  const Infomation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(50),
      decoration: const BoxDecoration(
        color: myGreen,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(75)),
                    image: DecorationImage(
                        image:
                            AssetImage('assets/images/avatar.jpg')))),
            const SizedBox(height: 15),
            const Text('Đỗ Quang Huy',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
            const SizedBox(height: 5),
            const Text('ID: USER20211227001',
                style: TextStyle(
                  color: Colors.white,
                ))
          ]),
    );
  }
}