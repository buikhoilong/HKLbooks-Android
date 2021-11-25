import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

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

Row _product(String _img, double _w, double _h, String _name,
    String _totalPrice, String _quantity) {
  return Row(
    children: [
      Container(
        alignment: Alignment.topLeft,
        child: Image.asset(_img, width: _w, height: _h),
      ),
      Column(
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '$_name\n',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: '\nTổng tiền: $_totalPrice\n',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.red,
                  ),
                ),
                const TextSpan(
                  text: '\nSố lượng\n',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.remove,
                        color: Colors.black,
                        size: 10,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 70,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Text(
                      _quantity,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.add,
                        color: Colors.black,
                        size: 10,
                      ),
                      onPressed: () => {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      const SizedBox(width: 30),
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.delete,
          color: Colors.black,
        ),
      ),
    ],
  );
}

class _MyCustomState extends State<MyHomePage> {
  bool value = false;
  @override
  Widget build(BuildContext context) => Scaffold(
        body: ListView(
          children: [
            // Navbar
            Container(
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    "Giỏ hàng",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              height: 50,
              padding: const EdgeInsets.fromLTRB(30, 5, 170, 5),
              color: Colors.lightGreen,
            ),
            const SizedBox(height: 20),

            //Sản phẩm
            _product('images/nhung-quy-tac-tu-duy.jpg', 150, 150,
                'Những quy tắc tư duy', '69.000đ', '1'),
            const SizedBox(height: 30),
            _product('images/tu-luyen-cach-tu-duy.jpg', 150, 150,
                'Tự luyện cách tư duy', '69.000đ', '1'),
            const SizedBox(height: 30),
            _product('images/lam-it-duoc-nhieu.jpg', 150, 150,
                'Làm ít được nhiều', '69.000đ', '1'),
            const SizedBox(height: 20),

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
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.account_circle,
                    color: Colors.green,
                    size: 25,
                  ),
                  labelText: 'Tỉnh / Thành phố',
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
                  labelText: 'Quận / Huyện',
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
                  labelText: 'Phường / Xã',
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
              alignment: Alignment.center,
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
            const SizedBox(height: 150),
            const Divider(
              color: Colors.black,
            ),

            // Thanh toán
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Tổng cộng\n',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: '69.000 đ',
                        style: TextStyle(
                          fontSize: 25,
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
                  onPressed: () {},
                  child: const Text(
                    'Thanh Toán',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      );

  final listChoose = ["Tiền mặt", "Ví Momo", "Thẻ ngân hàng"];
  String? choose;
  DropdownMenuItem<String> buildMenuItems(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      );
}
