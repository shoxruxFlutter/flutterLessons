import 'package:flutter/material.dart';

class InheritNotifierFFWidget extends StatelessWidget {
  const InheritNotifierFFWidget({super.key});

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
          SimpleCalcWidgetProvider.read(context)?.firstNumber = value,
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
          SimpleCalcWidgetProvider.read(context)?.secondNumber = value,
    );
  }
}

class SummButtonWidget extends StatelessWidget {
  const SummButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => SimpleCalcWidgetProvider.read(context)?.summ(),
      child: const Text('Посчитать сумму'),
    );
  }
}

class ResultWidget extends StatelessWidget {
  const ResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final result = SimpleCalcWidgetProvider.watch(context)?.summResult ?? '-1';
    return Text('Результат: $result');
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

class SimpleCalcWidgetProvider
    extends InheritedNotifier<SimpleCalcWidgetModel> {
  const SimpleCalcWidgetProvider({
    Key? key,
    required SimpleCalcWidgetModel model,
    required Widget child,
  }) : super(key: key, notifier: model, child: child);

  static SimpleCalcWidgetModel? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<SimpleCalcWidgetProvider>()
        ?.notifier;
  }

  static SimpleCalcWidgetModel? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<SimpleCalcWidgetProvider>()
        ?.widget;
    return widget is SimpleCalcWidgetProvider ? widget.notifier : null;
  }

  // static SimpleCalcWidgetProvider? of(BuildContext context) {
  //   return context
  //       .dependOnInheritedWidgetOfExactType<SimpleCalcWidgetProvider>();
  // }
}



// class ChangeNotifierProvider<T extends ChangeNotifier>
//     extends InheritedNotifier<T> {
//   ChangeNotifierProvider({
//     Key? key,
//     required T model,
//     required Widget child,
//   }) : super(
//           key: key,
//           notifier: model,
//           child: child,
//         );

//   static T? watch<T extends ChangeNotifier>(BuildContext context) {
//     return context
//         .dependOnInheritedWidgetOfExactType<ChangeNotifierProvider<T>>()
//         ?.notifier;
//   }

//   static T? read<T extends ChangeNotifier>(BuildContext context) {
//     final widget = context
//         .getElementForInheritedWidgetOfExactType<ChangeNotifierProvider<T>>()
//         ?.widget;
//     if (widget is ChangeNotifierProvider<T>) {
//       return widget.notifier;
//     } else {
//       return null;
//     }
//   }
// }