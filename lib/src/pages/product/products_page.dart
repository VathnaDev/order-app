import 'package:flutter/material.dart';
import 'package:order_app/src/pages/product/product_form_page.dart';

class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Products"),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => ProductFormPage()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
