import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class InfoButtons extends StatelessWidget {
 final String gitUrl;

 InfoButtons({@required this.gitUrl});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // ignore: deprecated_member_use
        RaisedButton(child: Text("Git Repository"), onPressed: launchGitURL),
        // ignore: deprecated_member_use
        RaisedButton(child: Text("Donate with Paypal"), onPressed: launchDonateURL)
      ],
    );
  }


  launchGitURL() async {
    if (await canLaunch(gitUrl)) {
      await launch(gitUrl);
    } else {
      throw 'Could not launch $gitUrl';
    }
  }

  launchDonateURL() async {
    if (await canLaunch("https://www.paypal.com/donate?hosted_button_id=U6DRW4BBC53AU")) {
      await launch("https://www.paypal.com/donate?hosted_button_id=U6DRW4BBC53AU");
    } else {
      throw 'Could not launch https://www.paypal.com/donate?hosted_button_id=U6DRW4BBC53AU';
    }
  }

}
