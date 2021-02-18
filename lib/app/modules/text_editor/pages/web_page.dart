import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_portfolio/app/modules/text_editor/text_editor_controller.dart';
import 'package:my_portfolio/app/shared/widgets/InfoButtons.dart';

class WebTextEditorPage extends StatefulWidget {
  final String title;
  final TextEditorController controller;
  WebTextEditorPage({this.title, this.controller});
  @override
  _WebTextEditorPageState createState() => _WebTextEditorPageState();
}

class _WebTextEditorPageState extends State<WebTextEditorPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) => Scaffold(
              appBar: AppBar(
                title: Text(widget.title),
                centerTitle: true,
              ),
              body: Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 248, 248, 248),
                          border: Border.all(color: Colors.black)),
                      width: constraints.maxWidth / 2.5,
                      height: constraints.maxHeight / 2,
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Container(
                            height: constraints.maxHeight * 0.05,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 248, 248, 248),
                                border: Border.symmetric(horizontal: BorderSide(color: Colors.black))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Observer(
                                  builder: (context) => ToggleButtons(
                                      onPressed: (index) {
                                        widget.controller.fontWeigth[index] =
                                        !widget.controller.fontWeigth[index];
                                      },
                                      children: [
                                        Icon(Icons.format_bold),
                                        Icon(Icons.format_italic),
                                        Icon(Icons.format_underline),
                                      ],
                                      isSelected:
                                      widget.controller.fontWeigth.toList()),
                                ),
                                Observer(
                                  builder: (context) => ToggleButtons(
                                      onPressed: (index) {
                                        for (int i = 0;
                                        i <
                                            widget
                                                .controller.fontAligment.length;
                                        i++) {
                                          if (i == index) {
                                            widget.controller.fontAligment[index] =
                                            !widget
                                                .controller.fontAligment[index];
                                          } else {
                                            widget.controller.fontAligment[i] =
                                            false;
                                          }
                                        }
                                      },
                                      children: [
                                        Icon(Icons.format_align_justify),
                                        Icon(Icons.format_align_center),
                                        Icon(Icons.format_align_left),
                                        Icon(Icons.format_align_right),
                                      ],
                                      isSelected:
                                      widget.controller.fontAligment.toList()),
                                ),
                                Observer(
                                  builder: (context) => ToggleButtons(
                                      onPressed: (index) {
                                        widget.controller.showPickerColor(context);
                                      },
                                      children: [
                                        Icon(
                                          Icons.format_color_text,
                                          color: widget.controller.currentColor,
                                        )
                                      ],
                                      isSelected:
                                      widget.controller.fontColor.toList()),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Observer(
                                builder: (context) => TextField(
                                  textAlign: widget.controller.fontAligment[0]
                                      ? TextAlign.justify
                                      : widget.controller.fontAligment[1]
                                      ? TextAlign.center
                                      : widget.controller.fontAligment[2]
                                      ? TextAlign.left
                                      : widget.controller.fontAligment[3]
                                      ? TextAlign.right
                                      : TextAlign.start,
                                  style: TextStyle(
                                      color: widget.controller.currentColor,
                                      decoration: widget.controller.fontWeigth[2]
                                          ? TextDecoration.underline
                                          : TextDecoration.none,
                                      fontStyle: widget.controller.fontWeigth[1]
                                          ? FontStyle.italic
                                          : FontStyle.normal,
                                      fontWeight: widget.controller.fontWeigth[0]
                                          ? FontWeight.bold
                                          : FontWeight.normal),
                                  enableInteractiveSelection: true,
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                    hintText: 'type something',
                                  ),
                                  minLines: null,
                                  maxLines: null,
                                  expands: true,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    InfoButtons(gitUrl: "https://github.com/RichardsonTsavo/my_portfolio/tree/master/lib/app/modules/text_editor",)
                  ],
                ),
              ),
            ));
  }
}
