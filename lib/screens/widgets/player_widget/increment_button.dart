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
  final double buttonHeight;
  final IconData icon;

  const IncrementButton({
    Key? key,
    required this.counterBloc,
    required this.isDecrement,
    required this.longPressValue,
    required this.icon,
    required this.buttonHeight,
    this.damageBloc,
    this.damageTimer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sign = isDecrement ? -1 : 1;

    return InkResponse(
      child: SizedBox(
        height: buttonHeight,
        child: Icon(
          icon,
          color: lightColor,
          size: incrementIconSize,
        ),
      ),
      onTap: () {
        damageTimer?.reset();
        HapticFeedback.vibrate();
        counterBloc.add(IncrementEvent(sign * incrementOnTap, false));
        damageBloc?.add(IncrementEvent(sign * incrementOnTap, true));
      },
      onLongPress: () {
        damageTimer?.reset();
        HapticFeedback.lightImpact();
        counterBloc.add(IncrementEvent(sign * longPressValue, false));
        damageBloc?.add(IncrementEvent(sign * longPressValue, true));
      },
    );
  }
}
