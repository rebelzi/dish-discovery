import 'package:dish_discover/pages/onBoarding/onboarding_three_page.dart';
import 'package:dish_discover/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingTwoPage extends StatelessWidget {
  const OnboardingTwoPage({super.key});

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
                'Temukan Ribuan Resep',
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
                    'assets/onboarding/TemukanResep.png',
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
                    backgroundColor: Colors.grey[500],
                  ),
                  SizedBox(width: width * 0.01),
                  CircleAvatar(
                    radius: width * 0.015,
                    backgroundColor: Colors.grey[200],
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
                    Navigator.of(context, rootNavigator: true).push(
                      MaterialPageRoute(
                        builder: (context) => const OnboardingThreePage(),
                      ),
                    );
                  },
                  child: Text(
                    'Lanjutkan',
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
