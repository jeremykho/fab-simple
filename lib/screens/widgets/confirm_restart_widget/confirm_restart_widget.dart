import 'package:flutter/material.dart';

class ConfirmRestartWidget extends StatelessWidget {
  const ConfirmRestartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Restart Life Counters?',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            'Life Histories and Floating Energy will also be cleared.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          // const SizedBox(
          //   height: 10,
          // ),
          // Text(
          //   'Help the developer buy some coffee or booster packs?',
          //   textAlign: TextAlign.center,
          //   style: Theme.of(context).textTheme.headlineMedium,
          // ),
        ],
      ),
    );
  }
}
