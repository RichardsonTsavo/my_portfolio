import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_portfolio/app/modules/calculations/pages/mobile_page.dart';
import 'package:my_portfolio/app/modules/calculations/pages/web_page.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'calculations_controller.dart';

class CalculationsPage extends StatefulWidget {
  final String title;
  const CalculationsPage({Key key, this.title = "Calculations"})
      : super(key: key);

  @override
  _CalculationsPageState createState() => _CalculationsPageState();
}

class _CalculationsPageState
    extends ModularState<CalculationsPage, CalculationsController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if(sizingInformation.deviceScreenType == DeviceScreenType.desktop){
          return WebCalculationsPage(title:widget.title + " Web Version",controller: controller,);
        }
        return MobileCalculationsPage(title:widget.title + " Mobile Version",controller: controller,);
      },
    );
  }
}
