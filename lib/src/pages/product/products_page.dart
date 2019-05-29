import 'package:flutter/material.dart';
import 'package:order_app/src/bloc/product_bloc.dart';
import 'package:order_app/src/model/product.dart';
import 'package:order_app/src/pages/product/product_form_page.dart';
import 'package:order_app/src/pages/product/product_grid_item.dart';

class ProductsPage extends StatelessWidget {
  final ProductBloc productBloc = ProductBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Products"),
      ),
      body: StreamBuilder<List<Product>>(
        stream: productBloc.products,
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

          final products = snapshot.data;
          return GridView.count(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            crossAxisCount: 2,
            children: <Widget>[
              ...products.map((p) => ProductGridItem(
                    product: p,
                    productBloc: productBloc,
                    key: UniqueKey(),
                  ))
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => ProductFormPage(
                    product: Product(),
                  ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
