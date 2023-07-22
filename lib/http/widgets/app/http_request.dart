import 'package:flutter/material.dart';

import '../example/example.dart';

class HttpRequest extends StatelessWidget {
  const HttpRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Http requests',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Example(),
    );
  }
}
