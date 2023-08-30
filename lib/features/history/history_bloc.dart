import 'package:bloc/bloc.dart';
import 'package:fab_simple/features/history/history_event.dart';
import 'package:fab_simple/features/history/history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final List recordedHistory;

  HistoryBloc(this.recordedHistory)
      : super(HistoryStateValid(recordedHistory)) {
    on<RecordEvent>(
      (event, emit) {
        emit(HistoryStateValid(state.history + [event.value]));
      },
    );
    on<ResetHistoryEvent>(
      (event, emit) {
        emit(HistoryStateValid([event.value]));
      },
    );
  }
}
