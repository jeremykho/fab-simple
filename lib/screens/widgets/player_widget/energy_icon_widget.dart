import 'package:fab_simple/constants/colors.dart';
import 'package:flutter/material.dart';

class EnergyIconWidget extends StatelessWidget {
  final bool isEmpty;
  const EnergyIconWidget({
    Key? key,
    required this.isEmpty,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: isEmpty
          ? BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: lightColor),
            )
          : const BoxDecoration(
              shape: BoxShape.circle,
              color: energyColor,
            ),
    );
  }
}
