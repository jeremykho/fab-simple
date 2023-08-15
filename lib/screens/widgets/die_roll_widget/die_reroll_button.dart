import 'package:fab_simple/screens/widgets/die_roll_widget/die_roll_widget.dart';
import 'package:fab_simple/utilities/popup/popup.dart';
import 'package:flutter/material.dart';

class DieRerollButton extends StatelessWidget {
  const DieRerollButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          Navigator.pop(context);
          Popup(const DieRollWidget(), const DieRerollButton()).show(context);
        },
        child: Text(
          'Re-Roll',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
