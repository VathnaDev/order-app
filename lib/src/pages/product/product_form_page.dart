import 'package:flutter/material.dart';

class ProductFormPage extends StatefulWidget {
  @override
  _ProductFormPageState createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Product"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildImagePicker(theme),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                child: TextFormField(
                  decoration: InputDecoration(labelText: "Product name"),
                  validator: (val) {
                    if (val.isEmpty) return "Product name is required";
                  },
                ),
              ),
              InkWell(
                onTap: (){},
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                  child: TextFormField(
                    decoration: InputDecoration(labelText: "Product name"),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                      child: TextFormField(
                        decoration: InputDecoration(labelText: "Product name"),
                        validator: (val) {
                          if (val.isEmpty) return "Product name is required";
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                      child: TextFormField(
                        decoration: InputDecoration(labelText: "Product name"),
                        validator: (val) {
                          if (val.isEmpty) return "Product name is required";
                        },
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Save"),
        onPressed: () {},
        icon: Icon(Icons.save),
      ),
    );
  }

  Material buildImagePicker(ThemeData theme) {
    return Material(
      color: theme.primaryColor,
      child: InkWell(
        onTap: () {},
        child: Container(
          width: double.infinity,
          height: 140,
          child: Icon(
            Icons.add_a_photo,
            color: Colors.white,
            size: 80,
          ),
        ),
      ),
    );
  }
}
