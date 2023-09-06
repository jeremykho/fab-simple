import 'package:fab_simple/constants/values.dart';
import 'package:fab_simple/screens/widgets/center_bar_widget/center_icon_widget.dart';
import 'package:fab_simple/screens/widgets/confirm_restart_widget/confirm_restart_button.dart';
import 'package:fab_simple/screens/widgets/confirm_restart_widget/confirm_restart_widget.dart';
import 'package:fab_simple/screens/widgets/die_roll_widget/die_reroll_button.dart';
import 'package:fab_simple/screens/widgets/die_roll_widget/die_roll_widget.dart';
import 'package:fab_simple/screens/widgets/info_widget/donation_button.dart';
import 'package:fab_simple/screens/widgets/info_widget/info_widget.dart';
import 'package:fab_simple/utilities/popup/popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CenterBarWidget extends StatelessWidget {
  const CenterBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Flex(
        direction: isPortrait ? Axis.horizontal : Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CenterIconWidget(
            onPressed: () => Popup(
              child: const ConfirmRestartWidget(),
              actionButtons: [
                const ConfirmRestartButton(
                  restartToLife: defaultBlitzLife,
                )
              ],
            ).show(context),
            overlay: Text(
              defaultBlitzLife.toString(),
              style: textTheme.displaySmall,
              textAlign: TextAlign.center,
            ),
          ),
          CenterIconWidget(
            onPressed: () => Popup(
              child: const ConfirmRestartWidget(),
              actionButtons: [
                const ConfirmRestartButton(
                  restartToLife: defaultCCLife,
                )
              ],
            ).show(context),
            overlay: Text(
              defaultCCLife.toString(),
              style: textTheme.displaySmall,
              textAlign: TextAlign.center,
            ),
          ),
          CenterIconWidget(
            onPressed: () => Popup(
              child: const DieRollWidget(),
              actionButtons: [const DieRerollButton()],
            ).show(context),
            iconData: Icons.casino_outlined,
          ),
          CenterIconWidget(
            onPressed: () {
              if (isPortrait) {
                SystemChrome.setPreferredOrientations([
                  DeviceOrientation.landscapeLeft,
                  DeviceOrientation.landscapeRight,
                ]);
              } else {
                SystemChrome.setPreferredOrientations([
                  DeviceOrientation.portraitDown,
                  DeviceOrientation.portraitUp,
                ]);
              }
            },
            iconData: Icons.screen_rotation_rounded,
          ),
          CenterIconWidget(
            onPressed: () => Popup(
              child: const InfoWidget(),
              actionButtons: [DonationButton()],
            ).show(context),
            overlay: Text(
              "i",
              style: textTheme.displayMedium,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
