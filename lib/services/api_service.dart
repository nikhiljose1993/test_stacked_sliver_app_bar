import 'package:dio/dio.dart';
import 'package:test_stacked_sliver_app_bar/models/recipes.dart';

class ApiService {
  final _dio = Dio();

  final String url = 'https://dummyjson.com';

  Future<List<Recipes>> fetchRecipes() async {
    try {
      final res = await _dio.get('$url/recipes');

      final List<dynamic> rJson = res.data['recipes'] as List<dynamic>;

      final rList = rJson.map((recipe) => Recipes.fromJson(recipe)).toList();

      return rList;
    } catch (e) {
      print('Error: $e');

      return [];
    }
  }

  Future<List<Recipes>> searchRecipes({required String keyword}) async {
    try {
      final res = await _dio.get('$url/recipes/search?q=$keyword');

      final List<dynamic> rJson = res.data['recipes'] as List<dynamic>;

      final rList = rJson.map((recipe) => Recipes.fromJson(recipe)).toList();

      return rList;
    } catch (e) {
      print('Error: $e');

      return [];
    }
  }
}
