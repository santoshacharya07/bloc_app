import 'package:http/http.dart' as http;
import 'package:learning_bloc/models/user_model.dart';

class UserRepo {
  Future<List<UserModel>> getUsers() async {
    var response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    if (response.statusCode == 200) {
      return userModelFromJson(response.body);
    } else {
      throw Exception("Failed to load Users");
    }
  }
}
