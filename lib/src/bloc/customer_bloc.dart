import 'package:order_app/src/model/address.dart';
import 'package:order_app/src/model/customer.dart';
import 'package:order_app/src/services/db_services.dart';
import 'package:rxdart/subjects.dart';

class CustomerBloc {
  //This is service for all operations in database
  final _dbService = DbService();

  CustomerBloc() {
    fetchCustomerFromDb();
  }

  void fetchCustomerFromDb() async {
    final cus = await _dbService.getAllCustomers();
    _customers.sink.add(cus);
  }

  final _customers = ReplaySubject<List<Customer>>();

  //This is the all the customers that we will display in the list
  Stream<List<Customer>> get customers => _customers.stream;

  //This function will insert new customer to database
  Future<int> createCustomer(Customer customer) async {
    final id = await _dbService.insertCustomer(customer);
    fetchCustomerFromDb();
    return id;
  }

  Future<int> updateCustomer(Customer customer) async {
    final id = await _dbService.updateCustomer(customer);
    fetchCustomerFromDb();
    return id;
  }

  Future<int> deleteCustomer(Customer customer) async {
    final id = await _dbService.deleteCustomer(customer.id);
    fetchCustomerFromDb();
    return id;
  }

  //This function will close all the stream that we no longer need
  //It helps us from get memory leak
  void dispose() {
    _customers.close();
  }

  Future<int> addCustomerAddress(Address address) async {
    final id = await _dbService.insertAddress(address);
    fetchCustomerFromDb();
    return id;
  }
}
