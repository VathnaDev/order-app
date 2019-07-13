class Address {
  int id;
  String addressName =
      ""; //this is the name of the address for example: Office, Home, Vacation
  String addressType = "";
  String city = "";
  String state = "";
  String zip = "";
  int priority = 0;
  String status = "Active";
  int createdDate = 0;
  int updatedDate = 0;

  int customerId = 0;

  Address() {
    id = null;
    addressName =
        ""; //this is the name of the address for example: Office, Home, Vacation
    addressType = "";
    city = "";
    state = "";
    zip = "";
    priority = 0;
    status = "Active";
    createdDate = 0;
    updatedDate = 0;
    customerId = 0;
  }

  Address.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    addressName = map['addressName'];
    addressType = map['addressType'];
    city = map['city'];
    state = map['state'];
    zip = map['zip'];
    priority = map['priority'];
    status = map['status'];
    createdDate = map['createdDate'];
    updatedDate = map['updatedDate'];

    customerId = map['customerId'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['addressName'] = this.addressName;
    data['addressType'] = this.addressType;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zip'] = this.zip;
    data['priority'] = this.priority;
    data['status'] = this.status;
    data['createdDate'] = this.createdDate;
    data['updatedDate'] = this.updatedDate;
    data['customerId'] = this.customerId;
    return data;
  }
}
