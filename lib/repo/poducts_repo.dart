import 'package:http/http.dart' as http;
import 'package:learning_bloc/models/product_model.dart';

class ProductsRepo {
  Future<List<ProductModel>> getProducts() async {
    var response =
        await http.get(Uri.parse("https://fakestoreapi.com/products"));
    if (response.statusCode == 200) {
      return productModelFromJson(response.body);
    } else {
      throw Exception("Failed to load products");
    }
  }
}
