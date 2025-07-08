part of 'meal_bloc.dart';

abstract class MealEvent extends Equatable {
  const MealEvent();

  @override
  List<Object> get props => [];
}

class LoadMeals extends MealEvent {
  final String area;

  const LoadMeals({required this.area});

  @override
  List<Object> get props => [area];
}

class RefreshMeals extends MealEvent {
  final String area;

  const RefreshMeals({required this.area});

  @override
  List<Object> get props => [area];
}

class SearchMeals extends MealEvent {
  final String query;

  const SearchMeals({required this.query});

  @override
  List<Object> get props => [query];
}
