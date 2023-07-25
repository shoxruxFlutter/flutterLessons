import 'package:flutter/material.dart';

class InheritCommunicateSWidget extends StatelessWidget {
  const InheritCommunicateSWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SimpleCalcWidget(),
      ),
    );
  }
}

class SimpleCalcWidget extends StatelessWidget {
  const SimpleCalcWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Column(
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
          )),
    );
  }
}

class FirstNumberWidget extends StatelessWidget {
  const FirstNumberWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(border: OutlineInputBorder()),
    );
  }
}

class SecondNumberWidget extends StatelessWidget {
  const SecondNumberWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(border: OutlineInputBorder()),
    );
  }
}

class SummButtonWidget extends StatelessWidget {
  const SummButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: const Text('Посчитать сумму'),
    );
  }
}

class ResultWidget extends StatelessWidget {
  const ResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('Результат');
  }
}
