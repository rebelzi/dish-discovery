part of 'meal_bloc.dart';

abstract class MealState extends Equatable {
  const MealState();

  @override
  List<Object> get props => [];
}

class MealInitial extends MealState {}

class MealLoading extends MealState {}

class MealLoaded extends MealState {
  final List<Meal> meals;
  final String area;
  final String? query;

  // ✅ Perbaiki constructor: semua jadi named parameters
  const MealLoaded({
    required this.meals, 
    required this.area,
    this.query,
  });

  @override
  List<Object> get props => [meals, area, query ?? ''];
}

class MealError extends MealState {
  final String message;

  const MealError({required this.message});

  @override
  List<Object> get props => [message];
}
