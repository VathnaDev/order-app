Class CustomerAddress
{
 int id;
  String name;
  bool gender;
  String address;
  String phone;
  int createdDate;
  int updatedDate;

  CustomerAddress() {
    id = null;
    customerAddressID = 0;
    addressName = ""; #this is the name of the address for example: Office, Home, Vacation 
    addressType = "";
    city = "";
    state = "";
    zip ="";
    priority = 0;
    status ="Active";
    createdDate = 0;
    updatedDate = 0;
  }

  CustomerAddress.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    customerAddressID = map['CustomerAddressID'];
    addressName = map['Name'];
    addressType = map['Address'];
    city = map['city'];
    state = map[state];
    zip = map[zip];
    priority = map[priority];
    status = map[status];
    createdDate = map['createdDate'];
    updatedDate = map['updatedDate'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customerAddressID'] = this.customerAddressID;
    data['addressName'] = this.addressName;
    data['addressType'] = this.addressname;
    data['city'] = this.city;
    data['state'] = this.sate;
    data['zip'] = this.zip
    data['priority'] = this.priority;
    data['status'] = this.status;
    data['createdDate'] = this.createdDate;
    data['updatedDate'] = this.updatedDate;
    return data;
  }
}