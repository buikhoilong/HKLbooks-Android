/*
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hkl_books/provider/bookprovider.dart';
import 'package:provider/provider.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //create ChangeNotifierProvider
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<BookProvider>(create: (_) => BookProvider()),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: ProviderDemoScreen(),
        ));
  }
}

class ProviderDemoScreen extends StatefulWidget {
  const ProviderDemoScreen({Key? key}) : super(key: key);

  @override
  _ProviderDemoScreenState createState() => _ProviderDemoScreenState();
}

class _ProviderDemoScreenState extends State<ProviderDemoScreen> {
  @override
  void initState() {
    super.initState();
    final booksMdl = Provider.of<BookProvider>(context, listen: false);
    booksMdl.getProduct(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Books"),
      ),
      body: Consumer<BookProvider>(builder: (context, state, child) {
        return ListView.builder(
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(20),
                child: state.loading
                    ? const CircularProgressIndicator()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 40, bottom: 20),
                            child: Text(
                              state.books[index].name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                          Image.asset(
                            'assets/images/${state.books[index].imgPath}',
                          ),
                          Text(state.books[index].author),
                          Text(state.books[index].detail),
                        ],
                      ),
              );
            });
      }),
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hkl_books/config.dart';
import 'package:hkl_books/provider/bookprovider.dart';
import 'package:provider/provider.dart';
import 'components/list_items.dart';
import 'components/session_title.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  void initState() {
    super.initState();
    final booksMdl = Provider.of<BookProvider>(context, listen: false);
    booksMdl.getProduct(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: myGreen,
        toolbarHeight: 90,
        leading: const Icon(Icons.list, size: 45),
        title: TextField(
          decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.white,
              size: 25,
            ),
            hintText: 'Nhập từ khóa tìm kiếm',
            hintStyle: const TextStyle(color: Colors.white),
            fillColor: Colors.white38,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          style: const TextStyle(color: myGrey),
        ),
      ),
      body: Consumer<BookProvider>(builder: (context, state, child) {
        Image.asset('assets/images/Untitled.png');
        const SessionTitle(title: "Sách mới nhất");
        return ListView.builder(
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Container(
                child: state.loading
                    ? const CircularProgressIndicator()
                    : Column(
                        children: [
                          Container(
                              margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Image.asset(
                                          'assets/images/${state.books[index].imgPath}',
                                          width: 100,
                                          height: 150,
                                          fit: BoxFit.cover),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(60),
                                          color: Colors.amber),
                                    ),
                                    /*Text(
                                      state.books[index].name,
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),*/
                                    Text(
                                      state.books[index].author,
                                      style: const TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ]),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 0.3, color: Colors.grey),
                                borderRadius: BorderRadius.circular(20),
                              )),
                        ],
                      ),
              );
            });
      }),
    );
  }
}
