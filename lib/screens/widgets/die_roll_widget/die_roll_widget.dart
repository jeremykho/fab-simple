import 'package:fab_simple/features/dice_roll/die_roll.dart';
import 'package:flutter/material.dart';

class DieRollWidget extends StatefulWidget {
  const DieRollWidget({super.key});

  @override
  State<DieRollWidget> createState() => _DieRollWidgetState();
}

class _DieRollWidgetState extends State<DieRollWidget>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..forward();
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticOut,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animation,
      child: Icon(
        diceIcons[d6Roll()],
        size: 200,
      ),
    );
  }
}
