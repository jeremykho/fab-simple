import 'package:fab_simple/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DonationButton extends StatelessWidget {
  DonationButton({
    Key? key,
  }) : super(key: key);

  final Uri _url = Uri.parse(donationLink);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 180,
        child: ElevatedButton(
          onPressed: () async {
            if (!await launchUrl(_url)) {
              throw Exception('Could not launch $_url');
            }
          },
          // style: Theme.of(context).buttonTheme.dark,
          child: const Text(
            'Paypal',
          ),
        ),
      ),
    );
  }
}

// TextButton(
//           onPressed: () {
//             _launchUrl;
//           },
//           style: TextButton.styleFrom(
//             textStyle: const TextStyle(fontSize: 20),
//             backgroundColor: darkColor,
//           ),
//           child: Text(
//             'Open Paypal',
//             style: Theme.of(context).textTheme.displaySmall,
//           ),
//         )