
import 'package:flutter/material.dart';
import 'HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  double size = 60;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        size = 110;
      });
    });

    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            AnimatedContainer(
              duration: const Duration(seconds: 2),
              width: size,
              height: size,
              child: const Icon(
                Icons.school,
                size: 70,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Riphah University',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),

            const Text(
              'Flutter Assignment 2',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
