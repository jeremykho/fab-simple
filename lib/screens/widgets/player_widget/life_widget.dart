import 'package:async/async.dart';
import 'package:fab_simple/constants/values.dart';
import 'package:fab_simple/features/counter/bloc/counter_bloc.dart';
import 'package:fab_simple/features/counter/bloc/counter_state.dart';
import 'package:fab_simple/screens/widgets/player_widget/increment_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LifeWidget extends StatelessWidget {
  const LifeWidget({
    super.key,
    required this.lifeBloc,
    required this.damageBloc,
    required this.timer,
  });

  final CounterBloc lifeBloc;
  final CounterBloc damageBloc;
  final RestartableTimer timer;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: IncrementButton(
            icon: Icons.remove,
            isDecrement: true,
            longPressValue: incrementLifeOnPress,
            counterBloc: lifeBloc,
            damageBloc: damageBloc,
            damageTimer: timer,
            buttonHeight: lifeWidgetHeight,
          ),
        ),
        BlocBuilder<CounterBloc, CounterState>(
            bloc: lifeBloc,
            builder: (context, state) {
              return Container(
                height: lifeWidgetHeight,
                width: counterWidgetWidth,
                alignment: Alignment.center,
                child: Text(
                  state.value.toString(),
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              );
            }),
        Expanded(
          child: IncrementButton(
            icon: Icons.add,
            isDecrement: false,
            longPressValue: incrementLifeOnPress,
            counterBloc: lifeBloc,
            damageBloc: damageBloc,
            damageTimer: timer,
            buttonHeight: lifeWidgetHeight,
          ),
        ),
      ],
    );
  }
}
