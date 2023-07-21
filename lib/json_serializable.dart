import 'package:flutter/material.dart';

class JsonSerializable extends StatelessWidget {
  const JsonSerializable({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: JsonExampleProvider(
          coder: JsonExampleCoder(),
          child: const ButtonWidget(),
        ),
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        ElevatedButton(
          onPressed: () => JsonExampleProvider.read(context)?.coder.encode(),
          child: const Text('Кодировать'),
        ),
        ElevatedButton(
          onPressed: () => JsonExampleProvider.read(context)?.coder.decode(),
          child: const Text('Декодировать'),
        ),
      ]),
    );
  }
}

class JsonExampleProvider extends InheritedWidget {
  final JsonExampleCoder coder;

  const JsonExampleProvider({
    Key? key,
    required this.coder,
    required Widget child,
  }) : super(
          key: key,
          child: child,
        );

  static JsonExampleProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<JsonExampleProvider>();
  }

  static JsonExampleProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<JsonExampleProvider>()
        ?.widget;
    return widget is JsonExampleProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}

class JsonExampleCoder {
  void encode() {}
  void decode() {}
}
