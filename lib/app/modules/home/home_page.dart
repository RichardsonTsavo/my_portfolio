import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_portfolio/app/modules/home/pages/mobile_page.dart';
import 'package:my_portfolio/app/modules/home/pages/web_page.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if(sizingInformation.deviceScreenType == DeviceScreenType.desktop){
          return WebHomePage(title:widget.title);
        }
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          return MobileHomePage(title: widget.title);
        }
        if (sizingInformation.deviceScreenType == DeviceScreenType.watch) {
          return Container(color:Colors.yellow);
        }
        return Container(color:Colors.purple);
      },
    );
  }
}
