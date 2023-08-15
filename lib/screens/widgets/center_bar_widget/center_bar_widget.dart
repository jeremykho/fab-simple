import 'package:fab_simple/constants/colors.dart';
import 'package:fab_simple/constants/values.dart';
import 'package:fab_simple/features/counter/bloc/counter_event.dart';
import 'package:fab_simple/screens/home_page.dart';
import 'package:fab_simple/screens/widgets/center_bar_widget/center_icon_widget.dart';
import 'package:fab_simple/screens/widgets/die_roll_widget/die_reroll_button.dart';
import 'package:fab_simple/screens/widgets/die_roll_widget/die_roll_widget.dart';
import 'package:fab_simple/screens/widgets/info_widget/info_widget.dart';
import 'package:fab_simple/utilities/popup/popup.dart';
import 'package:flutter/material.dart';

class CenterBarWidget extends StatelessWidget {
  const CenterBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        const Divider(
          thickness: centerBarSize,
          color: lightColor,
          height: centerBarSize,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CenterIconWidget(
              onPressed: () => Popup(
                const DieRollWidget(),
                const DieRerollButton(),
              ).show(context),
              iconData: Icons.casino_outlined,
            ),
            CenterIconWidget(
              onPressed: () {
                p1LifeCounterBloc.add(const ResetEvent(defaultBlitzLife));
                p2LifeCounterBloc.add(const ResetEvent(defaultBlitzLife));
                p1EnergyCounterBloc.add(const ResetEvent(minCount));
                p2EnergyCounterBloc.add(const ResetEvent(minCount));
              },
              overlay: Text(
                defaultBlitzLife.toString(),
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            CenterIconWidget(
              onPressed: () {
                p1LifeCounterBloc.add(const ResetEvent(defaultCCLife));
                p2LifeCounterBloc.add(const ResetEvent(defaultCCLife));
                p1EnergyCounterBloc.add(const ResetEvent(minCount));
                p2EnergyCounterBloc.add(const ResetEvent(minCount));
              },
              overlay: Text(
                defaultCCLife.toString(),
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            CenterIconWidget(
              onPressed: () => Popup(
                const InfoWidget(),
                const DieRerollButton(),
              ).show(context),
              iconData: Icons.info_outline_rounded,
            ),
          ],
        )
      ],
    );
  }
}
