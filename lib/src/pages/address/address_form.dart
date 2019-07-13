import 'package:flutter/material.dart';
import 'package:order_app/src/bloc/customer_bloc.dart';
import 'package:order_app/src/model/address.dart';
import 'package:order_app/src/model/customer.dart';

class AddressForm extends StatefulWidget {
  final CustomerBloc customerBloc;
  final Customer customer;

  const AddressForm({
    Key key,
    @required this.customerBloc,
    @required this.customer,
  }) : super(key: key);
  @override
  _AddressFormState createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  final address = Address();
  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("New Address"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Form(
          key: key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                "New Address For ${widget.customer.name}",
                textAlign: TextAlign.center,
                style: theme.textTheme.subhead,
              ),
              SizedBox(height: 16),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 7,
                        ),
                        labelText: "Name",
                      ),
                      onSaved: (val) {
                        this.address.addressName = val;
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Type",
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 7,
                        ),
                      ),
                      onSaved: (val) {
                        this.address.addressType = val;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Status",
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 7,
                        ),
                      ),
                      initialValue: address.status,
                      onSaved: (val) {
                        this.address.status = val;
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: DropdownButtonFormField(
                      hint: Text("Priority"),
                      onChanged: (value) {
                        setState(() {
                          this.address.priority = value;
                        });
                      },
                      value: this.address.priority,
                      items: <DropdownMenuItem>[
                        DropdownMenuItem(
                          child: Text("High"),
                          value: 0,
                        ),
                        DropdownMenuItem(
                          child: Text("Medium"),
                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: Text("Low"),
                          value: 2,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "City",
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 7,
                        ),
                      ),
                      onSaved: (val) {
                        this.address.city = val;
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "State",
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 7,
                        ),
                      ),
                      onSaved: (val) {
                        this.address.state = val;
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Zip",
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 7,
                        ),
                      ),
                      onSaved: (val) {
                        this.address.zip = val;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              MaterialButton(
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                onPressed: onSave,
                child: Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onSave() async {
    final isValid = key.currentState.validate();
    if (isValid) {
      key.currentState.save();
      this.address.customerId = widget.customer.id;
      final id = await widget.customerBloc.addCustomerAddress(address);
      if (id != null) {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
      }
    }
  }
}
