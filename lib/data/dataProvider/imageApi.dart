import 'dart:io';
import 'dart:async';

import 'package:image_picker/image_picker.dart';

abstract class ImagePickerProcessApi {
  Future<File> takeImageSnapShoot();
}

class ImagePickerApi extends ImagePickerProcessApi {
  @override
  Future<File> takeImageSnapShoot() async {
    File imageTaken;
    final imagePick = ImagePicker();
    try {
      final imagePicker = await imagePick.getImage(source: ImageSource.camera);
      if (imagePicker != null) {
        imageTaken = File(imagePicker.path);
        print(imageTaken.path);
        return imageTaken;
      }
    } catch (error) {
      print(error);
    }
    return imageTaken; //in this case will return null for sure
  }
}
