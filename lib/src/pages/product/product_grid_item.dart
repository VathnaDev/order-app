import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:order_app/src/bloc/product_bloc.dart';
import 'package:order_app/src/model/product.dart';
import 'package:order_app/src/pages/product/product_form_page.dart';

class ProductGridItem extends StatelessWidget {
  final Product product;
  final ProductBloc productBloc;

  const ProductGridItem({
    Key key,
    @required this.product,
    @required this.productBloc,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      child: Card(
        child: InkWell(
          onLongPress: () async {
            onDeleteProduct(context);
          },
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => ProductFormPage(
                      product: product,
                    ),
              ),
            );
          },
          child: Column(
            children: <Widget>[
              Container(
                child: Image.file(
                  File.fromUri(Uri.parse(product.image)),
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 6),
              Text(
                product.name,
                style: Theme.of(context).textTheme.subhead,
              )
            ],
          ),
        ),
      ),
    );
  }

  void onDeleteProduct(BuildContext context) async {
    final isOk = await showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            actions: <Widget>[
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text("No"),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Text("Yes"),
              ),
            ],
            title: Text("Delete"),
            content: Text("Do you want to delete this product?"),
          );
        });
    if (isOk != null && isOk) {
      await productBloc.deleteProduct(product);
    }
  }
}
