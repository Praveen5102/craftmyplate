# CraftMyPlate

CraftMyPlate is a mobile app that provides a delightful user experience, from authentication to personalized content. The app guides users through a smooth flow from a splash screen to authentication, OTP verification, and the home page.

## Features

- **Splash Screen:** An introductory screen with the app logo, setting the stage for user interaction.
  
- **Phone Aunthentication:** Users can log in using their phone number for secure and quick access.
  
- **OTP Verification:** A verification process using OTP (One-Time Password) for enhanced security.
  
- **Home Screen:** The main interface where users can access content, personalized features, and various options.

## Screenshots

1. Splash Screen
   
  The entry point to the app, showcasing the logo and a loading animation.
  
2. Phone Authentication

  Screen for users to enter their phone numbers for verification.

3. OTP Verification

  Input field for users to enter the OTP sent to their phone, completing the authentication process.
  
4. Home Screen

  Personalized content and user options. Displays location-based information and enables easy navigation to rewards and       content options.
  
## Installation

###  Prerequisites

- **Flutter SDK:** Make sure you have Flutter installed. Check the installation here.

- **Firebase:** This app uses Firebase Authentication. Set up a Firebase project and integrate it with your app.

## Setup

1. **Clone the Repository:**
 ```bash
     git clone https://github.com/praveen5102/CraftMyPlate.git
     cd CraftMyPlate
   ```
2. **Install Dependencies:**
```bash
     flutter pub get
   ```
3. **Firebase Configuration:**

- Set up Firebase Authentication in the Firebase Console.
  
- Download the [google-services.json] file and place it in the [android/app] directory.
  
- Enable Phone Authentication in the Firebase Console.
  
4. **Run the App:**
```bash
  flutter run
```
  
## Code Structure

### Main Files

- [lib/main.dart] Entry point of the application.

- [lib/screens/SplashScreen.dart] Splash screen UI and logic.
  
- [lib/screens/login1.dart] Phone authentication screen.
  
- [lib/screens/login2.dart] OTP input and verification logic.
  
- [lib/screens/HomeScreen.dart] Main screen after authentication, with personalized options.

### Widget Overview

- **OTP Input Boxes:** User-friendly OTP input fields with custom styling.

- **Location Display and Dropdown:** Displays the user’s location with a customizable dropdown for location selection.

- ** Rewards Button:** Button to access rewards, with an icon for enhanced UX.

## Customization

### UI Colors

Primary colors used in the app:

- **Primary Background:** [#E^D09F]-Light yellow

- **Button Color:** [#503829]-Dark brown for primary buttons
 
- **Text and Icons:** Various shades used for a warm, friendly look.

### Text and Icons

The app uses a combination of Flutter's default icons and the FontAwesome package for added styling. Customize icon sizes, text styles, and alignment in [HomeScreen.dart] for a more personalized look.

### Usage

1. Launch the app to see the splash screen.

2. Enter a phone numbers to receive an OTP for verification.

3. Verify the OTP and access the home screen, where location-based information and user options are displayed

### Dependenices

- [firebase_auth:]Firebase authentication for phone login.

- [fluttertoast:]For toast messages upon successful or failed

- [font_awsome_flutter:]For icon enhancements.


### Future Improvements

- **Profile Management:**Add profile creation and management features.

- **Content Customization:**Personalized content based on user preferences.

- **Reward System Expansion:**Add more features and functionality to the rewards section.

### License

This project is licensed under the MIT License.

## 

This README gives an overview of CraftMyPlate's features, installation steps, and structure, making it easy for users or developers to understand and run the app. Let me know if you'd like any further details added!


