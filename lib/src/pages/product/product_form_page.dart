import 'dart:io';

import 'package:flutter/material.dart';
import 'package:order_app/src/bloc/product_bloc.dart';
import 'package:order_app/src/model/product.dart';
import 'package:order_app/src/utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class ProductFormPage extends StatefulWidget {
  final Product product;

  const ProductFormPage({
    Key key,
    @required this.product,
  }) : super(key: key);

  @override
  _ProductFormPageState createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final productBloc = ProductBloc();
  final formKey = GlobalKey<FormState>();
  final importDateController = TextEditingController();

  DateTime importDate;
  File productImage;

  @override
  void initState() {
    super.initState();
    if (widget.product.importedDate > 0) {
      importDate =
          DateTime.fromMillisecondsSinceEpoch(widget.product.importedDate);
    } else
      importDate = DateTime.now();
    if (widget.product.image.isNotEmpty)
      productImage = File.fromUri(Uri.parse(widget.product.image));
    importDateController.text = formatDate(importDate);
  }

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
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildImagePicker(theme),
              buildProductName(),
              buildImportDate(),
              buildPriceAndQty()
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Save"),
        onPressed: () async {
          final isValid = formKey.currentState.validate();
          widget.product.image = productImage.path;
          if (isValid) {
            int newId = 0;
            if (widget.product.id == null)
              newId = await productBloc.createProduct(widget.product);
            else
              newId = await productBloc.updateProduct(widget.product);
            if (newId > 0) Navigator.of(context).pop();
          }
        },
        icon: Icon(Icons.save),
      ),
    );
  }

  Row buildPriceAndQty() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            child: TextFormField(
              initialValue: widget.product.quantity.toString(),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Quantity"),
              validator: (val) {
                if (val.isEmpty) return "Product quantity is required";
                widget.product.quantity = int.parse(val);
              },
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            child: TextFormField(
              initialValue: widget.product.price.toString(),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Price", suffixIcon: Icon(Icons.attach_money)),
              validator: (val) {
                if (val.isEmpty) return "Product price is required";
                widget.product.price = double.parse(val);
              },
            ),
          ),
        ),
      ],
    );
  }

  InkWell buildImportDate() {
    return InkWell(
      onTap: _onDateClick,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        child: TextFormField(
          enabled: false,
          decoration: InputDecoration(labelText: "Import Date"),
          controller: importDateController,
        ),
      ),
    );
  }

  Container buildProductName() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: TextFormField(
        initialValue: widget.product.name,
        decoration: InputDecoration(labelText: "Product name"),
        validator: (val) {
          if (val.isEmpty) return "Product name is required";
          widget.product.name = val;
        },
      ),
    );
  }

  Material buildImagePicker(ThemeData theme) {
    return Material(
      color: theme.primaryColor,
      child: InkWell(
        onTap: getImage,
        child: Container(
          width: double.infinity,
          height: 140,
          child: productImage == null
              ? Icon(
                  Icons.add_a_photo,
                  color: Colors.white,
                  size: 80,
                )
              : Image.file(productImage),
        ),
      ),
    );
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final dir = await getApplicationDocumentsDirectory();
      final File newImage =
          await image.copy('${dir.path}/${DateTime.now()}.png');
      setState(() {
        productImage = newImage;
      });
    }
  }

  Future _onDateClick() async {
    final selectedDate = await showDatePicker(
        context: context,
        initialDate: importDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (selectedDate != null)
      setState(() {
        importDate = selectedDate;
        this.importDateController.text = formatDate(importDate);
      });
  }
}
