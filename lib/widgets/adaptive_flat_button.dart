import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
class AdaptiveFlatButton extends StatelessWidget {
  final String text;
  final Function handlerEvent;

  AdaptiveFlatButton(this.text, this.handlerEvent);
  
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? 
                  CupertinoButton(
                    child: Text(
                      text, 
                      style:  TextStyle(
                        fontWeight: FontWeight.bold),
                    ),
                    onPressed: handlerEvent,
                  ) 
                  :
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text(
                      text, 
                      style:  TextStyle(
                        fontWeight: FontWeight.bold),
                    ),
                    onPressed: handlerEvent,
                  );
  }
}