# Jeemo IO Mobile App

Welcome to the Jeemo IO Mobile App! 

Name: Jeemo.io
Dscription: Real-life implementation of a digital bank.

## Features

- **User-Friendly Interface**: Designed for ease of use.
- **Secure Transactions**: Implementing the latest security measures to protect user data.
- **Real-Time Notifications**: Stay updated with instant alerts and notifications.

## Requirements

- Flutter SDK
- Dart

## Getting Started

To get started with the Jeemo IO Mobile App, follow these steps:

### Clone the repository

git clone https://github.com/yourusername/jeemo-io-mobile-app.git

cd jeemo-io-mobile-app

Install Dependencies
Make sure you have Flutter installed on your machine. Run the following command to install the necessary packages:

flutter pub get

Run the App
To run the app on your emulator or device, use:

flutter run

Contribution
Contributions are welcome! If you have suggestions for improvements or features, please create a pull request or open an issue.


# The following line prevents the package from being accidentally published to
# pub.dev using `flutter pub publish`. This is preferred for private packages.
publish_to: 'none' # Remove this line if you wish to publish to pub.dev

# The following defines the version and build number for your application.
# A version number is three numbers separated by dots, like 1.2.43
# followed by an optional build number separated by a +.
# Both the version and the builder number may be overridden in flutter
# build by specifying --build-name and --build-number, respectively.
# In Android, build-name is used as versionName while build-number used as versionCode.
# Read more about Android versioning at https://developer.android.com/studio/publish/versioning
# In iOS, build-name is used as CFBundleShortVersionString while build-number is used as CFBundleVersion.
# Read more about iOS versioning at
# https://developer.apple.com/library/archive/documentation/General/Reference/InfoPlistKeyReference/Articles/CoreFoundationKeys.html
# In Windows, build-name is used as the major, minor, and patch parts
# of the product and file versions while build-number is used as the build suffix.
version: 1.0.0+1

environment:
  sdk: '>=3.0.6 <4.0.0'

# Dependencies specify other packages that your package needs in order to work.
# To automatically upgrade your package dependencies to the latest versions
# consider running `flutter pub upgrade --major-versions`. Alternatively,
# dependencies can be manually updated by changing the version numbers below to
# the latest version available on pub.dev. To see which dependencies have newer
# versions available, run `flutter pub outdated`.
dependencies:
  flutter:
    sdk: flutter


  # The following adds the Cupertino Icons font to your application.
  # Use with the CupertinoIcons class for iOS style icons.
  cached_network_image: ^3.4.1 
  cupertino_icons: ^1.0.8
  dio: ^5.6.0
  dotted_border: ^2.1.0
  flutter_svg: ^2.0.10+1
  flutter_switch: ^0.3.2
  get: ^4.6.6
  get_it: ^7.7.0
  intl: ^0.19.0
  lottie: ^3.1.2
  pin_code_text_field: ^1.8.0
  provider: ^6.1.2
  qr_flutter: ^4.1.0
  share_plus: ^7.1.0
  shared_preferences: ^2.3.2
  smartlogger: ^1.1.4+1
  font_awesome_flutter: ^10.7.0
  material_design_icons_flutter: ^7.0.7296
  google_fonts: ^6.2.1
  fl_chart: ^0.69.0 # Check for the latest version
  http: ^1.2.2

dev_dependencies:
  flutter_test:
    sdk: flutter

  # The "flutter_lints" package below contains a set of recommended lints to
  # encourage good coding practices. The lint set provided by the package is
  # activated in the `analysis_options.yaml` file located at the root of your
  # package. See that file for information about deactivating specific lint
  # rules and activating additional ones.
  flutter_lints: ^2.0.0

  #for app icon
  flutter_launcher_icons: ^0.13.1

#flutter icon configuration
flutter_icons:
  android: true
  ios: true
  image_path: "assets/images/jeemo_pay_icon.png"
# For information on the generic Dart part of this file, see the
# following page: https://dart.dev/tools/pub/pubspec

# The following section is specific to Flutter packages.
flutter:

  # The following line ensures that the Material Icons font is
  # included with your application, so that you can use the icons in
  # the material Icons class.
  uses-material-design: true

  assets:
    - assets/images/
    - assets/lottie/
    - assets/svgs/
    - assets/images/external/cbn_logo.png
    - assets/images/external/cbn_text.png
    - assets/images/external/ndic_logo.png
    - assets/images/currencies/default_flag.png
    - assets/images/currencies/ghs_flag.png
    - assets/images/currencies/ngn_flag.png
    - assets/images/currencies/gbp_flag.png

  # An image asset can refer to one or more resolution-specific "variants", see
  # https://flutter.dev/assets-and-images/#resolution-aware
  # For details regarding adding assets from package dependencies, see
  # https://flutter.dev/assets-and-images/#from-packages
  # To add custom fonts to your application, add a fonts section here,
  # in this "flutter" section. Each entry in this list should have a
  # "family" key with the font family name, and a "fonts" key with a
  # list giving the asset and other descriptors for the font. For
  # example:
  fonts:
    - family: Plus_Jakarta_Sans
    - family: BrickSans
      fonts:
        - asset: assets/fonts/PlusJakartaSans-VariableFont_wght.ttf
        - asset: assets/fonts/brick-sans/BrickSans-Bold.otf
  #
  # For details regarding fonts from package dependencies,
  # see https://flutter.dev/custom-fonts/#from-packages
