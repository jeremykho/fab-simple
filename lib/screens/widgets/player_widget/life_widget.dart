import 'package:fab_simple/constants/values.dart';
import 'package:fab_simple/features/counter/bloc/counter_bloc.dart';
import 'package:fab_simple/features/counter/bloc/counter_event.dart';
import 'package:fab_simple/features/counter/bloc/counter_state.dart';
import 'package:fab_simple/screens/widgets/player_widget/damage_widget.dart';
import 'package:fab_simple/screens/widgets/player_widget/increment_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:async/async.dart';

class LifeWidget extends StatelessWidget {
  final CounterBloc counterBloc;
  final CounterBloc damageBloc;

  LifeWidget({
    super.key,
    required this.counterBloc,
    required this.damageBloc,
  });

  @override
  Widget build(BuildContext context) {
    void resetDamage() {
      damageBloc.add(const ResetEvent(0));
    }

    const Duration timerDuration = Duration(seconds: 5);
    final RestartableTimer timer = RestartableTimer(timerDuration, resetDamage);

    return Column(
      children: [
        MultiBlocProvider(
          providers: [
            BlocProvider<CounterBloc>(
              create: (BuildContext context) => counterBloc,
            ),
            BlocProvider<CounterBloc>(
              create: (BuildContext context) => damageBloc,
            ),
          ],
          child: Center(
            child: Column(
              children: [
                Row(
                  children: <Widget>[
                    Expanded(
                      child: IncrementButton(
                        icon: const Icon(Icons.remove),
                        isDecrement: true,
                        longPressValue: incrementLifeOnPress,
                        counterBloc: counterBloc,
                        damageBloc: damageBloc,
                        damageTimer: timer,
                      ),
                    ),
                    BlocBuilder<CounterBloc, CounterState>(
                      bloc: counterBloc,
                      builder: (context, state) {
                        return SizedBox(
                          width: 180,
                          child: Center(
                            child: Text(
                              state.value.toString(),
                              style: Theme.of(context).textTheme.headline1,
                            ),
                          ),
                        );
                      },
                    ),
                    Expanded(
                      child: IncrementButton(
                        icon: const Icon(Icons.add),
                        isDecrement: false,
                        longPressValue: incrementLifeOnPress,
                        counterBloc: counterBloc,
                        damageBloc: damageBloc,
                        damageTimer: timer,
                      ),
                    ),
                  ],
                ),
                BlocBuilder<CounterBloc, CounterState>(
                  bloc: damageBloc,
                  builder: (context, state) {
                    return DamageWidget(state: state);
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
