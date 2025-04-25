import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learn_flutter_bloc/Utils/image_picker.dart';
import 'package:learn_flutter_bloc/bloc/image_picker_bloc/image_picker_event.dart';
import 'package:learn_flutter_bloc/bloc/image_picker_bloc/image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {

  // ImagePickerUtils will be pass as dependency injection in this bloc
  ImagePickerUtils? imagePickerUtils;
  ImagePickerBloc(this.imagePickerUtils) : super(ImagePickerState()){
      on<ImagePickerEventFromCamera>(_catureFromCamera);
      on<ImagePickerEventFromGallery>(_catureFromGallery);
  }

  void _catureFromCamera(ImagePickerEventFromCamera event, Emitter<ImagePickerState> emit) async {
    XFile? file = await imagePickerUtils?.fromCamera();
    emit(state.copyWith(file: file));
  }

  void _catureFromGallery(ImagePickerEventFromGallery event, Emitter<ImagePickerState> emit) async {
    XFile? file = await imagePickerUtils?.fromGallery();
    emit(state.copyWith(file: file));
  }
}
