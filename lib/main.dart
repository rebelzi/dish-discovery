import 'package:dish_discover/bloc/google/google_auth_bloc.dart';
import 'package:dish_discover/bloc/meal/meal_bloc.dart';
import 'package:dish_discover/bloc/meal_detail/meal_detail_bloc.dart';
import 'package:dish_discover/firebase_options.dart';
import 'package:dish_discover/pages/auth/login_page.dart';
import 'package:dish_discover/pages/auth/register_page.dart';
import 'package:dish_discover/pages/home_page.dart';
import 'package:dish_discover/pages/main_page.dart';
import 'package:dish_discover/pages/onBoarding/onboarding_one_pae.dart';
import 'package:dish_discover/pages/splash_screen_page.dart';
import 'package:dish_discover/repository/list_meals_controller.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dish_discover/bloc/auth/auth_bloc.dart';

// ✅ Updated UserData dengan ValueNotifier untuk reactive updates
class UserData {
  // ValueNotifier untuk auto refresh
  static ValueNotifier<String> userNameNotifier = ValueNotifier<String>("User");
  
  // Getter untuk backward compatibility
  static String get userName => userNameNotifier.value;

  static void updateUserName(String newUsername) {
    userNameNotifier.value = newUsername; // ✅ Trigger rebuild
  }

  static void updateUserData({String? name}) {
    if (name != null) {
      userNameNotifier.value = name; // ✅ Trigger rebuild
    }
  }

  static void resetUserData() {
    userNameNotifier.value = "User"; // ✅ Trigger rebuild
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthBloc()),
        BlocProvider(create: (_) => GoogleAuthBloc()),
        BlocProvider(
          create: (_) => MealBloc(mealRepository: ListMealsController()),
        ),
        BlocProvider(
          create: (_) => MealDetailBloc(mealRepository: ListMealsController()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashScreenPage(),
          '/onboarding': (context) => const OnboardingOnePage(),
          '/login': (context) => const LoginPage(),
          '/register': (context) => const RegisterPage(),
          '/home': (context) => const HomePage(),
          '/main': (context) => const MainPage(),
        },
      ),
    );
  }
}
