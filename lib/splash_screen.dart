import 'package:flutter/material.dart';
import 'package:torch/torch_light.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    navigation(context);
    return Scaffold(
      backgroundColor: const Color(0xff050A2F),
      body: Center(
        child: Image.asset('assets/Group 73.png'),
      ),
    );
  }

  navigation(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const TorrchLight()));
  }
}
