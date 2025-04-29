import 'package:flutter/material.dart';
import 'package:learn_flutter_bloc/Utils/image_picker.dart';
import 'package:learn_flutter_bloc/bloc/counter_bloc/counter_bloc.dart';
import 'package:learn_flutter_bloc/bloc/favourite_bloc/favourite_bloc.dart';
import 'package:learn_flutter_bloc/bloc/image_picker_bloc/image_picker_bloc.dart';
import 'package:learn_flutter_bloc/bloc/slider_bloc/slider_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter_bloc/bloc/todo_bloc/todo_bloc.dart';
import 'package:learn_flutter_bloc/repository/favourite_repo.dart';
import 'package:learn_flutter_bloc/view/favourite/favourite_screen.dart';
import 'package:learn_flutter_bloc/view/image_picker/image_picker_screen.dart';
import 'package:learn_flutter_bloc/view/posts/posts_screen.dart';
import 'package:learn_flutter_bloc/view/slider/slider_screen.dart';
import 'package:learn_flutter_bloc/view/todo/todo_screen.dart';

import 'bloc/posts_bloc/posts_bloc.dart';

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
      BlocProvider(create: (context) => TodoBloc()),
      BlocProvider(create: (context) => FavouriteBloc(FavouriteRepo())),
      BlocProvider(create: (context) => PostBloc()),
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.dark,
          useMaterial3: true,
        ),
        home: const PostsScreen(),
      ),
    );
  }
}