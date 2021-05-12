part of 'camerimage_bloc.dart';

@immutable
abstract class CameraImagePickerState {}

class CameraImagePickerInitialState extends CameraImagePickerState {}

class ImageTaken extends CameraImagePickerState {
  final File imageTaken;
  final File savedFileLocation;

  ImageTaken({@required this.savedFileLocation, @required this.imageTaken});
}

class ImageGrouping extends CameraImagePickerState {
  final List<File> iamges;
  final String placeText;

  ImageGrouping({@required this.placeText, @required this.iamges});
}
