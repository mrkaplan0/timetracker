import 'package:flutter/material.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';
import 'package:timetracker/utils/consts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.imagePath,
    required this.height,
    required this.label,
    required this.icon,
  });
  final VoidCallback onTap;
  final String imagePath;
  final double height;
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.white54,
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Center(child: Text(label, style: MyConsts.myLittleTitleTextStyle)),
        Positioned(
          bottom: 10,
          right: 10,
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(40),
            child: InkWell(
              borderRadius: BorderRadius.circular(40),
              onTap: onTap,
              splashColor: Colors.blueGrey.withAlpha(30),
              highlightColor: Colors.blueGrey.withAlpha(10),
              child: LiquidGlassLayer(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    LiquidGlass.inLayer(
                      shape: LiquidRoundedSuperellipse(
                        borderRadius: Radius.circular(40),
                      ),
                      child: SizedBox.square(
                        dimension: 100,
                        child: Icon(icon, size: 50, color: Colors.black54),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
