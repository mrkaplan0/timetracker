import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:timetracker/utils/consts.dart';

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
                    decoration: BoxDecoration(color: Colors.blueGrey.shade300),
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
                  duration: 3.seconds,
                  begin: 0,
                  end: height / 2,
                  builder: (_, value, __) => Container(
                    height: height / 2,
                    alignment: Alignment.center,
                    child: Text(
                      "Sportless GmbH",
                      style: MyConsts.myBigTitleTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
                .fadeIn()
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
                    decoration: BoxDecoration(color: Colors.blueGrey.shade300),
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
              .blurXY()
              .callback(
                callback: (value) {
                  Navigator.of(context).pushReplacementNamed('/landing');
                },
              ),
        ],
      ),
    );
  }
}
