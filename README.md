# E-Commerce Flutter Application

A feature-rich e-commerce application built with Flutter. This project serves as a comprehensive example of a production-ready mobile app, showcasing a clean architecture, modern UI, and robust state management.

## 📸 Screenshots

| Onboarding | Home | Product Details |
| :---: | :---: | :---: |
| <img src="docs/images/image (3).png" width="200"/> | <img src="docs/images/image (5).png" width="200"/> | <img src="docs/images/image (6).png" width="200"/> |
| **Cart** | **Checkout** | **User Profile** |
| <img src="docs/images/image (7).png" width="200"/> | <img src="docs/images/image (12).png" width="200"/> | <img src="docs/images/image (9).png" width="200"/> |

### More Screenshots

| | | |
| :---: | :---: | :---: |
| <img src="docs/images/image (1).png" width="200"/> | <img src="docs/images/image (2).png" width="200"/> | <img src="docs/images/image (4).png" width="200"/> |
| <img src="docs/images/image (8).png" width="200"/> | <img src="docs/images/image (10).png" width="200"/> | <img src="docs/images/image (11).png" width="200"/> |
| <img src="docs/images/image (13).png" width="200"/> | <img src="docs/images/image (14).png" width="200"/> | |

## ✨ Features

- **User Authentication**: Secure login and registration functionality.
- **Onboarding**: Smooth introduction for new users.
- **Dynamic Home Page**: Featuring promotional banners and product categories.
- **Product Listings**: Browse products with sorting and filtering capabilities.
- **Product Details**: Comprehensive view of product information.
- **Shopping Cart**: Add, remove, and manage items in the cart.
- **Checkout Flow**: Seamless process for placing orders.
- **User Account**: Manage personal information and view order history.
- **State Management**: Predictable state management using BLoC (Cubit).
- **Local Database**: Efficient local data caching with ObjectBox.
- **Theming**: Support for both Light and Dark modes.
- **Localization**: Internationalization support for English and Arabic.

## 🛠️ Tech Stack & Dependencies

- **Framework**: [Flutter](https://flutter.dev/)
- **State Management**: [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- **Local Database**: [ObjectBox](https://pub.dev/packages/objectbox)
- **Networking**: [Dio](https://pub.dev/packages/dio)
- **Routing**: [persistent_bottom_nav_bar](https://pub.dev/packages/persistent_bottom_nav_bar)
- **Localization**: [intl](https://pub.dev/packages/intl)
- **UI Components**:
  - [google_fonts](https://pub.dev/packages/google_fonts)
  - [smooth_page_indicator](https://pub.dev/packages/smooth_page_indicator)
  - [icons_plus](https://pub.dev/packages/icons_plus)
  - [flutter_svg](https://pub.dev/packages/flutter_svg)

## 📂 Project Structure

The project follows a feature-driven architecture to maintain a clean and scalable codebase.

```
lib/
├── core/           # Core utilities, services, models, and widgets shared across features
│   ├── constants/
│   ├── cubits/
│   ├── helpers/
│   ├── models/
│   ├── themes/
│   └── widgets/
├── features/       # Individual features of the app
│   ├── authentication/
│   ├── cart/
│   ├── checkout/
│   ├── home/
│   └── ...
├── generated/      # Auto-generated files (localization)
├── l10n/           # Localization files
└── main.dart       # App entry point
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (stable channel)
- An IDE like VS Code or Android Studio

### Installation & Setup

1.  **Clone the repository:**
    ```sh
    git clone <repository-url>
    cd e-commerce-app
    ```

2.  **Install dependencies:**
    ```sh
    flutter pub get
    ```

3.  **Run the build runner:**
    This command generates the necessary files for ObjectBox.
    ```sh
    flutter pub run build_runner build --delete-conflicting-outputs
    ```

4.  **Run the app:**
    ```sh
    flutter run
    ```

## ⚙️ Build & Code Generation

- **Localization**: The `flutter_intl` package is used. Files are generated automatically on save or by running `flutter pub get`.
- **Assets**: Asset paths are generated using `flutter_assets`.
- **Launcher Icons**: Icons are generated via `flutter_launcher_icons`. To regenerate, run:
  ```sh
  flutter pub run flutter_launcher_icons
  ```

## 🤖 Continuous Integration

This project uses GitHub Actions for Continuous Integration. The workflow is defined in `.github/workflows/flutter_ci.yml`. It automatically runs the following checks on every push and pull request to the `main` branch:
- Installs dependencies (`flutter pub get`)
- Runs static analysis (`flutter analyze`)
- Builds the Android APK (`flutter build apk`)