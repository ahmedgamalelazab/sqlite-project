import 'dart:async';
import 'dart:io';
import 'package:native_device_devices/data/repository/imageRepository.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as sysPath;

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'camerimage_event.dart';
part 'camerimage_state.dart';

class CamerimageBloc extends Bloc<CamerimageEvent, CameraImagePickerState> {
  final ImageRepository imageRepository;
  List<File> images = [];
  CamerimageBloc({@required this.imageRepository})
      : super(CameraImagePickerInitialState());

  @override
  Stream<CameraImagePickerState> mapEventToState(
    CamerimageEvent event,
  ) async* {
    if (event is TakeImageSnapshoot) {
      try {
        File imageTaken;
        imageTaken = await imageRepository.getImageFromCamera();
        print('image taken path : $imageTaken');
        final appDir = await sysPath.getApplicationDocumentsDirectory();
        final imageName = path.basename(imageTaken.path);
        final savedFile = await imageTaken.copy('${appDir.path}/$imageName');
        yield ImageTaken(imageTaken: imageTaken, savedFileLocation: savedFile);
      } catch (error) {
        print(error);
      }
    } else if (event is PushImageToList) {
      File newIamge = event.imageTaken;
      try {
        images.add(newIamge);
      } catch (error) {
        print(error);
      }
      print("yielding the group");
      yield ImageGrouping(iamges: images, placeText: event.placeText);
    }
  }
}
