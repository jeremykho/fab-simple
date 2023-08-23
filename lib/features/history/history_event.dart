import 'package:flutter/material.dart';

@immutable
abstract class HistoryEvent {
  final int value;
  const HistoryEvent(this.value);
}

class RecordEvent extends HistoryEvent {
  const RecordEvent(
    super.value,
  );
}

class ResetHistoryEvent extends HistoryEvent {
  const ResetHistoryEvent(super.value);
}
