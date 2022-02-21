import 'dart:convert';
import 'dart:io';

import 'package:hkl_books/config.dart';
import 'package:hkl_books/models/book2.dart';
import 'package:hkl_books/models/favourite.dart';
import 'package:http/http.dart' as http;

Future<List<Book2>> getAllFavBooksByAccountId(accountid) async {
  List<Book2> resultFavBooksByAccountId = [];
  try {
    final response = await http.get(
      Uri.parse(apiURL + 'favourite/getAllBooksByFavourite/$accountid'),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    // print('lenght:${response.statusCode}');

    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      resultFavBooksByAccountId =
          (item as List).map((p) => Book2.fromJson(p)).toList();
    }
  } catch (e) {
    rethrow;
  }
  return resultFavBooksByAccountId;
}

Future<List<Favourite>> getAllFavouritesBooksByAccountId(context) async {
  List<Favourite> resultFavorite = [];
  try {
    final response = await http.get(
      Uri.parse(apiURL + 'favourite'),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
      final item = json.decode(response.body);

      resultFavorite =
          (item as List).map((p) => Favourite.fromJson(p)).toList();
    }
  } catch (e) {
    rethrow;
  }
  return resultFavorite;
}

addFavourite(accountid, bookid) async {
  try {
    final response = await http.post(Uri.parse(apiURL + 'favourite/addFav'),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
        body: jsonEncode(<String, String>{
          'AccountId': accountid,
          'BookId': bookid,
        }));
    if (response.statusCode == 200) {
      return 'Thêm vào danh sách yêu thích thành công!';
    } else {
      return 'Đã có trong danh sách yêu thích!';
    }
  } catch (e) {
    rethrow;
  }
}

checkFav(bookid,accountid) async {
  try {
    final response = await http.get(
      Uri.parse(apiURL + 'favourite/check/$bookid&$accountid'),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
      return true;
    }
    if (response.statusCode == 400) {
      return false;
    } else {
      return false;
    }
  } catch (e) {
    rethrow;
  }
}





deleteFavourite(accountid, bookid) async {
  try {
    final response = await http.delete(Uri.parse(apiURL + 'favourite/deleteFav'),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
        body: jsonEncode(<String, String>{
          'AccountId': accountid,
          'BookId': bookid,
        }));
        // print('sttCode: ${response.statusCode}');
    if (response.statusCode == 200) {
      return true;
    }
    if (response.statusCode == 400) {
      return false;
    } else {
      return false;
    }
  } catch (e) {
    rethrow;
  }
}


// Future<Favourite> addFav(accountid, bookid) async {
//   // List<Favourite> resultFavourite = [];
//   Favourite resultAccount = Favourite();

//   try {
//     final response = await http.post(Uri.parse(baseURL + 'favourite/addFav'),
//         headers: {
//           HttpHeaders.contentTypeHeader: "application/json",
//         },
//         body:
//             jsonEncode(<String, String>{'AccountId': accountid, 'BookId': bookid}));

//     if (response.statusCode == 200) {
//       final item = json.decode(response.body);
//       resultFavourite.add(item);
//     } else {
//       // resultFavourite.status = response.statusCode;
//     }
//   } catch (e) {
//     rethrow;
//   }
//   // return item;
//   return resultFavourite;
// }


