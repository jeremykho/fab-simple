import 'package:fab_simple/constants/values.dart';
import 'package:fab_simple/features/counter/bloc/counter_event.dart';
import 'package:fab_simple/features/history/history_event.dart';
import 'package:fab_simple/screens/home_page.dart';
import 'package:flutter/material.dart';

class ConfirmRestartButton extends StatelessWidget {
  final int restartToLife;

  const ConfirmRestartButton({
    Key? key,
    required this.restartToLife,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          Navigator.pop(context);
          p1LifeCounterBloc.add(ResetEvent(restartToLife));
          p2LifeCounterBloc.add(ResetEvent(restartToLife));
          p1HistoryBloc.add(ResetHistoryEvent(restartToLife));
          p2HistoryBloc.add(ResetHistoryEvent(restartToLife));
          p1EnergyCounterBloc.add(const ResetEvent(minCount));
          p2EnergyCounterBloc.add(const ResetEvent(minCount));
        },
        child: Text(
          'Confirm',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
