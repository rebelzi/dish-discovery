import 'package:bloc/bloc.dart';
import 'package:dish_discover/models/model_detail_meal.dart';
import 'package:dish_discover/repository/list_meals_controller.dart';
import 'package:equatable/equatable.dart';

part 'meal_detail_event.dart';
part 'meal_detail_state.dart';

class MealDetailBloc extends Bloc<MealDetailEvent, MealDetailState> {
  final ListMealsController _mealRepository;

  MealDetailBloc({required ListMealsController mealRepository})
      : _mealRepository = mealRepository,
        super(MealDetailInitial()) {
    on<LoadMealDetail>(_onLoadMealDetail);
  }

  void _onLoadMealDetail(LoadMealDetail event, Emitter<MealDetailState> emit) async {
    emit(MealDetailLoading());
    try {
      final mealDetailResponse = await _mealRepository.getMealDetail(event.mealId);
      if (mealDetailResponse.meals.isNotEmpty) {
        emit(MealDetailLoaded(mealDetail: mealDetailResponse.meals.first));
      } else {
        emit(const MealDetailError(message: 'Meal detail not found'));
      }
    } catch (e) {
      emit(MealDetailError(message: e.toString()));
    }
  }
}
