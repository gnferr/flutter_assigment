import 'package:assigment_5/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';

class ThisProduct extends StatelessWidget {
  const ThisProduct({
    super.key,
    required this.category,
    required this.asc,
    required this.quantity,
  });

  final String category;
  final bool asc;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    List<Product> products = Product.products
        .where(((product) => product.category == category))
        .where(((product) => product.quantity > quantity))
        .toList();

    products.sort((a, b) => a.name.compareTo(b.name));

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Product List'),
        actions: [
          IconButton(
            onPressed: () {
              String sort = asc ? 'desc' : 'asc';
              return context.goNamed('product_list',
                  params: <String, String>{'category': category},
                  queryParams: <String, String>{'sort': sort});
            },
            icon: Icon(Icons.sort),
          ),
          IconButton(
            onPressed: () {
              String sort = asc ? 'desc' : 'asc';
              return context.goNamed('product_list',
                  params: <String, String>{'category': category},
                  queryParams: <String, String>{'filter': '10'});
            },
            icon: Icon(Icons.filter_alt),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          for (final Product product in asc ? products : products.reversed)
            ListTile(
              title: Text(product.name),
            )
        ],
      ),
    );
  }
}
