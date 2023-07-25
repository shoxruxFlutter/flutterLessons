import 'package:flutter/material.dart';

class ExampleInheritedWidget extends StatefulWidget {
  const ExampleInheritedWidget({super.key});

  @override
  State<ExampleInheritedWidget> createState() => _ExampleInheritedWidgetState();
}

class _ExampleInheritedWidgetState extends State<ExampleInheritedWidget> {
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
  var _value = 0;

  void _increment() {
    _value += 1;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: _increment,
          child: const Text('Жми'),
        ),
        DataProviderInherited(
          value: _value,
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
        Text('${DataProviderInherited.of(context)?.value ?? 0}'),
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
            ?.value ??
        0;
    // final element = context
    //     .getElementForInheritedWidgetOfExactType<DataProviderInherited>();
    // final widget = element?.widget as DataProviderInherited;

    // final value = getInherit<DataProviderInherited>(context)?.value;

    // return Text('${DataProviderInherited.of(context)?.value ?? 0}');
    return Text('$value');
  }
}

class DataProviderInherited extends InheritedWidget {
  final int value;

  const DataProviderInherited({
    Key? key,
    required this.value,
    required Widget child,
  }) : super(key: key, child: child);

  static DataProviderInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DataProviderInherited>();
  }

  @override
  bool updateShouldNotify(DataProviderInherited oldWidget) {
    return value != oldWidget.value;
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
