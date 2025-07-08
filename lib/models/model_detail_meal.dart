import 'package:equatable/equatable.dart';

class ModelDetailMeal extends Equatable {
  final String idMeal;
  final String strMeal;
  final String? strMealAlternate;
  final String strCategory;
  final String strArea;
  final String strInstructions;
  final String strMealThumb;
  final String strTags;
  final String strYoutube;
  final String strSource;
  final String? strImageSource;
  final String? strCreativeCommonsConfirmed;
  final String? dateModified;
  final String? strIngredient1;
  final String? strIngredient2;
  final String? strIngredient3;
  final String? strIngredient4;
  final String? strIngredient5;
  final String? strIngredient6;
  final String? strIngredient7;
  final String? strIngredient8;
  final String? strIngredient10;
  final String? strIngredient9;
  final String? strIngredient11;
  final String? strIngredient12;
  final String? strIngredient13;
  final String? strIngredient14;
  final String? strIngredient15;
  final String? strIngredient16;
  final String? strIngredient17;
  final String? strIngredient18;
  final String? strIngredient19;
  final String? strIngredient20;
  final String? strMeasure1;
  final String? strMeasure2;
  final String? strMeasure3;
  final String? strMeasure4;
  final String? strMeasure5;
  final String? strMeasure6;
  final String? strMeasure7;
  final String? strMeasure8;
  final String? strMeasure9;
  final String? strMeasure10;
  final String? strMeasure11;
  final String? strMeasure12;
  final String? strMeasure13;
  final String? strMeasure14;
  final String? strMeasure15;
  final String? strMeasure16;
  final String? strMeasure17;
  final String? strMeasure18;
  final String? strMeasure19;
  final String? strMeasure20;

  const ModelDetailMeal({
    required this.idMeal,
    required this.strMeal,
    this.strMealAlternate,
    required this.strCategory,
    required this.strArea,
    required this.strInstructions,
    required this.strMealThumb,
    required this.strTags,
    required this.strYoutube,
    required this.strSource,
    this.strImageSource,
    this.strCreativeCommonsConfirmed,
    this.dateModified,
    this.strIngredient1,
    this.strIngredient2,
    this.strIngredient3,
    this.strIngredient4,
    this.strIngredient5,
    this.strIngredient6,
    this.strIngredient7,
    this.strIngredient8,
    this.strIngredient9,
    this.strIngredient10,
    this.strIngredient11,
    this.strIngredient12,
    this.strIngredient13,
    this.strIngredient14,
    this.strIngredient15,
    this.strIngredient16,
    this.strIngredient17,
    this.strIngredient18,
    this.strIngredient19,
    this.strIngredient20,
    this.strMeasure1,
    this.strMeasure2,
    this.strMeasure3,
    this.strMeasure4,
    this.strMeasure5,
    this.strMeasure6,
    this.strMeasure7,
    this.strMeasure8,
    this.strMeasure9,
    this.strMeasure10,
    this.strMeasure11,
    this.strMeasure12,
    this.strMeasure13,
    this.strMeasure14,
    this.strMeasure15,
    this.strMeasure16,
    this.strMeasure17,
    this.strMeasure18,
    this.strMeasure19,
    this.strMeasure20,
  });

