import 'package:flutter/material.dart';
import 'onboarding.dart';

class Littlecrochet extends StatefulWidget {
  const Littlecrochet({super.key});

  @override
  State<Littlecrochet> createState() => _LittlecrochetState();
}

class _LittlecrochetState extends State<Littlecrochet> {
  double _opacity = 0.0;
  double _scale = 0.8;

  @override
  void initState() {
    super.initState();

    // Start animation
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _opacity = 1.0;
        _scale = 1.0;
      });
    });

    // Navigate with smooth transition
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 800),
          pageBuilder: (_, animation, secondaryAnimation) => const Onboarding(),
          transitionsBuilder: (_, animation, __, child) {
            // Fade + Slide
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.0, 0.2),
                  end: Offset.zero,
                ).animate(CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeInOut,
                )),
                child: child,
              ),
            );
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 2000),
          curve: Curves.easeInOut,
          opacity: _opacity,
          child: AnimatedScale(
            scale: _scale,
            duration: const Duration(milliseconds: 2000),
            curve: Curves.easeInOut,
            child: Image.asset(
              "assets/images/littlecrochet.jpg",
              height: 250,
            ),
          ),
        ),
      ),
    );
  }
}
