import 'package:dio/dio.dart';
import '../data/food.dart';

class ApiService {
  static const String apiUrl =
      'https://playground-rest-api-vk3y7f3hta-et.a.run.app/foods';

  Future<List<Food>> fetchFoods() async {
    final dio = Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 5),
    ));

    try {
      final response = await dio.get(apiUrl);
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = response.data;
        return jsonResponse.map((food) => Food.fromJson(food)).toList();
      } else {
        throw Exception('Failed to load foods');
      }
    } catch (e) {
      throw Exception('Failed to load foods: $e');
    }
  }
}
