import 'package:flutter/material.dart';
import 'package:share/share.dart';

class ProductList extends StatefulWidget {

  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text("Products"),
          ),
          SliverList.builder(
            itemBuilder: (BuildContext context, int index) {
              return _product(index);
            },
            itemCount: 20,
          ),
        ],
      ),
    );
  }

  Widget _product(int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductPage(
                      id: index.toString(),
                    )));
      },
      child: Container(
        margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
        child: ListTile(
          iconColor: Colors.white,
          textColor: Colors.white,
          tileColor: Colors.blueAccent,
          leading: const Icon(
            Icons.sunny,
          ),
          title: Text("Product $index"),
        ),
      ),
    );
  }
}

class ProductPage extends StatefulWidget {
  final String id;

  const ProductPage({Key? key, required this.id}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Product ${widget.id} "),
            const SizedBox(height: 40,),
            IconButton(onPressed: () async {
              await Share.share("https://daladan.com/category/productList/${widget.id}");
            }, icon: const Icon(Icons.copy))
          ],
        ),
      ),
    );
  }
}
