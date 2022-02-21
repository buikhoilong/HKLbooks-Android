// ignore_for_file: non_constant_identifier_names

import 'package:hkl_books/provider/cartprovider.dart';
import 'package:hkl_books/screens/account/components/my_show_dialog.dart';
import 'package:provider/provider.dart';

addToCart(context, AccountId, BookId) {
  final cartProvider = Provider.of<CartProvider>(context, listen: false);
  cartProvider.addToCart(AccountId, BookId);
  print(cartProvider.respondCode);
  if (cartProvider.respondCode == 200) {
    myShowDialog(context, 'Thêm vào giỏ hàng thành công');
    return true;
  } else {
    myShowDialog(context, 'Thêm thất bại\nSách đã có trong giỏ hàng');
    return false;
  }
}
