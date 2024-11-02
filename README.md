# jeemo_pay

A new Flutter project.

## Getting Started

Welcome to the Flutter project. This guide will help you set up your development environment on a Windows system, download the necessary SDKs, and open the project in Visual Studio Code. Please follow each step carefully.

### Step 1: Installing Visual Studio Code
1. Go to the Visual Studio Code download page: [https://code.visualstudio.com/download](https://code.visualstudio.com/download)
2. Select the Windows version and download the installer.
3. Once downloaded, open the installer and follow the setup instructions.
4. Open Visual Studio Code to verify the installation.

### Step 2: Downloading and Setting Up Flutter SDK
1. Go to the Flutter SDK download page: [https://flutter.dev/docs/get-started/install](https://flutter.dev/docs/get-started/install)
2. Download the Windows Flutter SDK (make sure to download the latest stable release).
3. Extract the zip file to a location on your system (e.g., C:\src\flutter).
4. Open a command prompt and navigate to the Flutter directory.
5. Run `flutter doctor` to verify the installation and see if any additional setup steps are required.

### Step 3: Downloading and Setting Up Android SDK
1. Download the Android Studio installer from [https://developer.android.com/studio](https://developer.android.com/studio).
2. Run the installer and follow the steps, making sure to select the option to install the Android SDK.
3. Once installed, open Android Studio and configure the SDK settings if prompted.
4. Note the path to the Android SDK (e.g., C:\Users\YourName\AppData\Local\Android\sdk).

### Step 4: Setting Up Environment Variables
1. Open 'Environment Variables' on your system (Search in Windows for 'Environment Variables').
2. Add a new variable 'FLUTTER_HOME' pointing to your Flutter SDK path.
3. Add the 'bin' folder inside your Flutter SDK to the system PATH (e.g., C:\src\flutter\bin).
4. Add the path to the Android SDK to the PATH as well.

### Step 5: Cloning the Project from GitHub
1. Open a command prompt.
2. Navigate to the directory where you want to clone the project.
3. Run the following command to clone the repository:
   ```bash
   git clone https://github.com/idris-j/jeemo-io-mobile-app.git
