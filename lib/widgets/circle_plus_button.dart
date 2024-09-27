import 'package:flutter/material.dart';
import 'package:workout/utils/themes.dart';

class CirclePlusButton extends StatelessWidget {
  const CirclePlusButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      customBorder: CircleBorder(),
      child: Container(
        height: 50,
        width: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: appTheme.cardColor)),
        child: const Icon(Icons.add),
      ),
    );
  }
}
