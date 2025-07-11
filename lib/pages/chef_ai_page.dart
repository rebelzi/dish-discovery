import 'package:dish_discover/theme/theme.dart';
import 'package:firebase_ai/firebase_ai.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ai_toolkit/flutter_ai_toolkit.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:google_fonts/google_fonts.dart';

class ChefAiPage extends StatelessWidget {
  const ChefAiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: LlmChatView(
        provider: FirebaseProvider(
          model: FirebaseAI.googleAI().generativeModel(
            model: 'gemini-2.0-flash',
            systemInstruction: Content.text(
              'Anda adalah Chef AI masakan yang ahli. '
              'Anda HANYA boleh menjawab pertanyaan yang berkaitan dengan resep masakan, '
              'bahan-bahan makanan, teknik memasak, dan tips kuliner. '
              'Jika pengguna bertanya tentang topik lain selain masakan dan resep, '
              'tolaklah dengan sopan dan arahkan mereka untuk bertanya tentang resep. '
              'Berikan resep yang lengkap dengan bahan dan langkah-langkah yang jelas. '
              'Jawab dalam bahasa Indonesia.',
            ),
          ),
        ),
        enableVoiceNotes: false,
        enableAttachments: true,
        welcomeMessage: 'Halo! Saya Asisten Chef AI. Mau masak apa hari ini? Tanya resep apapun!',
        style: LlmChatViewStyle(
          backgroundColor: AppColors.primary,

          progressIndicatorColor: AppColors.secondary,

          // bubble style ai
          llmMessageStyle: LlmMessageStyle(
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.circular(7),
            ),
            icon: Icons.restaurant_menu,
            iconColor: Colors.grey,
            iconDecoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey.shade300),
            ),
            markdownStyle: MarkdownStyleSheet(
              h1: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              h2: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              p: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              strong: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              listBullet: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ),

          //buble chat user
          userMessageStyle: UserMessageStyle(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7),
            ),
            textStyle: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            )
          ),

          //chat input style
          chatInputStyle: ChatInputStyle(
            backgroundColor: const Color.fromARGB(0, 255, 255, 255),
            textStyle: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
            hintText: "Ketik pertanyaan Anda di sini... ",
          ),

          //button attach image style
          galleryButtonStyle: ActionButtonStyle(
            icon: Icons.image,
            iconColor: Colors.black,
            iconDecoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey.shade300),
            ),
          ),

          //button take photo
          cameraButtonStyle: ActionButtonStyle(
            icon: Icons.camera_alt,
            iconColor: Colors.black,
            iconDecoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey.shade300),
            ),
          ),

        ),
      ),
    );
  }
}
