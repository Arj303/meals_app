import 'dart:convert';
import 'package:http/http.dart' as http;


import '../models/meals_models.dart';

Future<List<Category>> fetchCategories() async {
  final response = await http.get(
    Uri.parse('https://www.themealdb.com/api/json/v1/1/categories.php'),
  );

  if (response.statusCode == 200) {
    List<dynamic> categoriesJson = jsonDecode(response.body)['categories'];
    List<Category> categories = categoriesJson
        .map((json) => Category.fromJson(json))
        .toList();
    return categories;
  } else {
    throw Exception('Failed to load categories');
  }
}