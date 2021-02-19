import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_portfolio/app/modules/calculations/calculations_controller.dart';
import 'package:my_portfolio/app/shared/widgets/InfoButtons.dart';

class WebCalculationsPage extends StatefulWidget {
  final CalculationsController controller;
  final String title;

  WebCalculationsPage({this.title, this.controller});

  @override
  _WebCalculationsPageState createState() => _WebCalculationsPageState();
}

class _WebCalculationsPageState extends State<WebCalculationsPage> {
  GlobalKey<FormState> formBmi = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
              centerTitle: true,
            ),
            body: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Observer(
                    builder: (context) => ToggleButtons(
                        onPressed: (index) {
                          for (int i = 0;
                              i < widget.controller.listOptions.length;
                              i++) {
                            if (i == index) {
                              widget.controller.listOptions[index] =
                                  !widget.controller.listOptions[index];
                            } else {
                              widget.controller.listOptions[i] = false;
                            }
                          }
                          widget.controller.resultText = "";
                        },
                        children: [
                          Text(" Find out your age! "),
                          Text(" BMI calculator "),
                          Text(" currency converter "),
                        ],
                        isSelected: widget.controller.listOptions.toList()),
                  ),
                  Expanded(
                    child: Observer(builder: (context) {
                      if (widget.controller.listOptions[0] == true) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Calculate your age from your date of birth!"),
                            Container(
                              alignment: Alignment.center,
                              width: 110,
                              height: constraints.maxHeight * 0.05,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black)),
                              child: GestureDetector(
                                onTap: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(2025),
                                  ).then((value) {
                                    widget.controller.setStartDate(value);
                                  });
                                },
                                child: Observer(
                                  builder: (context) =>
                                      Text(widget.controller.currentStartdate),
                                ),
                              ),
                            ),
                            Observer(
                              builder: (context) => Text(
                                widget.controller.resultText,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            // ignore: deprecated_member_use
                            RaisedButton(
                              child: Text("Calculate"),
                              onPressed: () {
                                widget.controller.calculateAge();
                              },
                            )
                          ],
                        );
                      }
                      if (widget.controller.listOptions[1] == true) {
                        return Form(
                          key: formBmi,
                          child: Container(
                            width: constraints.maxWidth / 3,
                            child: Column(
                              children: [
                                Icon(
                                  Icons.person,
                                  size: 100,
                                ),
                                Text("body mass index calculation!"),
                                TextFormField(
                                  controller: widget.controller.weightBmiController,
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return "Add a value to the weight";
                                    }
                                    return null;
                                  },
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp('[0-9]')),
                                  ],
                                  decoration: InputDecoration(
                                    labelText: "Weight (kg)",
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue)),
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue)),
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                TextFormField(
                                  controller: widget.controller.heightBmiController,
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return "Add a value to the height";
                                    }
                                    return null;
                                  },
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp('[0-9]')),
                                  ],
                                  decoration: InputDecoration(
                                    labelText: "Height (cm)",
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue)),
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue)),
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Text("Result: ${widget.controller.resultText}"),
                                SizedBox(
                                  height: 25,
                                ),
                                // ignore: deprecated_member_use
                                RaisedButton(
                                    child: Text("Calculate"),
                                    onPressed: () {
                                      if (formBmi.currentState.validate()) {
                                        widget.controller.calculateBMI();
                                      }
                                    })
                              ],
                            ),
                          ),
                        );
                      }
                      return Container(
                        width: constraints.maxWidth / 3,
                        child: FutureBuilder<Map>(
                          future: widget.controller.callInfo(),
                          builder: (context, snapshot) {
                            if(snapshot.hasData){
                              widget.controller.dolar = snapshot.data["results"]["currencies"]["USD"]["buy"];
                              widget.controller.euro = snapshot.data["results"]["currencies"]["EUR"]["buy"];
                              return Column(
                                children: [
                                  Icon(
                                    Icons.monetization_on,
                                    color: Colors.amber,
                                    size: 100,
                                  ),
                                  Text("Working with http for currency conversion."
                                      "\nSite database: https://hgbrasil.com/status/finance",
                                    textAlign: TextAlign.center,),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  TextField(
                                    onChanged: (value){
                                      widget.controller.realCalculate();
                                    },
                                    controller: widget.controller.realController,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp('[0-9]')),
                                    ],
                                    decoration: InputDecoration(
                                      prefixText: "R\$",
                                      labelText: "Brasil, Real (BRL)",
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                          BorderSide(color: Colors.blue)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                          BorderSide(color: Colors.blue)),
                                      border: OutlineInputBorder(
                                          borderSide:
                                          BorderSide(color: Colors.blue)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  TextField(
                                    onChanged: (value){
                                      widget.controller.dolarCalculate();
                                    },
                                    controller: widget.controller.dolarController,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp('[0-9]')),
                                    ],
                                    decoration: InputDecoration(
                                      prefixText: "US\$",
                                      labelText: "Estados Unidos, Dolar (USD)",
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                          BorderSide(color: Colors.blue)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                          BorderSide(color: Colors.blue)),
                                      border: OutlineInputBorder(
                                          borderSide:
                                          BorderSide(color: Colors.blue)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  TextField(
                                    onChanged: (value){
                                      widget.controller.euroCalculate();
                                    },
                                    controller: widget.controller.euroController,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp('[0-9]')),
                                    ],
                                    decoration: InputDecoration(
                                      prefixText: "€",
                                      labelText: "Comunidade Europeia, Euros(EUR)",
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                          BorderSide(color: Colors.blue)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                          BorderSide(color: Colors.blue)),
                                      border: OutlineInputBorder(
                                          borderSide:
                                          BorderSide(color: Colors.blue)),
                                    ),
                                  ),
                                  // ignore: deprecated_member_use
                                ],
                              );
                            }else{
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                          },
                        ),
                      );
                    }),
                  ),
                  InfoButtons(gitUrl: "")
                ],
              ),
            ));
      },
    );
  }

}
