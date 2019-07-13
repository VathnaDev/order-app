import 'package:order_app/src/model/address.dart';

class Customer {
  int id;
  String name;
  bool gender;
  String address;
  String phone;
  int createdDate;
  int updatedDate;

  List<Address> addresses = List();

  Customer() {
    id = null;
    name = "";
    gender = false;
    address = "";
    phone = "";
    createdDate = 0;
    updatedDate = 0;
    addresses = List();
  }

  Customer.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    gender = map['gender'] == 0 ? false : true;
    address = map['address'];
    phone = map['phone'];
    createdDate = map['createdDate'];
    updatedDate = map['updatedDate'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['gender'] = this.gender;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['createdDate'] = this.createdDate;
    data['updatedDate'] = this.updatedDate;
    return data;
  }
}
