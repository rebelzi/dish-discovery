import 'dart:convert';

import 'package:dish_discover/models/model_detail_meal.dart';
import 'package:dish_discover/models/model_list_meal.dart';
import 'package:http/http.dart' as http;

class ListMealsController {
  static const String _baseUrl = 'https://www.themealdb.com/api/json/v1/1';

  Future<MealResponse> getMealsByArea(String area) async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/filter.php?a=$area'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return MealResponse.fromJson(jsonData);
      } else {
        throw Exception('Failed to load meals: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load meals: $e');
    }
  }

  Future<MealResponse> searchMeals(String query) async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/search.php?s=$query'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return MealResponse.fromJson(jsonData);
      } else {
        throw Exception('Failed to search meals: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to search meals: $e');
    }
  }

  Future<MealDetailResponse> getMealDetail(String mealID) async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/lookup.php?i=$mealID'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return MealDetailResponse.fromJson(jsonData);
      } else {
        throw Exception('Failed to load meal detail: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load meal detail: $e');
    }
  }
}