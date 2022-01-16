import 'package:flutter/material.dart';
import 'package:hkl_books/DB/dbconfig.dart';
import 'package:hkl_books/config.dart';
import 'package:hkl_books/models/account.dart';

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
      child: FutureBuilder(
        future: DBConfig.instance.getAccount(),
        builder: (context, AsyncSnapshot<AccountModel> snapshot) {
          if (snapshot.hasData) {
            return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(75)),
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/${snapshot.data!.avatar.toString()}')))),
                  const SizedBox(height: 15),
                  Text(snapshot.data!.name.toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                  const SizedBox(height: 5),
                  Text(snapshot.data!.id.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                      ))
                ]);
          }
          return Container();
        },
      ),
    );
  }
}
