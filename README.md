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
- **OpenAI GPT API** - AI assistant untuk Chef AI functionality
- **Natural Language Processing** - Pemrosesan bahasa alami untuk chat interface
- **Machine Learning Models** - Model untuk rekomendasi dan personalisasi

### State Management
- **BLoC (Business Logic Component)** - Pattern untuk state management
- **flutter_bloc** - Library implementasi BLoC pattern

### HTTP & API
- **http** - HTTP client untuk API calls
- **TheMealDB API** - External API untuk data resep
- **OpenAI API** - API untuk AI assistant features
- **dio** - Advanced HTTP client untuk AI API integration

### UI/UX
- **Google Fonts** - Typography yang menarik
- **Carousel Slider** - Widget carousel untuk tampilan slider
- **Material Design 3** - Design system terbaru dari Google
- **Animated Text Kit** - Animasi text untuk chat interface
- **Lottie** - Animasi untuk AI loading states

### Authentication
- **Firebase Authentication** - Backend authentication
- **Google Sign-In** - OAuth integration

### Storage
- **Shared Preferences** - Local storage untuk user preferences
- **Hive** - Local database untuk offline AI suggestions
- **SQLite** - Database untuk chat history

## 📋 Prasyarat

Sebelum menjalankan aplikasi, pastikan Anda sudah menginstall:

- Flutter SDK (versi 3.0 atau lebih baru)
- Dart SDK
- Android Studio / VS Code
- Android Emulator atau iOS Simulator
- Git
- **OpenAI API Key** - Untuk fitur Chef AI

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

