import 'package:flutter/material.dart';

import 'Screen/ProductCreateScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CRUD App using Rest Api",
      home: ProductCreateScreen(),
    );
  }
}