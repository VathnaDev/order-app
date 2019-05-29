import 'package:order_app/src/model/product.dart';
import 'package:order_app/src/services/db_services.dart';
import 'package:rxdart/rxdart.dart';

class ProductBloc {
  final _dbService = DbService();

  ProductBloc() {
    fetchProductFromDb();
  }

  void fetchProductFromDb() async {
    final pro = await _dbService.getAllProducts();
    _products.sink.add(pro);
  }

  final _products = ReplaySubject<List<Product>>();

  Stream<List<Product>> get products => _products.stream;

  Future<int> createProduct(Product product) async {
    final id = await _dbService.insertProduct(product);
    fetchProductFromDb();
    return id;
  }

  Future<int> updateProduct(Product product) async {
    final id = await _dbService.updateProduct(product);
    fetchProductFromDb();
    return id;
  }

  Future<int> deleteProduct(Product product) async {
    final id = await _dbService.deleteProduct(product.id);
    fetchProductFromDb();
    return id;
  }

  void dispose() {
    _products.close();
  }
}
