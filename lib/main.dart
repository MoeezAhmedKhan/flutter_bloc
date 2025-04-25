import 'package:flutter/material.dart';
import 'package:learn_flutter_bloc/Utils/image_picker.dart';
import 'package:learn_flutter_bloc/bloc/counter_bloc/counter_bloc.dart';
import 'package:learn_flutter_bloc/bloc/image_picker_bloc/image_picker_bloc.dart';
import 'package:learn_flutter_bloc/bloc/slider_bloc/slider_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter_bloc/view/image_picker/image_picker_screen.dart';
import 'package:learn_flutter_bloc/view/slider/slider_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => CounterBloc()),
      BlocProvider(create: (context) => SliderBloc()),
      BlocProvider(create: (context) => ImagePickerBloc(ImagePickerUtils())),
    ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: ImagePickerScreen(),
      ),
    );
  }
}