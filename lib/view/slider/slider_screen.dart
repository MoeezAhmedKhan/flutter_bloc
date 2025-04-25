import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter_bloc/bloc/slider_bloc/slider_bloc.dart';
import 'package:learn_flutter_bloc/bloc/slider_bloc/slider_event.dart';
import 'package:learn_flutter_bloc/bloc/slider_bloc/slider_state.dart';

class SliderScreen extends StatelessWidget {
  const SliderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("whole widget build");
    return Scaffold(
      body: BlocBuilder<SliderBloc, SliderState>(
        builder: (context, state) {
          return Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                color: Colors.lightBlue.withOpacity(state.slideValue),
              ),
              const SizedBox(height: 40),
              Slider(value: state.slideValue, onChanged: (value) {
                context.read<SliderBloc>().add(Slide(sliderValue: value));
              }),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text("Enable / Disable"),
                  Switch(value: state.isEnbale, onChanged: (value) {
                    context.read<SliderBloc>().add(Toggle());
                  },)
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
