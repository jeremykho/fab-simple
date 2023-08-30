import 'package:fab_simple/screens/widgets/die_roll_widget/die_reroll_button.dart';
import 'package:fab_simple/screens/widgets/die_roll_widget/die_roll_widget.dart';
import 'package:fab_simple/utilities/popup/popup.dart';
import 'package:flutter/material.dart';

class InfoPopupWidget extends StatelessWidget {
  const InfoPopupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Popup(
      child: const DieRollWidget(),
      actionButtons: [const DieRerollButton()],
    ).show(context);
  }
}
