import 'package:flutter/material.dart';

void main() => runApp(const Notification());

class Notification extends StatelessWidget {
  const Notification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyCustomState createState() => _MyCustomState();
}

class _MyCustomState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Notifications',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.lightGreen,
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          ),
        ),
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
                      image: AssetImage('images/logo.png'), fit: BoxFit.cover),
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
