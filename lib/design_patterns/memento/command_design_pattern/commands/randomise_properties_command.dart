import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import '../../memento/imemento.dart';
import '../../originator.dart';
import '../icommand.dart';

class RandomisePropertiesCommand implements ICommand {
  RandomisePropertiesCommand(this.originator)
      : _backup = originator.createMemento();

  final Originator originator;
  final IMemento _backup;

  @override
  void execute() {
    final shape = originator.state;

    shape.color = Color.fromRGBO(
      Random().nextInt(256),
      Random().nextInt(256),
      Random().nextInt(256),
      1.0,
    );
    shape.height = Random().nextInt(101)+50.toDouble();
    shape.width = Random().nextInt(101)+50.toDouble();
  }

  @override
  void undo() => originator.restore(_backup);
}
