import 'package:carousel_slider/carousel_slider.dart';
import 'package:dish_discover/bloc/meal/meal_bloc.dart';
import 'package:dish_discover/main.dart';
import 'package:dish_discover/pages/custom/custom_card_menu.dart';
import 'package:dish_discover/pages/custom/custom_carousel_widget.dart';
import 'package:dish_discover/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<MealBloc>().add(const LoadMeals(area: 'british'));
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //start text header
            Padding(
              padding: EdgeInsets.only(
                left: width * 0.07,
                right: width * 0.07,
                top: height * 0.07,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ValueListenableBuilder<String>(
                    valueListenable: UserData.userNameNotifier,
                    builder: (context, userName, child) {
                      return Text(
                        "Halo $userName!",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      );
                    },
                  ),
                  SizedBox(height: height * 0.001),
                  Text(
                    "Mau masak apa hari ini?",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  //end text header
                  SizedBox(height: height * 0.02),
                  //start search bar
                  TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFF6F6F6),
                      hintText: "Cari Resep...",
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      suffixIcon: _searchController.text.isNotEmpty
                          ? IconButton(
                              icon: Icon(Icons.clear, color: Colors.grey),
                              onPressed: () {
                                _searchController.clear();
                                context.read<MealBloc>().add(
                                  const LoadMeals(area: 'british'),
                                );
                                setState(() {});
                              },
                            )
                          : null,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                    onSubmitted: (value) {
                      if (value.trim().isNotEmpty) {
                        context.read<MealBloc>().add(
                          SearchMeals(query: value.trim()),
                        );
                      } else {
                        context.read<MealBloc>().add(
                          const LoadMeals(area: 'british'),
                        );
                      }
                    },
                  ),
                  //end search bar
                  SizedBox(height: height * 0.02),
                ],
              ),
            ),
            //start carousel slider
            SizedBox(height: 200, child: CustomCarouselWidget()),
            //end carousel slider
            SizedBox(height: height * 0.02),
            //start grid view
            Padding(
              padding: EdgeInsets.only(left: width * 0.07, right: width * 0.07),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Resep Populer",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  BlocBuilder<MealBloc, MealState>(
                    builder: (context, state) {
                      if (state is MealLoading) {
                        return SizedBox(
                          height: 200,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primary,
                            ),
                          ),
                        );
                      } else if (state is MealLoaded) {
                        if (state.meals.isEmpty) {
                          return SizedBox(
                            height: 300,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.search_off,
                                    size: 80,
                                    color: Colors.black,
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    _searchController.text.isNotEmpty
                                        ? "Tidak ada resep dengan kata kunci '${_searchController.text}'"
                                        : "Tidak ada resep yang tersedia",
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "Coba kata kunci lain atau lihat resep populer",
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: Colors.black54,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: 20),
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      _searchController.clear();
                                      context.read<MealBloc>().add(
                                        const LoadMeals(area: 'british'),
                                      );
                                      setState(() {});
                                    },
                                    icon: Icon(Icons.refresh),
                                    label: Text("Lihat Resep Populer"),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black,
                                      foregroundColor: Colors.white,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 12,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }

                        final displayMeals = state.meals.take(20).toList();

                        return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 13,
                                childAspectRatio: 0.88,
                              ),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: displayMeals.length,
                          itemBuilder: (context, index) {
                            final meal = displayMeals[index];
                            return CustomCardMenu(meal: meal);
                          },
                        );
                      } else if (state is MealError) {
                        return SizedBox(
                          height: 200,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.error_outline,
                                  size: 50,
                                  color: Colors.red,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Error: ${state.message}',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: Colors.red,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    if (_searchController.text.isNotEmpty) {
                                      context.read<MealBloc>().add(
                                        SearchMeals(
                                          query: _searchController.text.trim(),
                                        ),
                                      );
                                    } else {
                                      context.read<MealBloc>().add(
                                        const LoadMeals(area: 'british'),
                                      );
                                    }
                                  },
                                  child: Text("Retry"),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        return SizedBox(
                          height: 200,
                          child: Center(
                            child: Text(
                              "No meals available",
                              style: GoogleFonts.poppins(fontSize: 16),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  //end grid view
                  SizedBox(height: height * 0.02),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
