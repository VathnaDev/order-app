import 'package:flutter/material.dart';
import 'package:order_app/src/bloc/customer_bloc.dart';
import 'package:order_app/src/model/address.dart';
import 'package:order_app/src/model/customer.dart';
import 'package:order_app/src/pages/address/address_form.dart';

class CustomerDetailPage extends StatelessWidget {
  final CustomerBloc customerBloc;
  final Customer customer;

  const CustomerDetailPage({
    Key key,
    @required this.customerBloc,
    @required this.customer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final labelStyle = TextStyle(
      fontWeight: FontWeight.w500,
    );

    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Customer"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Card(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "Name :",
                              style: labelStyle,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text("Customer Name"),
                          ),
                          Expanded(
                            child: Text(
                              "Gender :",
                              style: labelStyle,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              "Male",
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "Phone :",
                              style: labelStyle,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              "+5822512250",
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "Address:",
                              style: labelStyle,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              "Phnom Penh",
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Card(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      ...this.customer.addresses.map((Address add) {
                        return ExpansionTile(
                          title: Text(add.addressName),
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 4),
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text("Address Name: "),
                                  ),
                                  Expanded(
                                    child: Text(add.addressName),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 4),
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text("Address Type:"),
                                  ),
                                  Expanded(
                                    child: Text(add.addressType),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 4),
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text("Status:"),
                                  ),
                                  Expanded(
                                    child: Text(add.status),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 4),
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text("Priority:"),
                                  ),
                                  Expanded(
                                    child: Text(getPriority(add.priority)),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 4),
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text("City:"),
                                  ),
                                  Expanded(
                                    child: Text(add.addressType),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 4),
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text("State:"),
                                  ),
                                  Expanded(
                                    child: Text(add.state),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 4),
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text("Zip Code:"),
                                  ),
                                  Expanded(
                                    child: Text(add.zip),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 8)
                          ],
                        );
                      })
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text("More Address"),
        onPressed: () {
          final newPage = MaterialPageRoute(
            builder: (_) => AddressForm(
                  customer: this.customer,
                  customerBloc: this.customerBloc,
                ),
          );

          Navigator.of(context).push(newPage);
        },
      ),
    );
  }

  String getPriority(int num) {
    switch (num) {
      case 0:
        return "High";
      case 1:
        return "Medium";
      case 2:
        return "Low";
    }
    return "";
  }
}
