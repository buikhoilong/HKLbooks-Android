import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//Colors
const primaryColor = Color.fromRGBO(124, 187, 113, 1.0);
const myGreen = Color(0xFF7CBB71);
const myGrey = Color(0xFF666666);
const myGreyBG = Color(0xFFE5E5E5);
const myRed = Color(0xFFBF4545);

//Formats
var formatMoney = NumberFormat.currency(locale: "vi_VN", symbol: "đ");

//URLs
const baseURL = 'http://10.0.2.2:8000/';
const apiURL = baseURL + 'api/';
const avatarsImgURL = baseURL + 'storage/admin/images/avatar/';
const booksImgURL = baseURL + 'storage/admin/images/books/';

//const themeColor = MaterialColor(0x007cbb71, const {50: const Color()});
