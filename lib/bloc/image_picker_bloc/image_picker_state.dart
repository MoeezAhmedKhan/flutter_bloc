import 'package:image_picker/image_picker.dart';

class ImagePickerState{
  final XFile? file;
  ImagePickerState({this.file});
  ImagePickerState copyWith({XFile? file}){
    return ImagePickerState(file: file ?? this.file);
  }
}