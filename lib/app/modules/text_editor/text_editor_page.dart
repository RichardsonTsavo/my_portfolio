import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_portfolio/app/modules/text_editor/pages/mobile_page.dart';
import 'package:my_portfolio/app/modules/text_editor/pages/web_page.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'text_editor_controller.dart';

class TextEditorPage extends StatefulWidget {
  final String title;
  const TextEditorPage({Key key, this.title = "TextEditor"}) : super(key: key);

  @override
  _TextEditorPageState createState() => _TextEditorPageState();
}

class _TextEditorPageState
    extends ModularState<TextEditorPage, TextEditorController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
          return WebTextEditorPage(title: widget.title,controller: controller,);
        }

        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          return MobileTextEditorPage(title: widget.title,controller: controller,);
        }

        if (sizingInformation.deviceScreenType == DeviceScreenType.watch) {
          return Container(color:Colors.yellow);
        }

        return Container(color:Colors.purple);
      },
    );
  }
}
