import 'package:bloc/bloc.dart';
import 'dart:math';
import 'package:fab_simple/constants/values.dart';
import 'package:fab_simple/features/counter/bloc/counter_event.dart';
import 'package:fab_simple/features/counter/bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  final int initialState;

  CounterBloc(this.initialState) : super(CounterStateValid(initialState)) {
    on<IncrementEvent>(
      (event, emit) {
        emit(
          event.canNegative
              ? CounterStateValid(
                  max(
                    min(
                      state.value + event.value,
                      maxCount,
                    ),
                    -maxCount,
                  ),
                )
              : CounterStateValid(
                  max(
                    min(
                      state.value + event.value,
                      maxCount,
                    ),
                    minCount,
                  ),
                ),
        );
      },
    );
    on<ResetEvent>(
      (event, emit) {
        emit(
          CounterStateValid(event.value),
        );
      },
    );
    // on<DecrementEvent>((event, emit) {
    //   emit(CounterStateValid(
    //     max(
    //       state.value - event.value,
    //       minCount,
    //     ),
    //   ));
    // });
  }
}
