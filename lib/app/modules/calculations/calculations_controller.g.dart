// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculations_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CalculationsController on _CalculationsControllerBase, Store {
  final _$currentStartdateAtom =
      Atom(name: '_CalculationsControllerBase.currentStartdate');

  @override
  String get currentStartdate {
    _$currentStartdateAtom.reportRead();
    return super.currentStartdate;
  }

  @override
  set currentStartdate(String value) {
    _$currentStartdateAtom.reportWrite(value, super.currentStartdate, () {
      super.currentStartdate = value;
    });
  }

  final _$resultTextAtom = Atom(name: '_CalculationsControllerBase.resultText');

  @override
  String get resultText {
    _$resultTextAtom.reportRead();
    return super.resultText;
  }

  @override
  set resultText(String value) {
    _$resultTextAtom.reportWrite(value, super.resultText, () {
      super.resultText = value;
    });
  }

  final _$_CalculationsControllerBaseActionController =
      ActionController(name: '_CalculationsControllerBase');

  @override
  void setStartDate(DateTime value) {
    final _$actionInfo = _$_CalculationsControllerBaseActionController
        .startAction(name: '_CalculationsControllerBase.setStartDate');
    try {
      return super.setStartDate(value);
    } finally {
      _$_CalculationsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void calculateAge() {
    final _$actionInfo = _$_CalculationsControllerBaseActionController
        .startAction(name: '_CalculationsControllerBase.calculateAge');
    try {
      return super.calculateAge();
    } finally {
      _$_CalculationsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void calculateBMI() {
    final _$actionInfo = _$_CalculationsControllerBaseActionController
        .startAction(name: '_CalculationsControllerBase.calculateBMI');
    try {
      return super.calculateBMI();
    } finally {
      _$_CalculationsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentStartdate: ${currentStartdate},
resultText: ${resultText}
    ''';
  }
}
