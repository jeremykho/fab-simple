import 'package:fab_simple/constants/values.dart';
import 'package:fab_simple/features/counter/bloc/counter_bloc.dart';
import 'package:fab_simple/features/counter/bloc/counter_event.dart';
import 'package:fab_simple/features/counter/bloc/counter_state.dart';
import 'package:fab_simple/features/history/history_bloc.dart';
import 'package:fab_simple/features/history/history_event.dart';
import 'package:fab_simple/screens/widgets/player_widget/history_widget.dart';
import 'package:fab_simple/screens/widgets/player_widget/increment_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:async/async.dart';

class LifeWidget extends StatefulWidget {
  final CounterBloc counterBloc;
  final CounterBloc damageBloc;
  final HistoryBloc historyBloc;

  const LifeWidget({
    super.key,
    required this.counterBloc,
    required this.damageBloc,
    required this.historyBloc,
  });

  @override
  State<LifeWidget> createState() => _LifeWidgetState();
}

class _LifeWidgetState extends State<LifeWidget> {
  final timerDuration = const Duration(seconds: timerDurationSeconds);
  late final RestartableTimer timer =
      RestartableTimer(timerDuration, resetDamage);

  @override
  void initState() {
    widget.historyBloc.add(RecordEvent(widget.counterBloc.state.value));
    timer.cancel();
    super.initState();
  }

  void resetDamage() {
    int historyLength = widget.historyBloc.state.history.length;
    int lastValue = widget.historyBloc.state.history[historyLength - 1];
    int currentValue = widget.counterBloc.state.value;

    widget.damageBloc.add(const ResetEvent(0));
    timer.cancel();
    if (widget.damageBloc.state.value != 0 && currentValue != lastValue) {
      widget.historyBloc.add(RecordEvent(currentValue));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(
          create: (BuildContext context) => widget.counterBloc,
        ),
        BlocProvider<CounterBloc>(
          create: (BuildContext context) => widget.damageBloc,
        ),
        BlocProvider<HistoryBloc>(
          create: (BuildContext context) => widget.historyBloc,
        ),
      ],
      child: Column(
        children: <Widget>[
          HistoryWidget(
            timer: timer,
            historyBloc: widget.historyBloc,
            damageBloc: widget.damageBloc,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: IncrementButton(
                  icon: const Icon(Icons.remove),
                  isDecrement: true,
                  longPressValue: incrementLifeOnPress,
                  counterBloc: widget.counterBloc,
                  damageBloc: widget.damageBloc,
                  damageTimer: timer,
                ),
              ),
              BlocBuilder<CounterBloc, CounterState>(
                  bloc: widget.counterBloc,
                  builder: (context, state) {
                    return Container(
                      height: 160,
                      width: 180,
                      alignment: Alignment.center,
                      child: Text(
                        state.value.toString(),
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    );
                  }),
              Expanded(
                child: IncrementButton(
                  icon: const Icon(Icons.add),
                  isDecrement: false,
                  longPressValue: incrementLifeOnPress,
                  counterBloc: widget.counterBloc,
                  damageBloc: widget.damageBloc,
                  damageTimer: timer,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
