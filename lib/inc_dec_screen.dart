import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_practice/bloc/counter_bloc.dart';

class IncDecScreen extends StatelessWidget {
  const IncDecScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                counterBloc.add(CounterIncremented());
              },
              child: const Text('increment'),
            ),
            ElevatedButton(
              onPressed: () {
                counterBloc.add(CounterDecremented());
              },
              child: const Text('decrement'),
            ),
          ],
        ),
      ),
    );
  }
}
