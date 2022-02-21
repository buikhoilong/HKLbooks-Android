import 'package:flutter/material.dart';
import 'package:hkl_books/DB/dbconfig.dart';
import 'package:hkl_books/config.dart';
import 'package:hkl_books/models/account.dart';
import 'package:hkl_books/models/book2.dart';
import 'package:hkl_books/models/cart.dart';
import 'package:hkl_books/provider/cartprovider.dart';
import 'package:hkl_books/screens/thanks/thanks.dart';
import 'package:provider/provider.dart';
import 'components/cart_item.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Cart> carts = [];
  List<Book2> books = [];
  int total = 0;
  late AccountModel account;

  @override
  void initState() {
    DBConfig.instance.getAccount();
    account = DBConfig.instance.account;
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    cartProvider.getCarts(account.id);
    carts = cartProvider.carts;
    books = cartProvider.books;
    total = cartProvider.total;
    
    super.initState();
  }

  getListItem(cartList, bookList) {
    List<Widget> list = [];
    for (var i = 0; i < cartList.length; i++) {
      list.add(CartItem(cart: cartList[i], book: bookList[i]));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        // decoration: BoxDecoration(
        //   color: Colors.greenAccent[100],
        //   borderRadius: BorderRadius.only(
        //       topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        // ),
        // color: Colors.grey[200],
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Tổng cộng\n',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: formatMoney.format(total),
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.lightGreen,
                padding: const EdgeInsets.all(15),
              ),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Thanks())),
              child: const Text(
                'Thanh Toán',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Giỏ hàng",
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          //items
          Column(
            children: getListItem(carts, books),
          ),
          const SizedBox(height: 30),

          //Địa chỉ nhận hảng
          const SizedBox(height: 20),
          const Divider(
            color: Colors.grey,
          ),
          const SizedBox(height: 20),
          Container(
            alignment: Alignment.center,
            child: const Text(
              'Nhập địa chỉ nhận hàng',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.account_circle,
                  color: Colors.green,
                  size: 25,
                ),
                labelText: 'Tên người nhận',
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
                  Icons.account_circle,
                  color: Colors.green,
                  size: 25,
                ),
                labelText: 'Số điện thoại',
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
                  Icons.account_circle,
                  color: Colors.green,
                  size: 25,
                ),
                labelText: 'Địa chỉ nhận hàng',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),
          const Divider(
            color: Colors.grey,
          ),

          // Hình thức thanh toán
          const SizedBox(height: 20),
          Container(
            alignment: Alignment.center,
            child: const Text(
              'Hình thức thanh toán',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 50),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            // width: 200,
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: choose,
                isExpanded: true,
                icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
                items: listChoose.map(buildMenuItems).toList(),
                onChanged: (choose) => setState(() => this.choose = choose),
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),

      // Container(
      //   color: Colors.white,
      //   child: ListView(
      //     children: [
      //       const SizedBox(height: 20),

      //       //Sản phẩm
      //       // carts.map((e) => CartItem(cart: e))
      //       // CartItem(
      //       //   cart:Cart(),
      //       // ),
      //       // CartItem(
      //       //   cart: carts[1],
      //       // ),
      //       // CartItem(
      //       //   cart: carts[2],
      //       // ),
      //       const SizedBox(height: 30),

      //       //Địa chỉ nhận hảng
      //       const SizedBox(height: 20),
      //       const Divider(
      //         color: Colors.grey,
      //       ),
      //       const SizedBox(height: 20),
      //       Container(
      //         alignment: Alignment.center,
      //         child: const Text(
      //           'Nhập địa chỉ nhận hàng',
      //           style: TextStyle(
      //             color: Colors.black,
      //             fontSize: 25,
      //           ),
      //         ),
      //       ),
      //       const SizedBox(height: 20),
      //       Padding(
      //         padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
      //         child: TextField(
      //           decoration: InputDecoration(
      //             prefixIcon: const Icon(
      //               Icons.account_circle,
      //               color: Colors.green,
      //               size: 25,
      //             ),
      //             labelText: 'Tên người nhận',
      //             border: OutlineInputBorder(
      //               borderRadius: BorderRadius.circular(100),
      //             ),
      //           ),
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
      //         child: TextField(
      //           decoration: InputDecoration(
      //             prefixIcon: const Icon(
      //               Icons.account_circle,
      //               color: Colors.green,
      //               size: 25,
      //             ),
      //             labelText: 'Số điện thoại',
      //             border: OutlineInputBorder(
      //               borderRadius: BorderRadius.circular(100),
      //             ),
      //           ),
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
      //         child: TextField(
      //           decoration: InputDecoration(
      //             prefixIcon: const Icon(
      //               Icons.account_circle,
      //               color: Colors.green,
      //               size: 25,
      //             ),
      //             labelText: 'Địa chỉ nhận hàng',
      //             border: OutlineInputBorder(
      //               borderRadius: BorderRadius.circular(100),
      //             ),
      //           ),
      //         ),
      //       ),

      //       const SizedBox(height: 20),
      //       const Divider(
      //         color: Colors.grey,
      //       ),

      //       // Hình thức thanh toán
      //       const SizedBox(height: 20),
      //       Container(
      //         alignment: Alignment.center,
      //         child: const Text(
      //           'Hình thức thanh toán',
      //           style: TextStyle(
      //             color: Colors.black,
      //             fontSize: 25,
      //           ),
      //         ),
      //       ),
      //       const SizedBox(height: 10),
      //       Container(
      //         margin: const EdgeInsets.symmetric(horizontal: 50),
      //         padding: const EdgeInsets.symmetric(horizontal: 20),
      //         // width: 200,
      //         alignment: Alignment.bottomCenter,
      //         decoration: BoxDecoration(
      //           border: Border.all(color: Colors.grey),
      //         ),
      //         child: DropdownButtonHideUnderline(
      //           child: DropdownButton<String>(
      //             value: choose,
      //             isExpanded: true,
      //             icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
      //             items: listChoose.map(buildMenuItems).toList(),
      //             onChanged: (choose) => setState(() => this.choose = choose),
      //           ),
      //         ),
      //       ),
      //       const SizedBox(height: 150),
      //       const Divider(
      //         color: Colors.black,
      //       ),

      //       // Thanh toán
      //       const SizedBox(height: 20),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //         children: [
      //           RichText(
      //             text: TextSpan(
      //               children: [
      //                 const TextSpan(
      //                   text: 'Tổng cộng\n',
      //                   style: TextStyle(
      //                     fontSize: 25,
      //                     color: Colors.black,
      //                   ),
      //                 ),
      //                 TextSpan(
      //                   text: formatMoney.format(totalOrder),
      //                   style: const TextStyle(
      //                     fontSize: 25,
      //                     color: Colors.red,
      //                     fontWeight: FontWeight.bold,
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //           ElevatedButton(
      //             style: ElevatedButton.styleFrom(
      //               primary: Colors.lightGreen,
      //               padding: const EdgeInsets.all(15),
      //             ),
      //             onPressed: () => Navigator.push(context,
      //                 MaterialPageRoute(builder: (context) => const Thanks())),
      //             child: const Text(
      //               'Thanh Toán',
      //               style: TextStyle(
      //                 color: Colors.white,
      //                 fontSize: 25,
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //       const SizedBox(height: 30),
      //     ],
      //   ),
      // ),
    );
  }

  final listChoose = ["Tiền mặt", "Ví Momo", "Thẻ ngân hàng"];
  String? choose = "Tiền mặt";
  DropdownMenuItem<String> buildMenuItems(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      );
}
