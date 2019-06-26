import 'package:flutter/material.dart';
import 'package:order_app/src/bloc/customer_bloc.dart';
import 'package:order_app/src/model/customer.dart';
import 'package:order_app/src/pages/customer/customer_form_page.dart';

class AddressPage extends StatefulWidget {
  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
    final CustomerBloc _customerBloc = CustomerBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Address"),
      ),
       body: StreamBuilder<List<Customer>>(
        stream: _customerBloc.customers,
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );

          if (snapshot.hasError)
            return Center(
              child: Text("Error while fetching customers"),
            );

          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              final customer = snapshot.data[index];
              return Card(
                child: ListTile(
                  onTap: () {
                    final newPage = MaterialPageRoute(
                      builder: (context) => CustomerFormPage(
                            customer: customer,
                            customerBloc: _customerBloc,
                          ),
                    );
                    Navigator.push(context, newPage);
                  },
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () async {
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
                              content:
                                  Text("Do you want to delete this customer?"),
                            );
                          });
                      if (isOk != null && isOk) {
                        this._customerBloc.deleteCustomer(customer);
                      }
                    },
                  ),
                  leading: CircleAvatar(child: Text(customer.id.toString())),
                  title: Text(customer.name),
                  subtitle: Text(customer.phone),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_location),
        onPressed: () {
         
        },
      ),
    );
  }
}