import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyText extends StatefulWidget {
  String placeHolder;
  TextEditingController controller;
  TextInputType type;
  String expression;
  FocusNode? nextNode;
  TextEditingController? Focus;
  int lines;
  TextInputAction? done;
  int maxLines = 1;
  bool required = false;
  MyText(
      {required this.placeHolder,

      required  this.controller,
      this.lines = 1,
      this.nextNode,
      this.done,
      this.Focus,
      this.required = false,
      this.expression = "",
      this.type = TextInputType.text});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyTextState();
  }
}

// ignore: must_be_immutable
class MyTextState extends State<MyText> {
  final _focusNode = FocusNode();
  void initState() {
    //  widget.Focus.text = widget.controller.text;
    // widget.controller.addListener(() {
    //   final text = widget.controller.text.toLowerCase();
    //   widget.controller.value = widget.controller.value.copyWith(
    //     text: text,
    //     selection:
    //         TextSelection(baseOffset: text.length, extentOffset: text.length),
    //     composing: TextRange.empty,
    //   );
    // });
    // widget.maxLines = 1;
    // _focusNode.addListener(() {
    //   setState(() {
    //     if (_focusNode.hasFocus) {
    //       widget.maxLines = widget.lines;
    //     } else {
    //       widget.maxLines = 1;
    //     }
    //   });
    //   print("Has focus: ${_focusNode.hasFocus}");
    // });
    super.initState();
  }

  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(children: <Widget>[
        Padding(
          padding: EdgeInsets.all(10),
          child: TextFormField(
            textInputAction: widget.done,
            controller: widget.controller,
            focusNode: widget.nextNode,
            maxLines: widget.maxLines,
            validator: (String? value) {
              if (value==null||value.isEmpty) {
                return 'Please Enter ' + widget.placeHolder;
              } else if (widget.expression.isNotEmpty) {
                if (!RegExp(widget.expression).hasMatch(value)) {
                  return 'Please a valid Email';
                }
              }
            },
            autofocus: true,
            autocorrect: true,
            keyboardType: widget.type,
            onChanged: (text) {
              //widget.controller.text = text;
            },
            onTap: () {
              setState(() {
                widget.maxLines = widget.lines;
              });
            },
            onEditingComplete: () {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
              setState(() {
                widget.maxLines = 1;
              });
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: widget.placeHolder,
              isDense: true,
              contentPadding: EdgeInsets.all(12),
              hintText: widget.placeHolder,
            ),
          ),
        ),
      ]),
    );
  }
}
