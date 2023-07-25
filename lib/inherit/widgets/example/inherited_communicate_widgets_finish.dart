import 'package:flutter/material.dart';

class InheritCommunicateFWidget extends StatelessWidget {
  const InheritCommunicateFWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SimpleCalcWidget(),
      ),
    );
  }
}

class SimpleCalcWidget extends StatefulWidget {
  const SimpleCalcWidget({super.key});

  @override
  State<SimpleCalcWidget> createState() => _SimpleCalcWidgetState();
}

class _SimpleCalcWidgetState extends State<SimpleCalcWidget> {
  final _model = SimpleCalcWidgetModel();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: SimpleCalcWidgetProvider(
            model: _model,
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FirstNumberWidget(),
                SizedBox(height: 10),
                SecondNumberWidget(),
                SizedBox(height: 10),
                SummButtonWidget(),
                SizedBox(height: 10),
                ResultWidget(),
              ],
            ),
          )),
    );
  }
}

class FirstNumberWidget extends StatelessWidget {
  const FirstNumberWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
      ),
      onChanged: (String value) =>
          SimpleCalcWidgetProvider.of(context)?.firstNumber = value,
    );
  }
}

class SecondNumberWidget extends StatelessWidget {
  const SecondNumberWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(border: OutlineInputBorder()),
      onChanged: (String value) =>
          SimpleCalcWidgetProvider.of(context)?.secondNumber = value,
    );
  }
}

class SummButtonWidget extends StatelessWidget {
  const SummButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => SimpleCalcWidgetProvider.of(context)?.summ(),
      child: const Text('Посчитать сумму'),
    );
  }
}

class ResultWidget extends StatefulWidget {
  const ResultWidget({super.key});

  @override
  State<ResultWidget> createState() => _ResultWidgetState();
}

class _ResultWidgetState extends State<ResultWidget> {
  var _value = '-1';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final model = SimpleCalcWidgetProvider.of(context);
    model?.addListener(() {
      _value = '${model.summResult}';
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text('Результат: $_value');
  }
}

class SimpleCalcWidgetModel extends ChangeNotifier {
  int? _firstNumber;
  int? _secondNumber;
  int? summResult;

  set firstNumber(String value) => _firstNumber = int.tryParse(value);
  set secondNumber(String value) => _secondNumber = int.tryParse(value);

  void summ() {
    if (_firstNumber != null && _secondNumber != null) {
      summResult = _firstNumber! + _secondNumber!;
    } else {
      summResult = null;
    }
    notifyListeners();
  }
}

class SimpleCalcWidgetProvider extends InheritedWidget {
  final SimpleCalcWidgetModel model;
  const SimpleCalcWidgetProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(key: key, child: child);

  static SimpleCalcWidgetModel? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<SimpleCalcWidgetProvider>()
        ?.model;
  }

  // static SimpleCalcWidgetProvider? of(BuildContext context) {
  //   return context
  //       .dependOnInheritedWidgetOfExactType<SimpleCalcWidgetProvider>();
  // }

  @override
  bool updateShouldNotify(SimpleCalcWidgetProvider oldWidget) {
    return model != oldWidget.model;
  }
}
