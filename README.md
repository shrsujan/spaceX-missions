# spaceX

[![codecov](https://codecov.io/gh/shrsujan/spaceX-missions/branch/master/graph/badge.svg?token=TEYLMPG3XF)](https://codecov.io/gh/shrsujan/spaceX-missions)

This is a small flutter application which lists all the spaceX mission launches and shows some more detail in a separate screen when a card is tapped.

### To run this application in your local device, follow theses steps.

- **Install Flutter**  
   These steps are for a linux based system. For other systems, please visit the link below.

  > _# install flutter_  
  > \$ `sudo snap install flutter --classic`
  >
  > _# export flutter executatable path into \$PATH_  
  > \$ `export PATH="$PATH:`pwd`/flutter/bin"`
  >
  > _# check using this command (ignore other errors for now)_  
  > \$ `flutter doctor`
  >
  > _# if you see error while detecting flutter, check your executable path and try again_  
  > _# check by this command_  
  > \$ `which flutter dart`

  The detailed steps can be viewed in [this link](https://flutter.dev/docs/get-started/install).

- **Install and Setup Android Studio**

  - Download and install Android Studio from [here](https://developer.android.com/studio).
  - Start Android Studio, and go through the `Android Studio Setup Wizard`. This installs the latest Android SDK, Android SDK Command-line Tools, and Android SDK Build-Tools, which are required by Flutter when developing for Android.
  - Setup you android device by enabling `Developer options` and `USB debugging` on your device. Detailed instructions are available [here](https://developer.android.com/studio/debug/dev-options)
    > _# use this command to check connected devices_  
    > \$ `flutter device`
  - or Setup android emulator
    - Enable `VM acceleration` on your machine. Details in [this link](https://developer.android.com/studio/run/emulator-acceleration).
    - Launch `Android Studio`. Click `AVD Manager` and `Create Virtual Device`.
    - Run your virtual device
      > _# use this command to check connected devices_  
      > \$ `flutter device`

  The detailed steps can be viewed in [this link](https://flutter.dev/docs/get-started/install).

- **Clone repository**

  > \$ `git clone https://github.com/shrsujan/spaceX-missions.git`

- **Navigate to the project folder and install dependencies**

  > \$ `flutter pub get`

- **Check everything once again**

  > \$ `flutter doctor`

### Run app

> \$ `flutter run`

### Test app

> \$ `flutter test`

### Generate test coverage

> \$ `flutter test --coverage`
