import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Animate()
                .custom(
                  duration: 2.seconds,
                  begin: height / 2,
                  end: 0,
                  builder: (_, value, __) => Container(
                    height: value,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.shade300,
                    ),
                  ),
                )
                .fadeOut(),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Animate()
                .custom(
                  duration: 2.seconds,
                  begin: height / 2,
                  end: 0,
                  builder: (_, value, __) => Container(
                    height: value,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.shade300,
                    ),
                  ),
                )
                .fadeOut(),
          ),
          Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.cover,
                  width: 200,
                  height: 200,
                ),
              )
              .animate(delay: const Duration(milliseconds: 2500))
              .fadeOut(duration: const Duration(seconds: 1), begin: 1.0)
              .blurXY(),
        ],
      ),
    );
  }
}
