import 'package:fab_simple/constants/values.dart';
import 'package:fab_simple/features/counter/bloc/counter_bloc.dart';
import 'package:fab_simple/features/counter/bloc/counter_event.dart';
import 'package:fab_simple/features/history/history_bloc.dart';
import 'package:fab_simple/features/history/history_event.dart';
import 'package:fab_simple/screens/widgets/player_widget/energy_widget.dart';
import 'package:fab_simple/screens/widgets/player_widget/history_widget.dart';
import 'package:fab_simple/screens/widgets/player_widget/life_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:async/async.dart';

class PlayerWidget extends StatefulWidget {
  final CounterBloc lifeBloc;
  final CounterBloc damageBloc;
  final HistoryBloc historyBloc;
  final CounterBloc energyBloc;

  const PlayerWidget({
    super.key,
    required this.lifeBloc,
    required this.damageBloc,
    required this.historyBloc,
    required this.energyBloc,
  });

  @override
  State<PlayerWidget> createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget> {
  final timerDuration = const Duration(seconds: timerDurationSeconds);
  late final RestartableTimer timer =
      RestartableTimer(timerDuration, resetDamage);

  @override
  void initState() {
    widget.historyBloc.add(RecordEvent(widget.lifeBloc.state.value));
    timer.cancel();
    super.initState();
  }

  void resetDamage() {
    List history = widget.historyBloc.state.history;
    int lastValue = history[history.length - 1];
    int currentValue = widget.lifeBloc.state.value;

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
          create: (BuildContext context) => widget.lifeBloc,
        ),
        BlocProvider<CounterBloc>(
          create: (BuildContext context) => widget.damageBloc,
        ),
        BlocProvider<HistoryBloc>(
          create: (BuildContext context) => widget.historyBloc,
        ),
      ],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          HistoryWidget(
            timer: timer,
            historyBloc: widget.historyBloc,
            damageBloc: widget.damageBloc,
          ),
          const SizedBox(height: 10),
          LifeWidget(
            lifeBloc: widget.lifeBloc,
            damageBloc: widget.damageBloc,
            timer: timer,
          ),
          const SizedBox(height: 10),
          EnergyWidget(
            counterBloc: widget.energyBloc,
          ),
        ],
      ),
    );
  }
}
