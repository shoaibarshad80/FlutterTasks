
import 'package:flutter/material.dart';
import 'HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  double size = 60;
  bool showBigIcon = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        size = 110;
        showBigIcon = true;
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

              child: AnimatedCrossFade(
                duration: const Duration(seconds: 2),

                firstChild: const Icon(
                  Icons.school,
                  size: 50,
                  color: Colors.white,
                ),

                secondChild: const Icon(
                  Icons.school,
                  size: 90,
                  color: Colors.white,
                ),

                crossFadeState: showBigIcon
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
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
