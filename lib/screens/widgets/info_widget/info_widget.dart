import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Want to buy me some coffee or booster packs?',
          style: Theme.of(context).textTheme.headline3,
        ),
      ],
    );
  }
}
