import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter_bloc/bloc/image_picker_bloc/image_picker_bloc.dart';
import 'package:learn_flutter_bloc/bloc/image_picker_bloc/image_picker_event.dart';
import 'package:learn_flutter_bloc/bloc/image_picker_bloc/image_picker_state.dart';

class ImagePickerScreen extends StatelessWidget {
  const ImagePickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Image Picker")),
      body: BlocBuilder<ImagePickerBloc, ImagePickerState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              state.file == null ? InkWell(onTap: () {
                context.read<ImagePickerBloc>().add(ImagePickerEventFromCamera());
              },child: const CircleAvatar(minRadius: 45, child: Icon(Icons.camera, size: 65,))) : Image.file(File(state.file!.path.toString())),
            ],
          );
        },
      ),
    );
  }
}
