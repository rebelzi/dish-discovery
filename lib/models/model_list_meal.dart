import 'package:equatable/equatable.dart';

class Meal extends Equatable {
  final String idMeal;
  final String strMeal;
  final String strMealThumb;

  const Meal({
    required this.idMeal,
    required this.strMeal,
    required this.strMealThumb,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      idMeal: json['idMeal'] ?? '',
      strMeal: json['strMeal'] ?? '',
      strMealThumb: json['strMealThumb'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idMeal': idMeal,
      'strMeal': strMeal,
      'strMealThumb': strMealThumb,
    };
  }

  @override
  List<Object?> get props => [idMeal, strMeal, strMealThumb];
}

class MealResponse extends Equatable {
  final List<Meal> meals;

  const MealResponse({required this.meals});

  factory MealResponse.fromJson(Map<String, dynamic> json) {
    var mealsJson = json['meals'] as List<dynamic>?;
    List<Meal> meals = [];
    
    if (mealsJson != null) {
      meals = mealsJson.map((mealJson) => Meal.fromJson(mealJson)).toList();
    }
    
    return MealResponse(meals: meals);
  }

  @override
  List<Object?> get props => [meals];
}
