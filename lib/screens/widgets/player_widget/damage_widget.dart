import 'package:fab_simple/constants/colors.dart';
import 'package:fab_simple/constants/values.dart';
import 'package:fab_simple/features/counter/bloc/counter_state.dart';
import 'package:flutter/material.dart';

class DamageWidget extends StatefulWidget {
  const DamageWidget({
    Key? key,
    required this.state,
  }) : super(key: key);

  final CounterState state;

  @override
  State<DamageWidget> createState() => _DamageWidgetState();
}

class _DamageWidgetState extends State<DamageWidget>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: damageTimerSeconds),
      vsync: this,
    );
    _animation = Tween<double>(begin: 1.0, end: 0.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ));
    _controller.forward();
  }

  @override
  void didUpdateWidget(DamageWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final int value = widget.state.value;
    final textTheme = Theme.of(context).textTheme;
    return FadeTransition(
        opacity: _animation,
        child: value > 0
            ? Text(
                '(+$value)',
                style: textTheme.displayMedium?.apply(color: greenColor),
              )
            : Text(
                '($value)',
                style: textTheme.displayMedium?.apply(color: redColor),
              ));
  }
}
