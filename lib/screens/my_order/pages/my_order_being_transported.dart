import 'package:flutter/material.dart';
import 'package:hkl_books/screens/being_transported_order/being_transported_order.dart';

Row _product(
    String _img, double _w, double _h, String _name, String _totalPrice) {
  return Row(
    children: [
      Container(
        alignment: Alignment.topLeft,
        child: Image.asset(_img, width: _w, height: _h),
      ),
      RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '$_name\n',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: '\nTổng tiền: $_totalPrice',
              style: const TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

class BeingTransported extends StatelessWidget {
  const BeingTransported({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
              alignment: Alignment.topLeft,
              child: const Text(
                'Đơn hàng đang được vận chuyển',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Divider(),
            const SizedBox(height: 20),
            _product('assets/images/nhung-quy-tac-tu-duy.jpg', 150, 150,
                'Những quy tắc tư duy', '69.000đ'),
            const SizedBox(height: 30),
            _product('assets/images/tu-luyen-cach-tu-duy.jpg', 150, 150,
                'Tự luyện cách tư duy', '69.000đ'),
            const SizedBox(height: 30),
            _product('assets/images/lam-it-duoc-nhieu.jpg', 150, 150,
                'Làm ít được nhiều', '69.000đ'),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    primary: Colors.lightGreen,
                    side: const BorderSide(color: Colors.lightGreen),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BeingTransportedOrder()),
                    );
                  },
                  child: const Text('Xem Chi Tiết'),
                ),
              ],
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
