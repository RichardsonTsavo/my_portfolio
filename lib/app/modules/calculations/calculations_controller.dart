import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
part 'calculations_controller.g.dart';

@Injectable()
class CalculationsController = _CalculationsControllerBase
    with _$CalculationsController;

abstract class _CalculationsControllerBase with Store {
  ObservableList listOptions = [true,false,false].asObservable();
  final request = "https://api.hgbrasil.com/finance?format=json-cors&key=ca6d8cdb";
  DateTime currentDateTime;
  TextEditingController heightBmiController = TextEditingController();
  TextEditingController weightBmiController = TextEditingController();
  MoneyMaskedTextController realController = MoneyMaskedTextController();
  MoneyMaskedTextController dolarController = MoneyMaskedTextController();
  MoneyMaskedTextController euroController = MoneyMaskedTextController();

  @observable
  String currentStartdate = "Select a date";

  @observable
  String resultText = "";

  @action
  void setStartDate(DateTime value){
    currentDateTime = value;
    currentStartdate = "${value.month.toString().padLeft(2,"0")}/${value.day.toString().padLeft(2,"0")}/${value.year}";
  }

  @action
  void calculateAge(){
    if(currentDateTime==null){
      return;
    }
    resultText = "Your age is: ${DateTime(0000,00,00).add(Duration(days: DateTime.now().difference(currentDateTime).inDays)).year} years\n"
        "On days are: ${DateTime.now().difference(currentDateTime).inDays} days";
  }

  @action
  void calculateBMI(){
      double weight = double.parse(weightBmiController.text);
      double height = double.parse(heightBmiController.text) / 100;
      double bmi = weight / (height * height);

      if(bmi < 18.6){
        resultText = "underweight (${bmi.toStringAsPrecision(3)})";
      }else if (bmi >= 18.6 && bmi < 24.9){
        resultText = "ideal weight (${bmi.toStringAsPrecision(3)})";
      }else if (bmi >= 24.9 && bmi < 29.9){
        resultText = "lightly to the top of the weight (${bmi.toStringAsPrecision(3)})";
      }else if (bmi >= 29.9 && bmi < 34.9){
        resultText = "Obesity grade 1 (${bmi.toStringAsPrecision(3)})";
      }else if (bmi >= 34.9 && bmi < 39.9){
        resultText = "Obesity grade 2 (${bmi.toStringAsPrecision(3)})";
      }else if(bmi >= 40){
        resultText = "Obesity grade 3 (${bmi.toStringAsPrecision(3)})";
      }
  }

  double dolar;
  double euro;

  Future<Map> callInfo()async{
    http.Response response = await http.get(request);
    return jsonDecode(response.body);
  }

  void realCalculate()async{
    double real = realController.numberValue;
    print(real);
    dolarController.text = (real/dolar).toStringAsFixed(2);
    euroController.text = (real/euro).toStringAsFixed(2);
  }
  void dolarCalculate()async{
    double dolar = dolarController.numberValue;
    realController.text = (dolar * this.dolar).toStringAsFixed(2);
    euroController.text = ((dolar * this.dolar)/euro).toStringAsFixed(2);
  }
  void euroCalculate()async{
    double euro = euroController.numberValue;
    realController.text = (euro * this.euro).toStringAsFixed(2);
    euroController.text = ((euro * this.euro)/dolar).toStringAsFixed(2);
  }

}
