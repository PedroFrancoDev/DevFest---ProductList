import 'package:dev_fest_product_list/config/di/injector.dart';
import 'package:dev_fest_product_list/ui/splash/splash.dart';
import 'package:flutter/material.dart';

void main() {
  setupInjector();
  
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}