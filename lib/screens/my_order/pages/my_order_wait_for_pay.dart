import 'package:flutter/widgets.dart';
import 'package:hkl_books/provider/bookprovider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

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

/*
class WaitForPay extends StatelessWidget {
  const WaitForPay({Key? key}) : super(key: key);

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
              child: const Text('Đơn hàng chờ được thanh toán',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
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
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    primary: Colors.lightGreen,
                    side: const BorderSide(color: Colors.lightGreen),
                  ),
                  onPressed: () {},
                  child: const Text('Xem Giỏ Hàng'),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    primary: Colors.lightGreen,
                    side: const BorderSide(color: Colors.lightGreen),
                  ),
                  onPressed: () {},
                  child: const Text('Thanh Toán'),
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
*/

class WaitForPay extends StatefulWidget {
  const WaitForPay({Key? key}) : super(key: key);

  @override
  _WaitForPayState createState() => _WaitForPayState();
}

class _WaitForPayState extends State<WaitForPay> {
  @override
  void initState() {
    super.initState();
    final booksMdl = Provider.of<BookProvider>(context, listen: false);
    booksMdl.getProduct(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<BookProvider>(builder: (context, state, child) {
        return ListView.builder(
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Container(
                child: state.loading
                    ? const CircularProgressIndicator()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            //padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                            alignment: Alignment.topLeft,
                            child: const Text('Đơn hàng chờ được thanh toán',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          const Divider(),
                          const SizedBox(height: 20),
                          _product(
                              'assets/images/${state.books[index].imgPath}',
                              150,
                              150,
                              state.books[index].name,
                              state.books[index].price.toString()),
                          //const SizedBox(height: 30),
                          const SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  primary: Colors.lightGreen,
                                  side: const BorderSide(
                                      color: Colors.lightGreen),
                                ),
                                onPressed: () {},
                                child: const Text('Xem Giỏ Hàng'),
                              ),
                              OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  primary: Colors.lightGreen,
                                  side: const BorderSide(
                                      color: Colors.lightGreen),
                                ),
                                onPressed: () {},
                                child: const Text('Thanh Toán'),
                              ),
                            ],
                          ),
                          const Divider(),
                          const SizedBox(height: 50),
                        ],
                      ),
              );
            });
      }),
    );
  }
}
