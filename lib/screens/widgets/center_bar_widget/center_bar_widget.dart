import 'package:fab_simple/constants/colors.dart';
import 'package:fab_simple/constants/values.dart';
import 'package:fab_simple/features/counter/bloc/counter_event.dart';
import 'package:fab_simple/features/history/history_event.dart';
import 'package:fab_simple/screens/home_page.dart';
import 'package:fab_simple/screens/widgets/center_bar_widget/center_icon_widget.dart';
import 'package:fab_simple/screens/widgets/die_roll_widget/die_reroll_button.dart';
import 'package:fab_simple/screens/widgets/die_roll_widget/die_roll_widget.dart';
import 'package:fab_simple/screens/widgets/info_widget/donation_button.dart';
import 'package:fab_simple/screens/widgets/info_widget/info_widget.dart';
import 'package:fab_simple/utilities/popup/popup.dart';
import 'package:flutter/material.dart';

class CenterBarWidget extends StatelessWidget {
  const CenterBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        // const Divider(
        //   thickness: centerBarSize,
        //   color: lightColor,
        //   height: centerBarSize,
        // ),
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
                p1HistoryBloc.add(const ResetHistoryEvent(defaultBlitzLife));
                p2HistoryBloc.add(const ResetHistoryEvent(defaultBlitzLife));
                p1EnergyCounterBloc.add(const ResetEvent(minCount));
                p2EnergyCounterBloc.add(const ResetEvent(minCount));
              },
              overlay: Text(
                defaultBlitzLife.toString(),
                style: textTheme.displaySmall,
                textAlign: TextAlign.center,
              ),
            ),
            CenterIconWidget(
              onPressed: () {
                p1LifeCounterBloc.add(const ResetEvent(defaultCCLife));
                p2LifeCounterBloc.add(const ResetEvent(defaultCCLife));
                p1HistoryBloc.add(const ResetHistoryEvent(defaultCCLife));
                p2HistoryBloc.add(const ResetHistoryEvent(defaultCCLife));
                p1EnergyCounterBloc.add(const ResetEvent(minCount));
                p2EnergyCounterBloc.add(const ResetEvent(minCount));
              },
              overlay: Text(
                defaultCCLife.toString(),
                style: textTheme.displaySmall,
                textAlign: TextAlign.center,
              ),
            ),
            CenterIconWidget(
              onPressed: () => Popup(
                const InfoWidget(),
                DonationButton(),
              ).show(context),
              // iconData: Icons.info_outline_rounded,
              overlay: Text(
                "i",
                style: textTheme.displayMedium,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        )
      ],
    );
  }
}
