import 'dart:math';

import 'package:fab_simple/constants/values.dart';
import 'package:fab_simple/features/counter/bloc/counter_bloc.dart';
import 'package:fab_simple/features/history/history_bloc.dart';
import 'package:fab_simple/screens/widgets/center_bar_widget/center_bar_widget.dart';
import 'package:fab_simple/screens/widgets/player_widget/player_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wakelock/wakelock.dart';

final CounterBloc p1LifeCounterBloc = CounterBloc(defaultBlitzLife);
final CounterBloc p2LifeCounterBloc = CounterBloc(defaultBlitzLife);
final CounterBloc p1EnergyCounterBloc = CounterBloc(minCount);
final CounterBloc p2EnergyCounterBloc = CounterBloc(minCount);
final CounterBloc p1DamageCounterBloc = CounterBloc(0);
final CounterBloc p2DamageCounterBloc = CounterBloc(0);
final HistoryBloc p1HistoryBloc = HistoryBloc([]);
final HistoryBloc p2HistoryBloc = HistoryBloc([]);

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void enterFullScreenButKeepBottomOverlay() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [],
    );
  }

  @override
  Widget build(BuildContext context) {
    Wakelock.enable();
    enterFullScreenButKeepBottomOverlay();
    return SafeArea(
      child: Scaffold(body: OrientationBuilder(
        builder: ((context, orientation) {
          final bool isPortrait = orientation == Orientation.portrait;
          return Flex(
            direction: isPortrait ? Axis.vertical : Axis.horizontal,
            children: [
              Expanded(
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationZ(isPortrait ? pi : 0),
                  child: PlayerWidget(
                    lifeBloc: p2LifeCounterBloc,
                    energyBloc: p2EnergyCounterBloc,
                    damageBloc: p2DamageCounterBloc,
                    historyBloc: p2HistoryBloc,
                  ),
                ),
              ),
              const CenterBarWidget(),
              Expanded(
                child: PlayerWidget(
                  lifeBloc: p1LifeCounterBloc,
                  energyBloc: p1EnergyCounterBloc,
                  damageBloc: p1DamageCounterBloc,
                  historyBloc: p1HistoryBloc,
                ),
              ),
            ],
          );
        }),
      )),
    );
  }
}
