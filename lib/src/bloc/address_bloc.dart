import 'package:order_app/src/services/db_services.dart';
import 'package:rxdart/subjects.dart';

class CustomerAddressBloc {
  //This is service for all operations in database
  // final _dbService = DbService();

  // customerAddressBloc() {
  //   fetchCustomerAddressFromDb();
  // }

  // void fetchCustomerAddressFromDb() async {
  //   final cus = await _dbService.getAllCustomerAddress();
  //   _customerAddress.sink.add(cus);
  // }

  // final _customerAddress = ReplaySubject<List<customerAddress>>();

  // //This is the all the customerAddress that we will display in the list
  // Stream<List<CustomerAddress>> get customerAddress => _customerAddress.stream;

  // //This function will insert new customerAddress to database
  // Future<int> createcustomerAddress(customerAddress customerAddress) async {
  //   final id = await _dbService.insertcustomerAddress(customerAddress);
  //   fetchcustomerAddressFromDb();
  //   return id; 
  // }

  // Future<int> updatecustomerAddress(customerAddress customerAddress) async {
  //   final id = await _dbService.updatecustomerAddress(customerAddress);
  //   fetchcustomerAddressFromDb();
  //   return id;
  // }

  // Future<int> deletecustomerAddress(customerAddress customerAddress) async {
  //   final id = await _dbService.deletecustomerAddress(customerAddress.id);
  //    fetchcustomerAddressFromDb();
  //   return id;
  // }

  // //This function will close all the stream that we no longer need
  // //It helps us from get memory leak
  // void dispose() {
  //   _customerAddresss.close();
  // }
}
