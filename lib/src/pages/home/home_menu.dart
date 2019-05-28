import 'package:flutter/material.dart';
import 'package:order_app/src/pages/customer/customers_page.dart';
import 'package:order_app/src/pages/home/menu_grid_item.dart';
import 'package:order_app/src/pages/product/products_page.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      crossAxisCount: 3,
      crossAxisSpacing: 4,
      mainAxisSpacing: 4,
      children: <Widget>[
        MenuGridItem(
          icon: Icons.list,
          title: "Order",
          onTap: () {},
        ),
        MenuGridItem(
          icon: Icons.people,
          title: "Customer",
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => CustomersPage()),
            );
          },
        ),
        MenuGridItem(
          icon: Icons.store_mall_directory,
          title: "Stock",
          onTap: () {},
        ),
        MenuGridItem(
          icon: Icons.fastfood,
          title: "Product",
          onTap: () {
             Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => ProductsPage()),
            );
          },
        ),
      ],
    );
  }
}
