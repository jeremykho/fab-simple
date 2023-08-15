import 'dart:math';

import 'package:dice_icons/dice_icons.dart';
import 'package:flutter/material.dart';

int d6Roll() {
  return Random().nextInt(6);
}

const List<IconData> diceIcons = [
  DiceIcons.dice1,
  DiceIcons.dice2,
  DiceIcons.dice3,
  DiceIcons.dice4,
  DiceIcons.dice5,
  DiceIcons.dice6,
];
