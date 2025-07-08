import 'package:dish_discover/models/model_list_meal.dart';
import 'package:dish_discover/pages/detail_resep_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCardMenu extends StatelessWidget {
  final Meal? meal;

  const CustomCardMenu({super.key, this.meal});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (meal != null) {
          // ✅ Pass meal ID ke detail page
          Navigator.of(context, rootNavigator: true).push(
            MaterialPageRoute(
              builder: (context) => DetailResepPage(mealId: meal!.idMeal),
            ),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFF6F6F6),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 4,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: meal?.strMealThumb.isNotEmpty == true
                      ? Image.network(
                          meal!.strMealThumb,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Container(
                              color: Color(0xFFF6F6F6),
                              child: Center(
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.grey,
                                ),
                              ),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Color(0xFFF6F6F6),
                              child: Icon(
                                Icons.restaurant_menu,
                                size: 50,
                                color: Colors.grey,
                              ),
                            );
                          },
                        )
                      : Container(
                          color: Color(0xFFF6F6F6),
                          child: Icon(
                            Icons.restaurant_menu,
                            size: 50,
                            color: Colors.grey,
                          ),
                        ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(8),
                child: Center(
                  child: Text(
                    meal?.strMeal ?? 'Loading...',
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
