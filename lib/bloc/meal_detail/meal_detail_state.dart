part of 'meal_detail_bloc.dart';

abstract class MealDetailState extends Equatable {
  const MealDetailState();

  @override
  List<Object> get props => [];
}

class MealDetailInitial extends MealDetailState {}

class MealDetailLoading extends MealDetailState {}

class MealDetailLoaded extends MealDetailState {
  final ModelDetailMeal mealDetail;

  const MealDetailLoaded({required this.mealDetail});

  @override
  List<Object> get props => [mealDetail];
}

class MealDetailError extends MealDetailState {
  final String message;

  const MealDetailError({required this.message});

  @override
  List<Object> get props => [message];
}
