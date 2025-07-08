import 'package:dish_discover/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingThreePage extends StatelessWidget {
  const OnboardingThreePage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(
            top: height * 0.28,
            left: width * 0.07,
            right: width * 0.07,
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Tanya Chef AI Anda',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: height * 0.04),
              CircleAvatar(
                radius: width * 0.35,
                backgroundColor: Colors.grey[100],
                child: ClipOval(
                  child: Image.asset(
                    'assets/onboarding/ChefAI.png',
                    width: width * 0.7,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: height * 0.15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  CircleAvatar(
                    radius: width * 0.015,
                    backgroundColor: Colors.grey[200],
                  ),
                  SizedBox(width: width * 0.01),
                  CircleAvatar(
                    radius: width * 0.015,
                    backgroundColor: Colors.grey[200],
                  ),
                  SizedBox(width: width * 0.01),
                  CircleAvatar(
                    radius: width * 0.015,
                    backgroundColor: Colors.grey[500],
                  ),
                ],
              ),
              SizedBox(height: height * 0.03),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 20),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: Text(
                    'Mulai',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
