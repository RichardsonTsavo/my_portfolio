import 'package:my_portfolio/app/modules/calculations/calculations_module.dart';
import 'package:my_portfolio/app/modules/text_editor/text_editor_module.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/app/app_widget.dart';
import 'package:my_portfolio/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController())
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: HomeModule()),
        ModularRouter('/text_editor_page', module: TextEditorModule()),
        ModularRouter('/calculations', module: CalculationsModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