  factory ModelDetailMeal.fromJson(Map<String, dynamic> json) {
    return ModelDetailMeal(
      idMeal: json['idMeal'] ?? '',
      strMeal: json['strMeal'] ?? '',
      strMealAlternate: json['strMealAlternate'],
      strCategory: json['strCategory'] ?? '',
      strArea: json['strArea'] ?? '',
      strInstructions: json['strInstructions'] ?? '',
      strMealThumb: json['strMealThumb'] ?? '',
      strTags: json['strTags'] ?? '',
      strYoutube: json['strYoutube'] ?? '',
      strSource: json['strSource'] ?? '',
      strImageSource: json['strImageSource'],
      strCreativeCommonsConfirmed: json['strCreativeCommonsConfirmed'],
      dateModified: json['dateModified'],
      strIngredient1: json['strIngredient1'],
      strIngredient2: json['strIngredient2'],
      strIngredient3: json['strIngredient3'],
      strIngredient4: json['strIngredient4'],
      strIngredient5: json['strIngredient5'],
      strIngredient6: json['strIngredient6'],
      strIngredient7: json['strIngredient7'],
      strIngredient8: json['strIngredient8'],
      strIngredient9: json['strIngredient9'],
      strIngredient10: json['strIngredient10'],
      strIngredient11: json['strIngredient11'],
      strIngredient12: json['strIngredient12'],
      strIngredient13: json['strIngredient13'],
      strIngredient14: json['strIngredient14'],
      strIngredient15: json['strIngredient15'],
      strIngredient16: json['strIngredient16'],
      strIngredient17: json['strIngredient17'],
      strIngredient18: json['strIngredient18'],
      strIngredient19: json['strIngredient19'],
      strIngredient20: json['strIngredient20'],
      strMeasure1: json['strMeasure1'],
      strMeasure2: json['strMeasure2'],
      strMeasure3: json['strMeasure3'],
      strMeasure4: json['strMeasure4'],
      strMeasure5: json['strMeasure5'],
      strMeasure6: json['strMeasure6'],
      strMeasure7: json['strMeasure7'],
      strMeasure8: json['strMeasure8'],
      strMeasure9: json['strMeasure9'],
      strMeasure10: json['strMeasure10'],
      strMeasure11: json['strMeasure11'],
      strMeasure12: json['strMeasure12'],
      strMeasure13: json['strMeasure13'],
      strMeasure14: json['strMeasure14'],
      strMeasure15: json['strMeasure15'],
      strMeasure16: json['strMeasure16'],
      strMeasure17: json['strMeasure17'],
      strMeasure18: json['strMeasure18'],
      strMeasure19: json['strMeasure19'],
      strMeasure20: json['strMeasure20'],
    );
  }

  List<String> get ingredients {
    List<String> ingredientsList = [];

    if (strIngredient1?.isNotEmpty == true)
      ingredientsList.add(strIngredient1!);
    if (strIngredient2?.isNotEmpty == true)
      ingredientsList.add(strIngredient2!);
    if (strIngredient3?.isNotEmpty == true)
      ingredientsList.add(strIngredient3!);
    if (strIngredient4?.isNotEmpty == true)
      ingredientsList.add(strIngredient4!);
    if (strIngredient5?.isNotEmpty == true)
      ingredientsList.add(strIngredient5!);
    if (strIngredient6?.isNotEmpty == true)
      ingredientsList.add(strIngredient6!);
    if (strIngredient7?.isNotEmpty == true)
      ingredientsList.add(strIngredient7!);
    if (strIngredient8?.isNotEmpty == true)
      ingredientsList.add(strIngredient8!);
    if (strIngredient9?.isNotEmpty == true)
      ingredientsList.add(strIngredient9!);
    if (strIngredient10?.isNotEmpty == true)
      ingredientsList.add(strIngredient10!);
    if (strIngredient11?.isNotEmpty == true)
      ingredientsList.add(strIngredient11!);
    if (strIngredient12?.isNotEmpty == true)
      ingredientsList.add(strIngredient12!);
    if (strIngredient13?.isNotEmpty == true)
      ingredientsList.add(strIngredient13!);
    if (strIngredient14?.isNotEmpty == true)
      ingredientsList.add(strIngredient14!);
    if (strIngredient15?.isNotEmpty == true)
      ingredientsList.add(strIngredient15!);
    if (strIngredient16?.isNotEmpty == true)
      ingredientsList.add(strIngredient16!);
    if (strIngredient17?.isNotEmpty == true)
      ingredientsList.add(strIngredient17!);
    if (strIngredient18?.isNotEmpty == true)
      ingredientsList.add(strIngredient18!);
    if (strIngredient19?.isNotEmpty == true)
      ingredientsList.add(strIngredient19!);
    if (strIngredient20?.isNotEmpty == true)
      ingredientsList.add(strIngredient20!);

    return ingredientsList;
  }

