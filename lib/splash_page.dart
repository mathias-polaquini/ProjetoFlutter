import 'dart:async';
import 'package:flutter/material.dart';
import 'login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
            "Uma Breve Homenagem",
              style: TextStyle(
                fontSize: 28,//deixa o texto grande
                fontWeight: FontWeight.bold,//deixa o texto em negrito
              ),
            ),
            SizedBox(height: 25),
            Image(
              image: AssetImage("assets/TelaDeSplash.png"),//imagem
              width: 600,//tamanho da imagem
            ),
          ],
        ),
      ),
    );
  }
}