3. **Setup Firebase** (untuk authentication)
   - Buat project baru di [Firebase Console](https://console.firebase.google.com/)
   - Tambahkan aplikasi Android/iOS
   - Download `google-services.json` (Android) atau `GoogleService-Info.plist` (iOS)
   - Letakkan file konfigurasi di direktori yang sesuai
   - Aktifkan Authentication dan Google Sign-In di Firebase Console

4. **Setup OpenAI API** (untuk Chef AI)
   - Daftar di [OpenAI Platform](https://platform.openai.com/)
   - Dapatkan API key
   - Buat file `.env` di root project:
   ```env
   OPENAI_API_KEY=your_openai_api_key_here
   OPENAI_MODEL=gpt-3.5-turbo
   ```

5. **Konfigurasi API**
   - Aplikasi menggunakan TheMealDB API yang gratis
   - Base URL TheMealDB: `https://www.themealdb.com/api/json/v1/1/`
   - Base URL OpenAI: `https://api.openai.com/v1/`

6. **Run aplikasi**
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
│   └── chef_ai/                   # Chef AI BLoC
├── models/                        # Data models
│   ├── model_list_meal.dart       # Meal list model
│   ├── meal_detail_model.dart     # Meal detail model
│   └── ai_message_model.dart      # AI chat message model
├── pages/                         # Screen/Page widgets
│   ├── auth/                      # Authentication pages
│   ├── custom/                    # Custom widgets
│   ├── home_page.dart             # Home screen
│   ├── detail_resep_page.dart     # Recipe detail screen
│   └── chef_ai_page.dart          # Chef AI chat screen
├── repository/                    # Data layer
│   ├── list_meals_controller.dart # API service
│   └── ai_service.dart            # OpenAI API service
├── services/                      # Business services
│   ├── ai_chat_service.dart       # AI chat functionality
│   └── recommendation_service.dart # AI recommendation engine
├── theme/                         # App theming
│   └── theme.dart                 # Color schemes & themes
├── utils/                         # Utilities
│   ├── constants.dart             # App constants
│   └── ai_prompts.dart            # AI prompt templates
└── main.dart                      # App entry point
```

## 🌐 API Endpoints

### TheMealDB API
- **Get meals by area**: `GET /filter.php?a={area}`
- **Search meals**: `GET /search.php?s={query}`
- **Get meal details**: `GET /lookup.php?i={mealId}`

## 🤖 Fitur Chef AI

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
   - Natural language conversation
   - Context-aware responses
   - Personalized cooking advice

### AI Prompt Examples
```
User: "Saya punya ayam, bawang, dan tomat. Bisa buatkan resep?"
AI: "Tentu! Dengan bahan tersebut, saya rekomendasikan Ayam Tumis Tomat yang lezat..."

User: "Bagaimana cara membuat nasi goreng yang enak?"
AI: "Berikut tips untuk nasi goreng yang sempurna: 1. Gunakan nasi yang sudah dingin..."
```

## 📱 Screenshots

### Home Screen
- Grid layout menampilkan resep populer
- Search bar untuk pencarian resep
- Carousel slider untuk highlight resep
- **Quick access ke Chef AI assistant**

### Chef AI Screen
- **Chat interface yang intuitif**
- **Typing indicators dan loading animations**
- **Quick action buttons untuk pertanyaan umum**
- **Recipe suggestions dengan preview images**

### Detail Screen
- Gambar resep berkualitas tinggi
- Informasi kategori dan area
- Daftar bahan-bahan dengan takaran
- Instruksi memasak step-by-step
- **"Ask AI" button untuk bantuan cooking**

### Search Feature
- Real-time search results
- Empty state handling
- Error state dengan retry option
- **AI-powered search suggestions**

## 🔧 Konfigurasi

### Environment Variables
```env
OPENAI_API_KEY=your_openai_api_key
OPENAI_MODEL=gpt-3.5-turbo
OPENAI_MAX_TOKENS=1000
AI_TEMPERATURE=0.7
```

### Firebase Configuration
1. Setup Firebase project
2. Enable Authentication
3. Configure Google Sign-In
4. Add platform-specific configuration files

### AI Configuration
1. Setup OpenAI account
2. Generate API key
3. Configure rate limits
4. Set up usage monitoring

## 🧪 Testing

```bash
# Run unit tests
flutter test

# Run integration tests
flutter test integration_test/

# Run AI service tests
flutter test test/services/ai_service_test.dart

# Generate test coverage
flutter test --coverage
```

## 📦 Build & Release

### Android
```bash
# Build APK
flutter build apk --release

# Build App Bundle
flutter build appbundle --release
```

### iOS
```bash
# Build iOS
flutter build ios --release
```

## 💰 Biaya & Limitasi

### OpenAI API Usage
- **GPT-3.5-turbo**: ~$0.002 per 1K tokens
- **Rate limits**: 3,500 requests per minute
- **Monitoring**: Dashboard untuk tracking usage

### Optimisasi Biaya
- Caching AI responses untuk pertanyaan umum
- Token limit management
- User session optimization

## 🔒 Keamanan & Privacy

### Data Protection
- Enkripsi chat history lokal
- No personal data sent ke OpenAI
- User consent untuk AI features
- Automatic data cleanup

### API Security
- Environment variables untuk API keys
- Request rate limiting
- Error handling yang aman

## 🤝 Contributing

1. Fork repository
2. Buat feature branch (`git checkout -b feature/chef-ai-improvement`)
3. Commit perubahan (`git commit -m 'Add chef AI feature'`)
4. Push ke branch (`git push origin feature/chef-ai-improvement`)
5. Buat Pull Request

## 📄 License

Distributed under the MIT License. See `LICENSE` for more information.

## 👥 Tim Developer

- **RebelZi** - Lead Developer & AI Integration Specialist
- **Frontend Developer** - Flutter UI/UX Implementation
- **Backend Integration** - API Integration & State Management
- **UI/UX Designer** - Design System & User Experience

## 📞 Support

Jika Anda mengalami masalah atau memiliki pertanyaan:

- Buat issue di GitHub repository
- Email: support@dishdiscovery.rebelzi.dev
- AI Support: ai-help@dishdiscovery.rebelzi.dev
- Developer: contact@rebelzi.dev
- Documentation: [Wiki Pages](https://github.com/rebelzi/dish_discover/wiki)

## 🔮 Roadmap

### Version 2.0
- [x] Chef AI assistant integration
- [x] Natural language recipe search
- [ ] Offline AI suggestions
- [ ] Voice interaction dengan AI
- [ ] AI-powered meal planning
- [ ] Personalized nutrition tracking

### Version 3.0
- [ ] Advanced AI features (image recognition)
- [ ] Smart grocery list generation
- [ ] AI cooking timer dan reminders
- [ ] Social features dengan AI moderation
- [ ] Multi-language AI support
- [ ] AR cooking assistance

### AI Enhancements
- [ ] Computer vision untuk ingredient recognition
- [ ] Voice-to-text recipe input
- [ ] AI-generated recipe variations
- [ ] Smart kitchen appliance integration
- [ ] Predictive cooking suggestions

---

<div align="center">

## 💖 Made with Love by RebelZi 2025

**🤖 Powered by AI - Making cooking smarter and more enjoyable!** 🍳

**⭐ Jangan lupa untuk memberikan star jika project ini membantu Anda!** ⭐

---

**© 2025 RebelZi. All rights reserved.**

*Dish Discovery - Your AI-Powered Cooking Companion*

</div>
