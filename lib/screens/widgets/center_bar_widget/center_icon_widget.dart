import 'package:fab_simple/constants/colors.dart';
import 'package:fab_simple/constants/values.dart';
import 'package:flutter/material.dart';

class CenterIconWidget extends StatelessWidget {
  final IconData? iconData;
  final Widget? overlay;
  final VoidCallback? onPressed;
  const CenterIconWidget({
    Key? key,
    this.iconData,
    this.overlay,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: lightColor,
      ),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          overlay ?? Container(),
          IconButton(
            padding: const EdgeInsets.all(0),
            onPressed: onPressed,
            iconSize: centerIconSize,
            icon: Icon(
              iconData,
              color: darkColor,
            ),
          ),
        ],
      ),
    );
  }
}
