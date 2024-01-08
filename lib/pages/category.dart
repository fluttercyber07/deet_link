import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Category"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.go("/category/productList");
          },
          child: const Text("Go products"),
        ),
      ),
    );
  }
}
