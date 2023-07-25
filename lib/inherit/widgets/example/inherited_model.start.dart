import 'package:flutter/material.dart';

class ExampleInheritedModelSWidget extends StatefulWidget {
  const ExampleInheritedModelSWidget({super.key});

  @override
  State<ExampleInheritedModelSWidget> createState() =>
      _ExampleInheritedModelSWidgetState();
}

class _ExampleInheritedModelSWidgetState
    extends State<ExampleInheritedModelSWidget> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: DataOwnerStatefull()),
    );
  }
}

class DataOwnerStatefull extends StatefulWidget {
  const DataOwnerStatefull({super.key});

  @override
  State<DataOwnerStatefull> createState() => _DataOwnerStatefullState();
}

class _DataOwnerStatefullState extends State<DataOwnerStatefull> {
  var _valueOne = 0;
  var _valueTwo = 0;

  void _incrementOne() {
    _valueOne += 1;
    setState(() {});
  }

  void _incrementTwo() {
    _valueTwo += 1;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: _incrementOne,
          child: const Text('Жми раз'),
        ),
        ElevatedButton(
          onPressed: _incrementTwo,
          child: const Text('Жми два'),
        ),
        DataProviderInherited(
          valueOne: _valueOne,
          valueTwo: _valueTwo,
          child: const ConsumerStateless(),
        )
      ],
    );
  }
}

class ConsumerStateless extends StatelessWidget {
  const ConsumerStateless({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${DataProviderInherited.of(context)?.valueOne ?? 0}'),
        const DataConsumerStatefull(),
      ],
    );
  }
}

class DataConsumerStatefull extends StatefulWidget {
  const DataConsumerStatefull({super.key});

  @override
  State<DataConsumerStatefull> createState() => _DataConsumerStatefullState();
}

class _DataConsumerStatefullState extends State<DataConsumerStatefull> {
  @override
  Widget build(BuildContext context) {
    final value = context
            .dependOnInheritedWidgetOfExactType<DataProviderInherited>()
            ?.valueTwo ??
        0;
    return Text('$value');
  }
}

class DataProviderInherited extends InheritedWidget {
  final int valueOne;
  final int valueTwo;

  const DataProviderInherited({
    Key? key,
    required this.valueOne,
    required this.valueTwo,
    required Widget child,
  }) : super(key: key, child: child);

  static DataProviderInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DataProviderInherited>();
  }

  @override
  bool updateShouldNotify(DataProviderInherited oldWidget) {
    return valueOne != oldWidget.valueOne || valueTwo != oldWidget.valueTwo;
  }
}

T? getInherit<T>(BuildContext context) {
  final element =
      context.getElementForInheritedWidgetOfExactType<DataProviderInherited>();
  final widget = element?.widget;
  if (widget is T) {
    return widget as T;
  } else {
    return null;
  }
}
