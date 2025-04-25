import 'package:image_picker/image_picker.dart';

class ImagePickerUtils{
  ImagePicker imagePicker = ImagePicker();
  Future<XFile?> fromCamera() async{
    final XFile? file = await imagePicker.pickImage(source: ImageSource.camera);
    return file;
  }
  Future<XFile?> fromGallery() async{
    final XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
    return file;
  }
}