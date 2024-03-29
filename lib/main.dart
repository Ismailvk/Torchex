import 'package:flutter/material.dart';
import 'package:torch/splash_screen.dart';
import 'package:torch_controller/torch_controller.dart';

void main() {
  TorchController().initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Torch Light',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
          appBarTheme: AppBarTheme.of(context).copyWith(color: Colors.black)),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
