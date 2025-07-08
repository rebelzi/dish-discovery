# 🍳 Dish Discovery

Dish Discovery adalah aplikasi mobile Flutter yang memungkinkan pengguna untuk menemukan dan menjelajahi berbagai resep masakan dari seluruh dunia. Aplikasi ini menggunakan TheMealDB API untuk menyediakan data resep yang lengkap dan terkini, serta dilengkapi dengan fitur Chef AI yang canggih.

## ✨ Fitur Utama

### 🤖 Chef AI Assistant
- **AI-powered recipe suggestions** - Rekomendasi resep berdasarkan bahan yang tersedia
- **Smart cooking tips** - Tips memasak dan substitusi bahan dari AI
- **Personalized recommendations** - Saran resep yang disesuaikan dengan preferensi pengguna
- **Interactive cooking guidance** - Panduan memasak interaktif dengan AI assistant
- **Ingredient analysis** - Analisis nutrisi dan informasi bahan makanan
- **Recipe modification** - Modifikasi resep untuk diet khusus atau alergi

### 🔍 Pencarian Resep
- Pencarian resep berdasarkan nama makanan
- Filter resep berdasarkan area/negara (British, Italian, Chinese, dll)
- Hasil pencarian real-time dengan API integration
- **AI-enhanced search** - Pencarian yang diperkuat dengan natural language processing

### 📱 Antarmuka yang Menarik
- Design modern dengan Material Design 3
- Carousel slider untuk menampilkan resep populer
- Grid layout yang responsif untuk browsing resep
- Loading states dan error handling yang baik
- **AI Chat Interface** - Antarmuka chat yang intuitif untuk berinteraksi dengan Chef AI

### 📖 Detail Resep Lengkap
- Informasi lengkap tentang resep (nama, kategori, area)
- Daftar bahan-bahan dengan takaran yang tepat
- Instruksi memasak step-by-step
- Gambar resep berkualitas tinggi
- Link ke video tutorial YouTube (jika tersedia)
- **AI cooking assistance** - Bantuan real-time saat memasak

### 🔐 Autentikasi
- Login dengan email dan password
- Integrasi Google Sign-In
- Registrasi pengguna baru
- Logout functionality

## 🛠️ Teknologi yang Digunakan

### Framework & Languages
- **Flutter** - Framework UI cross-platform
- **Dart** - Bahasa pemrograman

### AI & Machine Learning
- **Firebase AI** - AI assistant untuk Chef AI functionality
- **flutter_ai_toolkit: ^0.9.1** - Package untuk integrasi AI dengan Firebase
- **Natural Language Processing** - Pemrosesan bahasa alami untuk chat interface
- **Machine Learning Models** - Model untuk rekomendasi dan personalisasi

### State Management
- **BLoC (Business Logic Component)** - Pattern untuk state management
- **flutter_bloc** - Library implementasi BLoC pattern

### HTTP & API
- **http** - HTTP client untuk API calls
- **TheMealDB API** - External API untuk data resep
- **Firebase AI API** - API untuk AI assistant features

### UI/UX
- **Google Fonts** - Typography yang menarik
- **Carousel Slider** - Widget carousel untuk tampilan slider
- **Material Design 3** - Design system terbaru dari Google
- **Animated Text Kit** - Animasi text untuk chat interface
- **Lottie** - Animasi untuk AI loading states

### Authentication
- **Firebase Authentication** - Backend authentication
- **Google Sign-In** - OAuth integration

## 📋 Prasyarat

Sebelum menjalankan aplikasi, pastikan Anda sudah menginstall:

- Flutter SDK (versi 3.0 atau lebih baru)
- Dart SDK
- Android Studio / VS Code
- Android Emulator atau iOS Simulator
- Git
- **Firebase Project** - Untuk authentication dan AI features

## 🚀 Instalasi & Setup

1. **Clone repository**
   ```bash
   git clone https://github.com/rebelzi/dish_discover.git
   cd dish_discover
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Setup Firebase** (untuk authentication dan AI)
   - Buat project baru di [Firebase Console](https://console.firebase.google.com/)
   - Tambahkan aplikasi Android/iOS
   - Download `google-services.json` (Android) atau `GoogleService-Info.plist` (iOS)
   - Letakkan file konfigurasi di direktori yang sesuai
   - Aktifkan Authentication dan Google Sign-In di Firebase Console
   - **Aktifkan Firebase AI** di Firebase Console
   - **Setup Vertex AI** untuk AI capabilities

4. **Setup Firebase AI** (untuk Chef AI)
   - Buka Firebase Console > Project Settings
   - Navigate ke tab "General" > "Your apps"
   - Pastikan Firebase AI sudah diaktifkan
   - Configure AI model preferences

5. **Konfigurasi API**
   - Aplikasi menggunakan TheMealDB API yang gratis
   - Base URL TheMealDB: `https://www.themealdb.com/api/json/v1/1/`
   - Firebase AI: Automatic configuration melalui Firebase SDK

6. **Dependencies Configuration**
   Pastikan `pubspec.yaml` include:
   ```yaml
   dependencies:
     flutter_ai_toolkit: ^latest_version
     firebase_core: ^latest_version
     firebase_auth: ^latest_version
     cloud_firestore: ^latest_version
   ```

7. **Run aplikasi**
   ```bash
   flutter run
   ```

## 📁 Struktur Proyek

