import 'package:deet_link/pages/category.dart';
import 'package:deet_link/pages/home.dart';
import 'package:deet_link/pages/product_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}

final router = GoRouter(routes: [
  GoRoute(path: "/", builder: (_, __) => const HomePage(), routes: [
    GoRoute(
        path: "category",
        builder: (_, __) => const CategoryPage(),
        routes: [
          GoRoute(
            path: "productList",
            builder: (_, __) => const ProductList(),
          ),
          GoRoute(
            path: "productList/:id",
            builder: (context, state) =>
                ProductPage(id: state.pathParameters["id"]!),
          ),
        ]),
  ]),
]);
