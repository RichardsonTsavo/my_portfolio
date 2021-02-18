// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_editor_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TextEditorController on _TextEditorControllerBase, Store {
  final _$pickerColorAtom = Atom(name: '_TextEditorControllerBase.pickerColor');

  @override
  Color get pickerColor {
    _$pickerColorAtom.reportRead();
    return super.pickerColor;
  }

  @override
  set pickerColor(Color value) {
    _$pickerColorAtom.reportWrite(value, super.pickerColor, () {
      super.pickerColor = value;
    });
  }

  final _$currentColorAtom =
      Atom(name: '_TextEditorControllerBase.currentColor');

  @override
  Color get currentColor {
    _$currentColorAtom.reportRead();
    return super.currentColor;
  }

  @override
  set currentColor(Color value) {
    _$currentColorAtom.reportWrite(value, super.currentColor, () {
      super.currentColor = value;
    });
  }

  final _$_TextEditorControllerBaseActionController =
      ActionController(name: '_TextEditorControllerBase');

  @override
  void changeColor(Color color) {
    final _$actionInfo = _$_TextEditorControllerBaseActionController
        .startAction(name: '_TextEditorControllerBase.changeColor');
    try {
      return super.changeColor(color);
    } finally {
      _$_TextEditorControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void showPickerColor(BuildContext context) {
    final _$actionInfo = _$_TextEditorControllerBaseActionController
        .startAction(name: '_TextEditorControllerBase.showPickerColor');
    try {
      return super.showPickerColor(context);
    } finally {
      _$_TextEditorControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pickerColor: ${pickerColor},
currentColor: ${currentColor}
    ''';
  }
}
