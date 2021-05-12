import 'dart:io';

import 'dart:async';

import 'package:flutter/foundation.dart';

import '../dataProvider/imageApi.dart';

class ImageRepository {
  final ImagePickerProcessApi imageProcessApi;

  ImageRepository({@required this.imageProcessApi});

  Future<File> getImageFromCamera() async {
    File imageTakenFromCamera;

    try {
      imageTakenFromCamera = await imageProcessApi.takeImageSnapShoot();
      return imageTakenFromCamera;
    } catch (error) {
      print(error);
    }

    //if all fails

    return imageTakenFromCamera;
  }
}
