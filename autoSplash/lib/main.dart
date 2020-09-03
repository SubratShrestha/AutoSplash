import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/': (context) => Home(),
    },
  ));
}
