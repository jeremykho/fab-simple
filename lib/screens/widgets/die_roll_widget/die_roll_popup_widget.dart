import 'package:fab_simple/screens/widgets/die_roll_widget/die_reroll_button.dart';
import 'package:fab_simple/screens/widgets/die_roll_widget/die_roll_widget.dart';
import 'package:fab_simple/utilities/popup/popup.dart';
import 'package:flutter/material.dart';

class DieRollPopupWidget extends StatelessWidget {
  const DieRollPopupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Popup(const DieRollWidget(), const DieRerollButton()).show(context);
  }
}