```
lib/
├── bloc/                          # BLoC state management
│   ├── auth/                      # Authentication BLoC
│   ├── meal/                      # Meal list BLoC
│   ├── meal_detail/               # Meal detail BLoC
├── models/                        # Data models
│   ├── model_list_meal.dart       # Meal list model
│   ├── meal_detail_model.dart     # Meal detail model
├── pages/                         # Screen/Page widgets
│   ├── auth/                      # Authentication pages
│   ├── custom/                    # Custom widgets
│   ├── home_page.dart             # Home screen
│   ├── detail_resep_page.dart     # Recipe detail screen
│   └── chef_ai_page.dart          # Chef AI chat screen
├── repository/                    # Data layer
│   ├── list_meals_controller.dart # API service
├── theme/                         # App theming
│   └── theme.dart                 # Color schemes & themes
└── main.dart                      # App entry point
```

## 🌐 API Endpoints

### TheMealDB API
- **Get meals by area**: `GET /filter.php?a={area}`
- **Search meals**: `GET /search.php?s={query}`
- **Get meal details**: `GET /lookup.php?i={mealId}`

### Firebase AI
- **Chat Completions**: Handled by `flutter_ai_toolkit`
- **Model Management**: Firebase Console configuration
- **Real-time responses**: Firebase AI integration

## 🤖 Fitur Chef AI (Firebase AI)

### AI Assistant Capabilities
1. **Recipe Recommendations**
   - Analisis bahan yang tersedia di rumah
   - Saran resep berdasarkan preferensi diet
   - Rekomendasi berdasarkan waktu memasak yang tersedia

2. **Smart Cooking Guidance**
   - Tips memasak real-time
   - Troubleshooting masalah saat memasak
   - Substitusi bahan jika tidak tersedia

3. **Nutritional Analysis**
   - Informasi nutrisi lengkap
   - Kalori dan macro nutrients
   - Saran untuk diet sehat

4. **Interactive Chat**
   - Natural language conversation menggunakan `flutter_ai_toolkit`
   - Context-aware responses dari Firebase AI
   - Personalized cooking advice

### Firebase AI Integration
```dart
// Example usage dengan flutter_ai_toolkit
import 'package:flutter_ai_toolkit/flutter_ai_toolkit.dart';

class ChefAIService {
  final FirebaseVertexAI _vertexAI = FirebaseVertexAI.instance;
  
  Future<String> getCookingAdvice(String userMessage) async {
    final model = _vertexAI.generativeModel(model: 'gemini-pro');
    final prompt = 'You are a professional chef assistant. $userMessage';
    
    final response = await model.generateContent([Content.text(prompt)]);
    return response.text ?? 'Maaf, saya tidak bisa membantu saat ini.';
  }
}
```

### AI Prompt Examples
```
User: "Saya punya ayam, bawang, dan tomat. Bisa buatkan resep?"
AI: "Tentu! Dengan bahan tersebut, saya rekomendasikan Ayam Tumis Tomat yang lezat..."

User: "Bagaimana cara membuat nasi goreng yang enak?"
AI: "Berikut tips untuk nasi goreng yang sempurna: 1. Gunakan nasi yang sudah dingin..."
```

## 🔧 Konfigurasi

### Firebase Configuration
1. Setup Firebase project
2. Enable Authentication
3. Configure Google Sign-In
4. **Enable Vertex AI API**
5. **Configure AI model preferences**
6. Add platform-specific configuration files

### AI Configuration (Firebase AI)
1. Setup Firebase project dengan AI enabled
2. Configure Vertex AI permissions
3. Set up usage monitoring
4. Configure rate limits
5. Setup AI model preferences (Gemini Pro recommended)

### flutter_ai_toolkit Configuration
```dart
// main.dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  
  // Initialize AI Toolkit
  await FirebaseVertexAI.instance.initialize();
  
  runApp(const MyApp());
}
```

## 💰 Biaya & Limitasi

### Firebase AI Usage
- **Vertex AI Pricing**: Pay-per-use model
- **Gemini Pro**: ~$0.00025 per 1K characters input
- **Rate limits**: Configure di Firebase Console
- **Monitoring**: Firebase Usage dashboard

### Optimisasi Biaya
- Caching AI responses untuk pertanyaan umum
- Character limit management
- User session optimization
- Implement request batching

## 🔒 Keamanan & Privacy

### Data Protection
- Chat history disimpan di Firebase Firestore dengan encryption
- User data protection sesuai Firebase security rules
- User consent untuk AI features
- Automatic data cleanup policies

### API Security
- Firebase security rules untuk AI access
- User authentication required untuk AI features
- Request rate limiting via Firebase
- Error handling yang aman

## 🧪 Testing

```bash
# Run unit tests
flutter test

# Run integration tests
flutter test integration_test/

# Run Firebase AI service tests
flutter test test/services/firebase_ai_service_test.dart

# Generate test coverage
flutter test --coverage
```

## 📞 Support

Jika Anda mengalami masalah atau memiliki pertanyaan:

- Buat issue di GitHub repository
- Email: firdauschuzaeni@fclabs.my.id
- Developer: contact@fclabs.my.id
- Documentation: [Wiki Pages](https://github.com/rebelzi/dish_discover/wiki)

---

<div align="center">

## 💖 Made with Love by Dish Discovery Team

**⭐ Jangan lupa untuk memberikan star jika project ini membantu Anda!** ⭐

---

**© 2025 Dish Discovery Team. All rights reserved.**

*Dish Discovery - Your AI-Powered Cooking Companion*

</div>
