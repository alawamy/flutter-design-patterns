import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import '../command.dart';
import '../shape.dart';

class ChangeColorCommand implements Command {
  ChangeColorCommand(this.shape) : previousColor = shape.color;

  final Color previousColor;
  Shape shape;

  @override
  String getTitle() => 'Change color';

  @override
  void execute() => shape.color = Color.fromRGBO(
        Random().nextInt(256),
        Random().nextInt(256),
        Random().nextInt(256),
        1.0,
      );

  @override
  void undo() => shape.color = previousColor;
}
