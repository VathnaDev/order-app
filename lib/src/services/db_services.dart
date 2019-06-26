import 'package:order_app/src/model/address.dart';
import 'package:order_app/src/model/customer.dart';
import 'package:order_app/src/model/product.dart';
import 'app_db.dart';

class DbService {
  final _dbHelper = DatabaseHelper();

  Future<List<Customer>> getAllCustomers() async {
    final db = await _dbHelper.database;
    final customerMap = await db.query("customers");
    final customers = List<Customer>();

    customerMap.forEach((c) {
      customers.add(Customer.fromMap(c));
    });
    return customers;
  }

  Future<int> insertCustomer(Customer customer) async {
    final db = await _dbHelper.database;
    customer.createdDate = DateTime.now().millisecondsSinceEpoch;
    customer.updatedDate = DateTime.now().millisecondsSinceEpoch;
    try {
      return await db.insert("customers", customer.toMap());
    } catch (ex) {
      print(ex.toString());
      return null;
    }
  }

  Future<int> updateCustomer(Customer customer) async {
    var db = await _dbHelper.database;
    customer.updatedDate = DateTime.now().millisecondsSinceEpoch;
    return await db.update(
      "customers",
      customer.toMap(),
      where: 'id = ?',
      whereArgs: [customer.id],
    );
  }

  Future<int> deleteCustomer(int id) async {
    var db = await _dbHelper.database;
    return await db.delete(
      "customers",
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<Map<String, dynamic>> getCustomer(int id) async {
    var db = await _dbHelper.database;
    final result = await db.query(
      "customers",
      where: 'id = ?',
      whereArgs: [id],
    );
    return result.first;
  }

  Future<List<Product>> getAllProducts() async {
    var db = await _dbHelper.database;
    final productMaps = await db.query("products");
    final products = List<Product>();

    productMaps.forEach((c) {
      products.add(Product.fromMap(c));
    });
    return products;
  }

  Future<int> insertProduct(Product product) async {
    final db = await _dbHelper.database;
    product.createdDate = DateTime.now().millisecondsSinceEpoch;
    product.updatedDate = DateTime.now().millisecondsSinceEpoch;
    try {
      return await db.insert("products", product.toMap());
    } catch (ex) {
      print(ex.toString());
      return null;
    }
  }

  Future<int> updateProduct(Product product) async {
    var db = await _dbHelper.database;
    product.updatedDate = DateTime.now().millisecondsSinceEpoch;
    return await db.update(
      "products",
      product.toMap(),
      where: 'id = ?',
      whereArgs: [product.id],
    );
  }

  Future<int> deleteProduct(int id) async {
    var db = await _dbHelper.database;
    return await db.delete(
      "products",
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<Map<String, dynamic>> getProduct(int id) async {
    var db = await _dbHelper.database;
    final result = await db.query(
      "products",
      where: 'id = ?',
      whereArgs: [id],
    );
    return result.first;
  }


Future<int> insertAddress(Address address) async {
    final db = await _dbHelper.database;
    address.createdDate = DateTime.now().millisecondsSinceEpoch;
    address.updatedDate = DateTime.now().millisecondsSinceEpoch;
    try {
      return await db.insert("addresses",address.toMap());
    } catch (ex) {
      print(ex.toString());
      return null;
    }
  }




  

}
