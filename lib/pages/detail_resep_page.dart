import 'package:dish_discover/bloc/meal_detail/meal_detail_bloc.dart';
import 'package:dish_discover/repository/list_meals_controller.dart';
import 'package:dish_discover/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailResepPage extends StatelessWidget {
  final String mealId;
  const DetailResepPage({super.key, required this.mealId});

  List<String> parseInstructions(String instructions) {
    return instructions
        .split(RegExp(r'\r?\n'))
        .where((step) => step.trim().isNotEmpty)
        .map((step) => step.trim())
        .toList();
  }

  List<Map<String, String>> getIngredientsWithMeasures(dynamic meal) {
    List<Map<String, String>> ingredients = [];

    for (int i = 1; i <= 20; i++) {
      String? ingredient = meal.getPropertyValue('strIngredient$i');
      String? measure = meal.getPropertyValue('strMeasure$i');

      if (ingredient != null && ingredient.trim().isNotEmpty) {
        ingredients.add({
          'ingredient': ingredient.trim(),
          'measure': measure?.trim() ?? '',
        });
      }
    }

    return ingredients;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) =>
          MealDetailBloc(mealRepository: ListMealsController())
            ..add(LoadMealDetail(mealId: mealId)),
      child: Scaffold(
        backgroundColor: AppColors.secondary,
        body: BlocBuilder<MealDetailBloc, MealDetailState>(
          builder: (context, state) {
            if (state is MealDetailLoading) {
              return Center(
                child: CircularProgressIndicator(color: AppColors.primary),
              );
            } else if (state is MealDetailLoaded) {
              final meal = state.mealDetail;
              final instructions = meal.strInstructions ?? '';
              final steps = parseInstructions(instructions);

              return SingleChildScrollView(
                padding: EdgeInsets.only(
                  left: width * 0.05,
                  right: width * 0.05,
                  top: height * 0.07,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_circle_left_outlined,
                            color: Colors.black,
                            size: width * 0.1,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            meal.strMeal,
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.02),

                    // Image
                    Container(
                      width: double.infinity,
                      height: 204,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          meal.strMealThumb ?? '',
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primary,
                              ),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[300],
                              child: Icon(
                                Icons.restaurant_menu,
                                size: 60,
                                color: Colors.grey[600],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.02),

                    // Bahan-bahan (Ingredients)
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bahan - Bahan',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: height * 0.015),
                          ...meal.ingredients.asMap().entries.map((entry) {
                            int index = entry.key;
                            String ingredient = entry.value;
                            String measure = index < meal.measures.length
                                ? meal.measures[index]
                                : '';

                            return Padding(
                              padding: EdgeInsets.only(bottom: 8),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 10, top: 2),
                                    width: 6,
                                    height: 6,
                                    decoration: BoxDecoration(
                                      color: AppColors.primary,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      '$measure $ingredient'.trim(),
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        height: 1.4,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.02),

                    // Petunjuk Memasak (Instructions)
                    if (steps.isNotEmpty)
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Petunjuk Memasak',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: height * 0.015),
                            ...steps.asMap().entries.map((entry) {
                              int index = entry.key;
                              String step = entry.value;
                              return Padding(
                                padding: EdgeInsets.only(bottom: 12),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                        right: 10,
                                        top: 2,
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColors.primary,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Text(
                                        '${index + 1}',
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        step,
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          height: 1.4,
                                          color: Colors.black87,
                                        ),
                                        textAlign: TextAlign.justify,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ],
                        ),
                      ),
                    SizedBox(height: height * 0.02),
                  ],
                ),
              );
            } else if (state is MealDetailError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error_outline, size: 60, color: Colors.red),
                    SizedBox(height: 16),
                    Text(
                      'Error: ${state.message}',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.red,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        context.read<MealDetailBloc>().add(
                          LoadMealDetail(mealId: mealId),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                      ),
                      child: Text('Retry'),
                    ),
                  ],
                ),
              );
            } else {
              return Center(
                child: Text(
                  'No data available',
                  style: GoogleFonts.poppins(fontSize: 16),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
