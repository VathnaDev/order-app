import 'package:order_app/src/model/customer.dart';
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
    try{
      return await db.insert("customers", customer.toMap());
    }catch(ex){
      print(ex.toString());
      return null;
    }
  }

  Future<int> updateCustomer(Customer customer) async {
    var db = await _dbHelper.database;
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
}
