import 'package:flutter/material.dart';
import 'package:flutter_lessons/inherit/widgets/example/find_ancestor_state.dart';
import 'package:flutter_lessons/inherit/widgets/example/inherited_communicate_widgets_finish.dart';
import 'package:flutter_lessons/inherit/widgets/example/inherited_communicate_widgets_start.dart';
import 'package:flutter_lessons/inherit/widgets/example/inherited_model.start.dart';
import 'package:flutter_lessons/inherit/widgets/example/inherited_model_finish.dart';
import 'package:flutter_lessons/inherit/widgets/example/inherited_notifier_finish.dart';
import 'package:flutter_lessons/inherit/widgets/example/inherited_widget.dart';

class InheritExample extends StatelessWidget {
  const InheritExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inherit Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      // home: const ExampleInheritedWidget(),
      // home: const ExampleInheritedModelSWidget(),
      // home: const ExampleInheritedModelFWidget(),
      // home: const InheritCommunicateSWidget(),
      // home: const InheritCommunicateFWidget(),
      home: const InheritNotifierFFWidget(),
      // home: const FindAncestorStateWidget(),
    );
  }
}
