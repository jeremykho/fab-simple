import 'package:async/async.dart';
import 'package:fab_simple/constants/values.dart';
import 'package:fab_simple/features/counter/bloc/counter_bloc.dart';
import 'package:fab_simple/features/counter/bloc/counter_state.dart';
import 'package:fab_simple/features/history/history_bloc.dart';
import 'package:fab_simple/features/history/history_state.dart';
import 'package:fab_simple/screens/widgets/player_widget/damage_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryWidget extends StatefulWidget {
  final RestartableTimer timer;
  final HistoryBloc historyBloc;
  final CounterBloc damageBloc;
  const HistoryWidget(
      {super.key,
      required this.timer,
      required this.historyBloc,
      required this.damageBloc});

  @override
  State<HistoryWidget> createState() => _HistoryWidgetState();
}

class _HistoryWidgetState extends State<HistoryWidget> {
  final FixedExtentScrollController _controller =
      FixedExtentScrollController(initialItem: 0);

  void _scrollToEnd() {
    _controller.animateTo(
      (widget.historyBloc.state.history.length - 1) * scrollItemWidth,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryBloc, HistoryState>(
      bloc: widget.historyBloc,
      builder: (historyContext, historyState) {
        final List history = historyState.history;
        return BlocConsumer<CounterBloc, CounterState>(
          bloc: widget.damageBloc,
          listener: (context, state) {
            if (widget.timer.isActive) {
              _scrollToEnd();
            }
          },
          builder: (counterContext, counterState) {
            return SizedBox(
              height: 50,
              width: 350,
              child: RotatedBox(
                quarterTurns: -45,
                child: ListWheelScrollView.useDelegate(
                  controller: _controller,
                  itemExtent: scrollItemWidth,
                  diameterRatio: 1.7,
                  perspective: 0.001,
                  squeeze: 1.3,
                  childDelegate: ListWheelChildBuilderDelegate(
                    childCount:
                        history.length - (counterState.value != 0 ? 0 : 1),
                    builder: (context, index) {
                      return RotatedBox(
                        quarterTurns: 45,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                history[index].toString(),
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                              widget.timer.isActive &&
                                      index == history.length - 1
                                  ? DamageWidget(state: counterState)
                                  : Container()
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
