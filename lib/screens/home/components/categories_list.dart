import 'package:flutter/material.dart';
import 'package:hkl_books/models/category.dart';
import 'package:hkl_books/repository/category_api.dart';

import 'all_books_list_by_category.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({Key? key, required this.listCategorite})
      : super(key: key);
  final List<Category> listCategorite;
  
  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: widget.listCategorite
          .map((e) => TextButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AllBooksListByCategory(
                              categoryId: e.id.toString(),
                              categoryName: e.name.toString(),
                            ))),
                child: Text(
                  e.name.toString(),
                  style: const TextStyle(color: Colors.black),
                ),
              ))
          .toList(),
    );
  }
}
