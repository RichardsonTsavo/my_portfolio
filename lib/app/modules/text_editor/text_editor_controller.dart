import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'text_editor_controller.g.dart';

@Injectable()
class TextEditorController = _TextEditorControllerBase
    with _$TextEditorController;

abstract class _TextEditorControllerBase with Store {
  ObservableList fontWeigth = [false,false,false].asObservable();
  ObservableList fontAligment = [false,false,false,false].asObservable();
  ObservableList fontColor = [false].asObservable();

  @observable
  Color pickerColor = Colors.black;
  @observable
  Color currentColor = Colors.black;

  @action
  void changeColor(Color color) {
     pickerColor = color;
  }
  @action
  void showPickerColor(BuildContext context){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Select a color!'),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: pickerColor,
            onColorChanged: changeColor,
            showLabel: true,
            pickerAreaHeightPercent: 0.8,
          ),
        ),
        actions: <Widget>[
          // ignore: deprecated_member_use
          FlatButton(
            child: Text('Apply'),
            onPressed: () {
              currentColor = pickerColor;
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

}
