import 'package:jeemo_pay/core/providers/app_providers.dart';
import 'package:jeemo_pay/services/theme_provider.dart';
import 'package:jeemo_pay/shared/cache.dart';
import 'package:jeemo_pay/shared/locator.dart';
import 'package:jeemo_pay/ui/features/onboarding/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';

import 'package:provider/provider.dart';
import 'package:smartlogger/smartlogger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  bool isDark = await checkTheme();

  runApp(MultiProvider(
      providers: AppProviders.providers,
      child: MyApp(
        isDark: isDark,
      )));

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

Future<bool> checkTheme() async {
  bool isDark = await localStorage().getBool("is_dark") ?? false;
  bool isSystem = await localStorage().getBool("is_system") ?? true;
  final brightness = WidgetsBinding.instance.window.platformBrightness;
  if (isSystem) {
    if (brightness == Brightness.light) {
      isDark = false;
    }
    if (brightness == Brightness.dark) {
      isDark = true;
    }
  }

  Log.i(
      "current system theme || $brightness || is system $isSystem is dark $isDark ");
  return isDark;
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  const MyApp({super.key, this.isDark});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness:
            isDark ?? false ? Brightness.light : Brightness.dark,
        statusBarBrightness:
            isDark ?? false ? Brightness.dark : Brightness.light,
      ),
    );
    return ChangeNotifierProvider(
        create: (context) => ThemeProvider(isDark!),
        builder: (context, snapshot) {
          final theme = Provider.of<ThemeProvider>(context);

          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: theme.currentTheme,
            home: SplashScreen(),
          );
        });
  }
}
