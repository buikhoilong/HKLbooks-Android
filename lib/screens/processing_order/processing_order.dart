import 'package:flutter/material.dart';

class ProcessingOrder extends StatelessWidget {
  const ProcessingOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
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
                TextSpan(
                  text: '\nSố lượng: $_quantity\n',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ],
  );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyCustomState createState() => _MyCustomState();
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
                    "Đơn Hàng #0000",
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
                  labelText: 'Đỗ Quang Huy',
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
                  labelText: '190020010',
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
                  labelText: '11/11',
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
                  labelText: 'TP. Hồ Chí Minh',
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
                  labelText: 'Quận 1',
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
                  labelText: 'Phường 1',
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
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: const Text(
                'Tiền mặt',
                style: TextStyle(
                  fontSize: 23,
                ),
              ),
            ),
            const SizedBox(height: 20),
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
                        text: '207.000 đ',
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
                    'Hủy Đơn',
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
}
