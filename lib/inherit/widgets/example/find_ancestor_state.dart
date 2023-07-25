import 'package:flutter/material.dart';

class FindAncestorStateWidget extends StatefulWidget {
  const FindAncestorStateWidget({super.key});

  @override
  State<FindAncestorStateWidget> createState() =>
      _FindAncestorStateWidgetState();
}

class _FindAncestorStateWidgetState extends State<FindAncestorStateWidget> {
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
        const ConsumerStateless()
      ],
    );
  }
}

class ConsumerStateless extends StatelessWidget {
  const ConsumerStateless({super.key});

  @override
  Widget build(BuildContext context) {
    final value =
        context.findAncestorStateOfType<_DataOwnerStatefullState>()?._value ??
            0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$value'),
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
    final value =
        context.findAncestorStateOfType<_DataOwnerStatefullState>()?._value ??
            0;
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
