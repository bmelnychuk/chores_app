import 'package:chores_app/branding/chores_app.dart';
import 'package:chores_app/chores/chores.dart';
import 'package:flutter/material.dart';
import 'package:chores_app/motivation/motivation.dart' as Motivation;

void main() {
  Motivation.OnInit(choreEvents).run();
  runApp(ChoresApp());
}