  List<String> get measures {
    List<String> measuresList = [];

    if (strMeasure1?.isNotEmpty == true) measuresList.add(strMeasure1!);
    if (strMeasure2?.isNotEmpty == true) measuresList.add(strMeasure2!);
    if (strMeasure3?.isNotEmpty == true) measuresList.add(strMeasure3!);
    if (strMeasure4?.isNotEmpty == true) measuresList.add(strMeasure4!);
    if (strMeasure5?.isNotEmpty == true) measuresList.add(strMeasure5!);
    if (strMeasure6?.isNotEmpty == true) measuresList.add(strMeasure6!);
    if (strMeasure7?.isNotEmpty == true) measuresList.add(strMeasure7!);
    if (strMeasure8?.isNotEmpty == true) measuresList.add(strMeasure8!);
    if (strMeasure9?.isNotEmpty == true) measuresList.add(strMeasure9!);
    if (strMeasure10?.isNotEmpty == true) measuresList.add(strMeasure10!);
    if (strMeasure11?.isNotEmpty == true) measuresList.add(strMeasure11!);
    if (strMeasure12?.isNotEmpty == true) measuresList.add(strMeasure12!);
    if (strMeasure13?.isNotEmpty == true) measuresList.add(strMeasure13!);
    if (strMeasure14?.isNotEmpty == true) measuresList.add(strMeasure14!);
    if (strMeasure15?.isNotEmpty == true) measuresList.add(strMeasure15!);
    if (strMeasure16?.isNotEmpty == true) measuresList.add(strMeasure16!);
    if (strMeasure17?.isNotEmpty == true) measuresList.add(strMeasure17!);
    if (strMeasure18?.isNotEmpty == true) measuresList.add(strMeasure18!);
    if (strMeasure19?.isNotEmpty == true) measuresList.add(strMeasure19!);
    if (strMeasure20?.isNotEmpty == true) measuresList.add(strMeasure20!);

    return measuresList;
  }

  @override
  List<Object?> get props => [
    idMeal,
    strMeal,
    strMealThumb,
    strCategory,
    strArea,
    strInstructions,
    strTags,
    strYoutube,
    strSource,
    strImageSource,
    strCreativeCommonsConfirmed,
    dateModified,
    strIngredient1,
    strIngredient2,
    strIngredient3,
    strIngredient4,
    strIngredient5,
    strIngredient6,
    strIngredient7,
    strIngredient8,
    strIngredient9,
    strIngredient10,
    strIngredient11,
    strIngredient12,
    strIngredient13,
    strIngredient14,
    strIngredient15,
    strIngredient16,
    strIngredient17,
    strIngredient18,
    strIngredient19,
    strIngredient20,
    strMeasure1,
    strMeasure2,
    strMeasure3,
    strMeasure4,
    strMeasure5,
    strMeasure6,
    strMeasure7,
    strMeasure8,
    strMeasure9,
    strMeasure10,
    strMeasure11,
    strMeasure12,
    strMeasure13,
    strMeasure14,
    strMeasure15,
    strMeasure16,
    strMeasure17,
    strMeasure18,
    strMeasure19,
    strMeasure20,
  ];
}

class MealDetailResponse extends Equatable {
  final List<ModelDetailMeal> meals;

  const MealDetailResponse({required this.meals});

  factory MealDetailResponse.fromJson(Map<String, dynamic> json) {
    var mealsJson = json['meals'] as List<dynamic>?;

    List<ModelDetailMeal> meals = [];
    if (mealsJson != null) {
      meals = mealsJson.map((mealJson) => ModelDetailMeal.fromJson(mealJson)).toList();
    }

    return MealDetailResponse(meals: meals);
  }

  @override
  List<Object?> get props => [meals];
}
