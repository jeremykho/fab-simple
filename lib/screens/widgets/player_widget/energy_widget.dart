import 'package:fab_simple/constants/values.dart';
import 'package:fab_simple/features/counter/bloc/counter_bloc.dart';
import 'package:fab_simple/features/counter/bloc/counter_state.dart';
import 'package:fab_simple/screens/widgets/player_widget/energy_icon_widget.dart';
import 'package:fab_simple/screens/widgets/player_widget/increment_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EnergyWidget extends StatelessWidget {
  final CounterBloc counterBloc;

  const EnergyWidget({super.key, required this.counterBloc});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => counterBloc,
      child: BlocBuilder<CounterBloc, CounterState>(
        bloc: counterBloc,
        builder: (context, state) {
          return Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IncrementButton(
                  icon: const Icon(Icons.arrow_left),
                  isDecrement: true,
                  longPressValue: incrementEnergyOnPress,
                  counterBloc: counterBloc,
                ),
                SizedBox(
                  width: 160,
                  height: 70,
                  child: Center(
                    child: state.value <= maxEnergyIcons
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(maxEnergyIcons, (index) {
                              return EnergyIconWidget(
                                isEmpty: state.value > index ? false : true,
                              );
                            }))
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                state.value.toString(),
                                style: Theme.of(context).textTheme.displayMedium,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const EnergyIconWidget(
                                isEmpty: false,
                              ),
                            ],
                          ),
                  ),
                ),
                IncrementButton(
                  icon: const Icon(Icons.arrow_right),
                  isDecrement: false,
                  longPressValue: incrementEnergyOnPress,
                  counterBloc: counterBloc,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
