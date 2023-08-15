import 'dart:math';

import 'package:fab_simple/constants/values.dart';
import 'package:fab_simple/features/counter/bloc/counter_bloc.dart';
import 'package:fab_simple/screens/widgets/center_bar_widget/center_bar_widget.dart';
import 'package:fab_simple/screens/widgets/player_widget/player_widget.dart';
import 'package:flutter/material.dart';
import 'package:wakelock/wakelock.dart';

final CounterBloc p1LifeCounterBloc = CounterBloc(defaultBlitzLife);
final CounterBloc p2LifeCounterBloc = CounterBloc(defaultBlitzLife);
final CounterBloc p1EnergyCounterBloc = CounterBloc(minCount);
final CounterBloc p2EnergyCounterBloc = CounterBloc(minCount);
final CounterBloc p1DamageCounterBloc = CounterBloc(0);
final CounterBloc p2DamageCounterBloc = CounterBloc(0);

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Wakelock.enable();
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationZ(pi),
                child: PlayerWidget(
                  lifeBloc: p2LifeCounterBloc,
                  energyBloc: p2EnergyCounterBloc,
                  damageBloc: p2DamageCounterBloc,
                ),
              ),
            ),
            const CenterBarWidget(),
            Expanded(
              child: PlayerWidget(
                lifeBloc: p1LifeCounterBloc,
                energyBloc: p1EnergyCounterBloc,
                damageBloc: p1DamageCounterBloc,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
