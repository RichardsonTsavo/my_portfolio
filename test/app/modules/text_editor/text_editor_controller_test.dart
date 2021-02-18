import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:my_portfolio/app/modules/text_editor/text_editor_controller.dart';
import 'package:my_portfolio/app/modules/text_editor/text_editor_module.dart';

void main() {
  initModule(TextEditorModule());
  // TextEditorController texteditor;
  //
  setUp(() {
    //     texteditor = TextEditorModule.to.get<TextEditorController>();
  });

  group('TextEditorController Test', () {
    //   test("First Test", () {
    //     expect(texteditor, isInstanceOf<TextEditorController>());
    //   });

    //   test("Set Value", () {
    //     expect(texteditor.value, equals(0));
    //     texteditor.increment();
    //     expect(texteditor.value, equals(1));
    //   });
  });
}
