import 'package:flutter/material.dart';
import 'package:order_app/src/bloc/customer_bloc.dart';
import 'package:order_app/src/model/customer.dart';

class CustomerFormPage extends StatefulWidget {
  final Customer customer;
  final CustomerBloc customerBloc;
  const CustomerFormPage({
    Key key,
    @required this.customer,
    @required this.customerBloc,
  }) : super(key: key);

  @override
  _CustomerFormPageState createState() => _CustomerFormPageState();
}

class _CustomerFormPageState extends State<CustomerFormPage> {
  final _formState = GlobalKey<FormState>();
  bool gender = false;
  
  @override
  Widget build(BuildContext context) {
    gender = widget.customer.gender;
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.customer.id == null ? "New Customer" : "Update Customer",
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Form(
            key: _formState,
            child: Column(
              children: <Widget>[
                Text(
                  widget.customer.id == null
                      ? "Create New Customer"
                      : "Update Customer",
                  style: theme.textTheme.title,
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Customer Name",
                    border: OutlineInputBorder(),
                  ),
                  initialValue: widget.customer.name,
                  validator: (val) {
                    if (val.isEmpty) return "Customer name is required";
                    widget.customer.name = val;
                  },
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Radio(
                      value: false,
                      groupValue: gender,
                      onChanged: (val) {
                        widget.customer.gender = val;
                        setState(() {
                          this.gender = val;
                        });
                      },
                    ),
                    Text("Male"),
                    Radio(
                      value: true,
                      groupValue: gender,
                      onChanged: (val) {
                        widget.customer.gender = val;
                        setState(() {
                          this.gender = val;
                        });
                      },
                    ),
                    Text("Female"),
                  ],
                ),
                SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: "Phone",
                    border: OutlineInputBorder(),
                  ),
                  initialValue: widget.customer.phone,
                  validator: (val) {
                    if (val.isEmpty) return "Phone number is required";
                    widget.customer.phone = val;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: "Address",
                    border: OutlineInputBorder(),
                  ),
                  initialValue: widget.customer.address,
                  validator: (val) {
                    if (val.isEmpty) return "Customer address is required";
                    widget.customer.address = val;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Save"),
        icon: Icon(Icons.save),
        onPressed: () async {
          //perform validation on the form
          final isValid = _formState.currentState.validate();
          if (isValid) {
            //If customer id is null means create customer otherwise it is edit form
            if (widget.customer.id == null) {
              await widget.customerBloc.createCustomer(
                widget.customer,
              );
            } else {
              await widget.customerBloc.updateCustomer(
                widget.customer,
              );
            }

            Navigator.of(context).pop();
          }
        },
      ),
    );
  }
}
