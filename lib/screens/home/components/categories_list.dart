import 'package:flutter/material.dart';
import 'package:hkl_books/DB/dbconfig.dart';
import 'package:hkl_books/models/account.dart';
import 'package:hkl_books/provider/categoryprovider.dart';
import 'package:hkl_books/screens/account/account.dart';
import 'package:hkl_books/screens/favorite/favorite.dart';
import 'package:hkl_books/screens/login/login.dart';
import 'package:hkl_books/screens/notification/notification.dart';
import 'package:provider/provider.dart';

import '../../../config.dart';
import 'all_books_list_by_category.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({Key? key}) : super(key: key);

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  @override
  void initState() {
    super.initState();
    final categoriesMdl = Provider.of<CategoryProvider>(context, listen: false);
    categoriesMdl.getCategory(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(builder: (context, data, child) {
      return Expanded(
        child: ListView.builder(
          itemCount: data.categories.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AllBooksListByCategory(
                                categoryId:
                                    data.categories[index].id.toString(),
                                categoryName:
                                    data.categories[index].name.toString(),
                              ))),
                  child: Text(
                    data.categories[index].name.toString(),
                    style: const TextStyle(color: Colors.black),
                  ),
                )
              ],
            );
          },
        ),
      );
    });
  }
}
