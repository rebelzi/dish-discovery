import 'package:dish_discover/bloc/auth/auth_bloc.dart';
import 'package:dish_discover/bloc/auth/auth_event.dart';
import 'package:dish_discover/bloc/auth/auth_state.dart';
import 'package:dish_discover/bloc/google/google_auth_bloc.dart';
import 'package:dish_discover/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obsecurePassword = true;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is LoginAuthenticated) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Login Berhasil!",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    backgroundColor: Colors.green,
                  ),
                );
                Navigator.pushNamed(context, '/main');
              } else if (state is AuthError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
          ),
          BlocListener<GoogleAuthBloc, GoogleAuthState>(
            listener: (context, state) {
              if (state is GoogleAuthSuccessState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Google Login Berhasil!",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    backgroundColor: Colors.green,
                  ),
                );
                Navigator.pushNamed(context, '/main');
              } else if (state is GoogleAuthErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      state.message,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
          ),
        ],
        child: Padding(
          padding: EdgeInsets.only(top: height * 0.1),
          child: Center(
            child: Column(
              children: [
                // header
                Text(
                  "Log in",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: height * 0.025),
                Text(
                  "Silahkan Masukkan Email dan Password anda",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: height * 0.07),

                // batas header
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(47),
                        topRight: Radius.circular(47),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.07),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // email
                          Text(
                            "Email",
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: height * 0.01),
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                hintText: "Masukkan Email",
                                hintStyle: GoogleFonts.poppins(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 30,
                                  horizontal: 10,
                                ),
                              ),
                            ),
                          ),
                          // end email
                          SizedBox(height: height * 0.02),
                          // password
                          Text(
                            "Password",
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: height * 0.01),
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              controller: _passwordController,
                              obscureText: _obsecurePassword,
                              decoration: InputDecoration(
                                hintText: "Masukkan Password",
                                hintStyle: GoogleFonts.poppins(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 30,
                                  horizontal: 10,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _obsecurePassword = !_obsecurePassword;
                                    });
                                  },
                                  icon: Icon(
                                    _obsecurePassword
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    size: 26,
                                  ),
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          // end password
                          SizedBox(height: height * 0.02),

                          // button login
                          BlocBuilder<AuthBloc, AuthState>(
                            builder: (context, state) {
                              return SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: state is AuthLoading
                                      ? null
                                      : () {
                                          if (_emailController.text.isEmpty ||
                                              _passwordController
                                                  .text
                                                  .isEmpty) {
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  "Email dan Password tidak boleh kosong",
                                                  style: GoogleFonts.poppins(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                backgroundColor: Colors.red,
                                              ),
                                            );
                                          } else {
                                            context.read<AuthBloc>().add(
                                              LoginRequest(
                                                email: _emailController.text
                                                    .trim(),
                                                password: _passwordController
                                                    .text
                                                    .trim(),
                                              ),
                                            );
                                          }
                                        },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: EdgeInsets.symmetric(vertical: 20),
                                  ),
                                  child: state is AuthLoading
                                      ? const CircularProgressIndicator(
                                          color: Colors.white,
                                        )
                                      : Text(
                                          "Login",
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                ),
                              );
                            },
                          ),
                          // end button login
                          SizedBox(height: height * 0.02),
                          // sign up
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Belum punya akun?",
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.center,
                              ),

                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/register');
                                },
                                child: Text(
                                  " Sign Up",
                                  style: GoogleFonts.poppins(
                                    color: AppColors.primary,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // end sign up
                          SizedBox(height: height * 0.02),
                          Center(
                            child: Text(
                              "Atau",
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: height * 0.02),
                          // login google
                          BlocBuilder<GoogleAuthBloc, GoogleAuthState>(
                            builder: (context, googleState) {
                              bool isLoading =
                                  googleState is GoogleAuthLoadingState;

                              return SizedBox(
                                width: double.infinity,
                                child: ElevatedButton.icon(
                                  onPressed: isLoading
                                      ? null
                                      : () {
                                          print(
                                            "Google Sign In button pressed",
                                          );
                                          context.read<GoogleAuthBloc>().add(
                                            const GoogleSignInRequested(),
                                          );
                                        },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: isLoading
                                        ? Colors.grey.shade200
                                        : Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(
                                        color: isLoading
                                            ? Colors.grey.shade400
                                            : Colors.grey.shade300,
                                      ),
                                    ),
                                    padding: EdgeInsets.symmetric(vertical: 16),
                                    elevation: isLoading ? 0 : 1,
                                  ),
                                  icon: isLoading
                                      ? SizedBox(
                                          width: 30,
                                          height: 30,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                            color: AppColors.primary,
                                          ),
                                        )
                                      : Image.asset(
                                          "assets/Google_Logo.png",
                                          height: 30,
                                          width: 30,
                                        ),
                                  label: Text(
                                    isLoading
                                        ? "Signing in..."
                                        : "Login with Google",
                                    style: GoogleFonts.poppins(
                                      color: isLoading
                                          ? Colors.grey.shade600
                                          : Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          // end login google
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
