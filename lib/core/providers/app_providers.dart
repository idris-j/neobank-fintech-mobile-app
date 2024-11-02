import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:jeemo_pay/core/providers/user_provider.dart';
import 'package:jeemo_pay/services/theme_provider.dart';
import 'package:jeemo_pay/ui/features/signup/signup_provider.dart';
import 'package:jeemo_pay/ui/features/login/login_provider.dart';
import 'package:jeemo_pay/ui/features/collect_payment/payment_provider.dart';

class AppProviders {
  static final providers = <SingleChildWidget>[
    ListenableProvider(create: (_) => UserProvider()),
    ListenableProvider(create: (_) => ThemeProvider(true)),
    ListenableProvider(create: (_) => LoginProvider()),
    ListenableProvider(create: (_) => SignUpProvider()),
    ListenableProvider(create: (_) => PaymentProvider()),
  ];
}
