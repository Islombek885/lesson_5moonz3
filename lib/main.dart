import 'package:lesson_5moonz3/controller/product_controller.dart';
import 'package:lesson_5moonz3/home_page.dart';
import 'package:lesson_5moonz3/models/product_model.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  ProductController productController = ProductController();
  List<ProductModel> models = [];

  void getData() async {
    models = await productController.toCategory();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage(models: models));
  }
}
