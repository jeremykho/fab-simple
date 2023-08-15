import 'package:flutter/material.dart';

class HeroModel {
  final String name;
  final bool isYoung;
  final int startingLife;
  final Image image;

  HeroModel({
    required this.name,
    required this.isYoung,
    required this.startingLife,
    required this.image,
  });
}

enum HeroClass {
  assassin,
  bard,
  brute,
  guardian,
  illusionist,
  mechanologist,
  merchant,
  ninja,
  ranger,
  runeblade,
  shapeshifter,
  wizard,
  warrior,
}
