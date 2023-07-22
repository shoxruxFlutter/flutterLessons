import 'package:flutter/material.dart';

import 'example.dart';

class JsonSerializable extends StatelessWidget {
  const JsonSerializable({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Json Serializable',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Example(),
    );
  }
}
