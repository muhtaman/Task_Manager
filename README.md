# **Task Manager: Created by Muhtadi Munshi**
## A simple todo list app made with flutter and sqflite.

### Requirements:
- Flutter (Version 2.5.3)
- Git
- (For Android Apps) Android Studio
- (For iOS Apps) Xcode


_Make sure to run `flutter doctor` to check for issues_

### Intructions:
**Note**: These instructions are for Android Devices

0. Make sure that the PATH environment variable for flutter has been set.
   - In addition, your Android Studio must have the latest SDK installed (currently 30.0.2), as well as Android toolchain. 
   This can be done in Android Studio -> SDK Manager -> Android SDK -> SDK Tools
   Make sure that **Android SDK Build-Tools** and **Android SDK Command-line Tools** are installed and fully updated.
   Then run `flutter doctor` in command line to check if flutter can detect them. 
   If it asks to run an additional command to agree to license agreements, accept them.
1. Clone the repository:
  - `https://github.com/muhtaman/Task_Manager`
2. Go into directory: 
  - `cd Task_Manager`
3. Run the following flutter command to build apk: 
  - `flutter build apk --split-per-abi`
   The generated apks will be located within the following directory: `Task_Manager\build\app\outputs\flutter-apk` 
4. Transfer apk to your Android device and install. (There will be several different apks depending on your device hardware. In general, use app.apk)

**Note**: apk can also be tested using Android Studio. For more information, please look at: https://developer.android.com/studio/run/emulator
