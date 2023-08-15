import 'package:fab_simple/constants/colors.dart';
import 'package:fab_simple/constants/values.dart';
import 'package:fab_simple/features/counter/bloc/counter_bloc.dart';
import 'package:fab_simple/features/counter/bloc/counter_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:async/async.dart';

class IncrementButton extends StatelessWidget {
  final CounterBloc counterBloc;
  final CounterBloc? damageBloc;
  final RestartableTimer? damageTimer;
  final bool isDecrement;
  final int longPressValue;
  final Icon icon;

  const IncrementButton({
    Key? key,
    required this.counterBloc,
    required this.isDecrement,
    required this.longPressValue,
    required this.icon,
    this.damageBloc,
    this.damageTimer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sign = isDecrement ? -1 : 1;

    return GestureDetector(
      child: IconButton(
        iconSize: centerIconSize,
        color: lightColor,
        icon: icon,
        onPressed: () {
          damageTimer?.reset();
          counterBloc.add(IncrementEvent(sign * incrementOnTap, false));
          damageBloc?.add(IncrementEvent(sign * incrementOnTap, true));
        },
      ),
      onLongPress: () {
        damageTimer?.reset();
        HapticFeedback.vibrate();
        counterBloc.add(IncrementEvent(sign * longPressValue, false));
        damageBloc?.add(IncrementEvent(sign * longPressValue, true));
      },
    );
  }
}
