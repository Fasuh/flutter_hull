import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_null_safety/flutter_neumorphic.dart';
import 'package:flutter_otoczka/core/style/colors.dart';
import 'package:flutter_otoczka/features/calculate/presentation/screens/calculator.dart';
import 'package:flutter_otoczka/injection_container.dart';
import 'package:flutter_otoczka/app_config.dart';
import 'package:flutter_otoczka/core/app/navigator.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InjectionContainer().init();
  AppConfig.init;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      onGenerateRoute: CustomNavigator.router.generator,
      navigatorKey: CustomNavigator.navigatorKey,
      localizationsDelegates: [S.delegate],
      supportedLocales: S.delegate.supportedLocales,
      title: 'Otoczka wypukła kalkulator',
      theme: neumorphicDefaultTheme.copyWith(
        baseColor: defaultBackgroundColor,
      ),
      home: Scaffold(
        body: CalculatorScreen(),
      ),
    );
  }
}
