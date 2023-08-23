import 'package:flutter/material.dart';

@immutable
abstract class HistoryState {
  final List history;
  const HistoryState(this.history);
}

class HistoryStateValid extends HistoryState {
  const HistoryStateValid(super.value);
}
