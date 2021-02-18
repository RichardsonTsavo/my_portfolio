import 'text_editor_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'text_editor_page.dart';

class TextEditorModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => TextEditorController())
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/text_editor_page',
            child: (_, args) => TextEditorPage()),
      ];

  static Inject get to => Inject<TextEditorModule>.of();
}
