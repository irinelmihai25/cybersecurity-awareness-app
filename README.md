# Cybersecurity Awareness Application

A mobile training application developed with **Flutter** and **Dart**, designed to improve cybersecurity awareness and threat recognition through interactive simulation and gamified learning mechanics.

---

## Overview

Social engineering vectors, particularly phishing attacks and credential harvesting, rely primarily on exploiting end-user habits rather than technical infrastructure vulnerabilities. This project provides an experiential training platform that simulates common threat vectors in a safe environment, offering immediate explanatory feedback and quantifiable skill progression.

---

## Modules and Key Capabilities

### Interactive Training Scenarios
* **Phishing Email Simulation (`scenariu_email.dart`):**
  * A dedicated email client interface rendering realistic sender metadata, urgency cues, and deceptive hyperlinks.
  * Users inspect messages and categorize them as legitimate or malicious, receiving contextual post-decision feedback detailing specific indicators of compromise.
* **Password Security and Entropy (`scenariu_parola.dart`):**
  * Practical exercises evaluating password complexity, length requirements, and resilience against standard dictionary and brute-force patterns.
* **Physical Device Security (`scenariu_joc.dart`):**
  * Interactive scenarios addressing unauthorized removable media (e.g., untrusted USB devices) and social engineering in physical workplace settings.

### Progression and Gamification Architecture
* **Adaptive Companion System:**
  * An embedded visual companion on the primary dashboard that transitions across three distinct mastery tiers (Novice, Intermediate, Cyber Expert) corresponding to accumulated experience points (XP).
* **Experience Points and Level Tracking:**
  * Visual progress indicators reflecting real-time training advancement and completion metrics.
* **Achievement and Badge Matrix (`badges.dart`):**
  * Grid-based milestone system unlocking recognition awards for completed training modules (e.g., Phishing Analysis, Credential Hygiene, Physical Security).
* **Leaderboard (`leaderboard.dart`):**
  * Performance ranking interface intended to support institutional or peer-group competitive engagement.

### User Interface Architecture
* **Design System (`theme.dart`):**
  * Cohesive Material 3 implementation based on structured UI specifications, utilizing distinct visual hierarchy and standardized typography.
* **Navigation Architecture (`navigation_wrapper.dart`):**
  * Persistent bottom navigation management enabling transitions between Dashboard, Badges, Leaderboard, and Settings views.

---

## Tech Stack

* **Framework:** [Flutter](https://flutter.dev/) (Cross-platform runtime targeting Android, iOS, Web, and Desktop)
* **Language:** [Dart](https://dart.dev/)
* **UI Framework:** Material Design 3, Custom Design Palette (`AppColors`)
* **State Management:** Flutter `StatefulWidget` reactive state handling

---

## Project Structure

```text
lib/
├── main.dart                      # Application bootstrap and theme initialization
├── theme.dart                     # Color specifications and UI tokens
├── models/
│   └── email_model.dart           # Phishing scenario data definitions and templates
├── screens/
│   ├── dashboard.dart             # Primary overview, active missions, progress tracking
│   ├── scenariu_email.dart        # Phishing identification simulation
│   ├── scenariu_parola.dart       # Password strength training interface
│   ├── scenariu_joc.dart          # General security scenario mini-game
│   ├── badges.dart                # Achievement and milestone gallery
│   ├── leaderboard.dart           # User rankings and score comparison
│   └── settings.dart              # User preferences
└── widgets/
    ├── navigation_wrapper.dart    # Root view switcher and bottom navigation bar
    └── mission_card.dart          # Reusable scenario launcher component
```

---

## Local Setup and Execution

### Prerequisites
* [Flutter SDK](https://docs.flutter.dev/get-started/install) (version 3.10 or higher)
* Android Studio / Android Emulator, physical mobile device, or Google Chrome

### Running the Application

1. **Clone the repository:**
   ```bash
   git clone https://github.com/irinelmihai25/cybersecurity-awareness-app.git
   cd cybersecurity-awareness-app
   ```

2. **Retrieve project dependencies:**
   ```bash
   flutter pub get
   ```

3. **Launch the application:**
   ```bash
   # Run on an active emulator or connected mobile device:
   flutter run

   # Or execute in a web browser:
   flutter run -d chrome
   ```
