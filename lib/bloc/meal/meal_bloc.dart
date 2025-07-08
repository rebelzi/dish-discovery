import 'package:bloc/bloc.dart';
import 'package:dish_discover/models/model_list_meal.dart';
import 'package:dish_discover/repository/list_meals_controller.dart';
import 'package:equatable/equatable.dart';

part 'meal_event.dart';
part 'meal_state.dart';

class MealBloc extends Bloc<MealEvent, MealState> {
  final ListMealsController _mealRepository;

  MealBloc({required ListMealsController mealRepository})
      : _mealRepository = mealRepository,
        super(MealInitial()) {
    on<LoadMeals>(_onLoadMeals);
    on<RefreshMeals>(_onRefreshMeals);
    on<SearchMeals>(_onSearchMeals);
  }

  void _onLoadMeals(LoadMeals event, Emitter<MealState> emit) async {
    emit(MealLoading());
    try {
      final mealResponse = await _mealRepository.getMealsByArea(event.area);
      emit(MealLoaded(meals: mealResponse.meals, area: event.area));
    } catch (e) {
      emit(MealError(message: e.toString()));
    }
  }

  void _onRefreshMeals(RefreshMeals event, Emitter<MealState> emit) async {
    try {
      final mealResponse = await _mealRepository.getMealsByArea(event.area);
      emit(MealLoaded(meals: mealResponse.meals, area: event.area));
    } catch (e) {
      emit(MealError(message: e.toString()));
    }
  }

  void _onSearchMeals(SearchMeals event, Emitter<MealState> emit) async {
    emit(MealLoading());
    try {
      final mealResponse = await _mealRepository.searchMeals(event.query);
      emit(MealLoaded(
        meals: mealResponse.meals,
        area: 'search',
        query: event.query,
      ));
    } catch (e) {
      emit(MealError(message: e.toString()));
    }
  }
}
