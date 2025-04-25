import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter_bloc/bloc/counter_bloc/counter_bloc.dart';
import 'package:learn_flutter_bloc/bloc/counter_bloc/counter_event.dart';
import 'package:learn_flutter_bloc/bloc/counter_bloc/counter_state.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, CounterState>(builder: (context, state) => Text(state.counter.toString(), style: TextStyle(fontSize: 32))),
          const SizedBox(height: 35),
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(IncreamentCounter());
                    },
                    child: const Text('+', style: TextStyle(fontSize: 30)),
                  ),
                  const SizedBox(width: 35),
                  ElevatedButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(DecreamentCounter());
                    },
                    child: const Text('-', style: TextStyle(fontSize: 30)),
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
