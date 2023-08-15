import 'package:flutter/material.dart';

@immutable
abstract class CounterEvent {
  final int value;
  const CounterEvent(this.value);
}

class IncrementEvent extends CounterEvent {
  final bool canNegative;
  const IncrementEvent(
    super.value,
    this.canNegative,
  );
}

class ResetEvent extends CounterEvent {
  const ResetEvent(super.value);
}
