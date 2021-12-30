import 'package:flutter/material.dart';

class Notify extends StatefulWidget {
  const Notify({Key? key}) : super(key: key);

  @override
  _NotifyState createState() => _NotifyState();
}

class _NotifyState extends State<Notify> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Notifications',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,

          // leading: IconButton(
          //   onPressed: () {},
          //   icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          // ),
        ),
        backgroundColor: Colors.white,
        body: ListView.separated(
          padding: const EdgeInsets.all(10),
          itemCount: 20,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/logo.png'),
                      fit: BoxFit.cover),
                ),
              ),
              title: const Text(
                'HKLbooks',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              subtitle: const Text(
                'Thanks for download HKLbooks app.',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
        ),
      );
}
