import 'package:fab_simple/features/counter/bloc/counter_bloc.dart';
import 'package:fab_simple/features/history/history_bloc.dart';
import 'package:fab_simple/screens/widgets/player_widget/energy_widget.dart';
import 'package:fab_simple/screens/widgets/player_widget/life_widget.dart';
import 'package:flutter/material.dart';

class PlayerWidget extends StatelessWidget {
  final CounterBloc lifeBloc;
  final CounterBloc energyBloc;
  final CounterBloc damageBloc;
  final HistoryBloc historyBloc;

  const PlayerWidget({
    super.key,
    required this.lifeBloc,
    required this.energyBloc,
    required this.damageBloc,
    required this.historyBloc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LifeWidget(
          counterBloc: lifeBloc,
          damageBloc: damageBloc,
          historyBloc: historyBloc,
        ),
        EnergyWidget(
          counterBloc: energyBloc,
        ),
      ],
    );
  }
}
