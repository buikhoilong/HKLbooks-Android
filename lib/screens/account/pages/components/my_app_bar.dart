import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
AppBar MyAppBar (context, String name){
  return AppBar(
      centerTitle: true,
      title: Text(name),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
}
