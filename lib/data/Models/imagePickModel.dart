import 'dart:io';
import 'package:flutter/foundation.dart';

class ImagePickerModel {
  final File image;
  File get imageTaken => image;
  ImagePickerModel({@required this.image});
}
