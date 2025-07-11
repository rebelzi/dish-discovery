import 'package:dish_discover/bloc/auth/auth_bloc.dart';
import 'package:dish_discover/bloc/auth/auth_event.dart';
import 'package:dish_discover/bloc/auth/auth_state.dart';
import 'package:dish_discover/main.dart';
import 'package:dish_discover/pages/auth/login_page.dart';
import 'package:dish_discover/pages/custom/custom_menu_profile.dart';
import 'package:dish_discover/pages/profile/edit_profile_page.dart';
import 'package:dish_discover/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        children: [
          // start header profile
          Container(
            height: height * 0.3,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/profile_image.png'),
                  backgroundColor: Colors.transparent,
                ),
                SizedBox(height: height * 0.01),
                ValueListenableBuilder<String>(
                  valueListenable: UserData.userNameNotifier,
                  builder: (context, userName, child) {
                    return Text(
                      userName,
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    );
                  },
                ),
                SizedBox(height: height * 0.005),
                Text(
                  "admin@gmail.com",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          // end header profile
          SizedBox(height: height * 0.02),
          //start menu list
          Column(
            children: [
              CustomMenuProfile(
                title: 'Edit Profile',
                icon: Icons.person,
                onTap: () {
                  Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          EditProfilePage(),
                    ),
                  );
                },
              ),
            ],
          ),
          //end menu list
          Expanded(child: Container()),
          //start logout button
          BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is UnAuthenticated) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Logout successful'),
                    backgroundColor: Colors.green,
                  ),
                );
                Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  (route) => false,
                );
              } else if (state is AuthError) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              }
            },
            builder: (context, state) {
              return GestureDetector(
                onTap: () {
                  context.read<AuthBloc>().add(LogoutRequest());
                },
                child: Container(
                  // height: height * 0.07,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Logout',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
