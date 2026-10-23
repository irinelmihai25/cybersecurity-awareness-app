# Cybersecurity Awareness Game 🛡️🎮

A gamified mobile application built with **Flutter** and **Dart** designed to train and educate users on essential cybersecurity habits through interactive scenarios, real-time feedback, and engaging game mechanics.

---

## 🌟 Overview

Cyber threats such as phishing and credential theft disproportionately target end-user awareness. This application transforms cybersecurity education into an interactive learning experience, empowering users to recognize real-world threats (social engineering, deceptive email templates, insecure passwords, untrusted media) through practical simulation rather than passive reading.

---

## ✨ Key Features & Modules

### 🎯 Interactive Missions & Simulations
* **🎣 Phishing Email Detection (`scenariu_email.dart`):**
  * A full email client simulation displaying realistic sender addresses, urgency triggers, and suspicious hyperlinks.
  * Users evaluate incoming messages, mark them as safe or suspicious, and receive immediate educational explanations for their decisions.
* **🔑 Password Strength & Hygiene (`scenariu_parola.dart`):**
  * Interactive challenges testing password entropy, length, character variety, and resistance to common attack vectors.
* **💾 Physical Security / USB Devices (`scenariu_joc.dart`):**
  * Scenarios addressing the dangers of untrusted portable storage devices and social engineering tactics in physical spaces.

### 🏆 Gamification System
* **🐾 Evolving Cyber Mascot / Companion:**
  * A dynamic virtual companion embedded into the dashboard that evolves visually across 3 stages (`Novice`, `Intermediate`, `Cyber Expert`) as players earn XP.
* **📈 Real-Time XP & Level Progression:**
  * Animated XP progress bar and level indicators reflecting the user's current mastery.
* **🏅 Badges & Achievement Showcase (`badges.dart`):**
  * Milestone badges unlocked through gameplay achievements (e.g., *Welcome*, *Phishing Expert*, *Password Guardian*, *Physical Shield*, *Cyber Master*).
* **🥇 Leaderboard & Competition (`leaderboard.dart`):**
  * Competitive ranking table designed to motivate continuous training.

### 🎨 UI & Design Architecture
* **Figma-inspired Material 3 Design (`theme.dart`):**
  * Clean, cohesive visual palette featuring vibrant accent blues, distinct card elevations, and custom rounded surfaces.
* **Bottom Navigation Wrapper (`navigation_wrapper.dart`):**
  * Intuitive bottom tab navigation connecting Dashboard, Badges, Leaderboard, and Settings.

---

## 🛠️ Tech Stack

* **Framework:** [Flutter](https://flutter.dev/) (Multi-platform: Android, iOS, Web, Desktop)
* **Language:** [Dart](https://dart.dev/)
* **UI & Styling:** Material 3, Custom Design System (`AppColors`)
* **State Management:** Flutter `StatefulWidget` & reactive setState model

---

## 📂 Project Structure

```text
lib/
├── main.dart                      # Application entry point & theme setup
├── theme.dart                     # Custom color palette & design constants
├── models/
│   └── email_model.dart           # Phishing scenario data models & email templates
├── screens/
│   ├── dashboard.dart             # Main hub: missions, XP bar, evolving cyber pet
│   ├── scenariu_email.dart        # Interactive phishing simulation screen
│   ├── scenariu_parola.dart       # Password strength training screen
│   ├── scenariu_joc.dart          # General security mini-game screen
│   ├── badges.dart                # Achievement badge gallery
│   ├── leaderboard.dart           # User rankings and score table
│   └── settings.dart              # User preferences & configurations
└── widgets/
    ├── navigation_wrapper.dart    # Bottom navigation bar & persistent view switcher
    └── mission_card.dart          # Reusable mission launcher cards
```

---

## 🚀 Getting Started

### Prerequisites
* [Flutter SDK](https://docs.flutter.dev/get-started/install) (version 3.10+ recommended)
* An Android emulator, physical device, or Chrome browser

### Installation & Run

1. **Clone the repository:**
   ```bash
   git clone https://github.com/irinelmihai25/cybersecurity-awareness-app.git
   cd cybersecurity-awareness-app
   ```

2. **Install Flutter dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the application:**
   ```bash
   # Run on connected device or emulator:
   flutter run

   # Or run directly on Chrome:
   flutter run -d chrome
   ```
