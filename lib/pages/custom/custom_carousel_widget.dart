import 'package:carousel_slider/carousel_slider.dart';
import 'package:dish_discover/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomCarouselWidget extends StatefulWidget {
  const CustomCarouselWidget({super.key});

  @override
  State<CustomCarouselWidget> createState() => _CustomCarouselWidgetState();
}

class _CustomCarouselWidgetState extends State<CustomCarouselWidget> {
  final CarouselSliderController _carouselController = CarouselSliderController();

  final List<String> imgList = [
    'https://www.themealdb.com/images/media/meals/wai9bw1619788844.jpg',
    'https://www.themealdb.com/images/media/meals/ryppsv1511815505.jpg',
    'https://www.themealdb.com/images/media/meals/1550441882.jpg',
    'https://www.themealdb.com/images/media/meals/1548772327.jpg',
    'https://www.themealdb.com/images/media/meals/wyxwsp1486979827.jpg',
    'https://www.themealdb.com/images/media/meals/ustsqw1468250014.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(0, 255, 255, 255),
      body: Column(
        children: [
          // Carousel Slider
          CarouselSlider(
            carouselController: _carouselController,
            options: CarouselOptions(
              height: 200.0,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              viewportFraction: 0.85,
            ),
            items: imgList
                .map(
                  (item) => Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Image.network(
                        item,
                        fit: BoxFit.cover,
                        width: 1000.0,
                        loadingBuilder:
                            (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Container(
                            width: 1000.0,
                            height: 200.0,
                            color: const Color.fromARGB(0, 224, 224, 224),
                            child: Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primary,
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 1000.0,
                            height: 200.0,
                            color: const Color.fromARGB(0, 224, 224, 224),
                            child: Icon(
                              Icons.error,
                              color: Colors.red,
                              size: 50,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}