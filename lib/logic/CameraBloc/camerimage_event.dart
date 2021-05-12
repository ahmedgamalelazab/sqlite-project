part of 'camerimage_bloc.dart';

@immutable
abstract class CamerimageEvent {}

class TakeImageSnapshoot extends CamerimageEvent {}

//this event this time should be working with a payload

class PushImageToList extends CamerimageEvent {
  final File imageTaken;
  final String placeText;

  PushImageToList({@required this.placeText, @required this.imageTaken});
}

class PushOfflineImageMode extends CamerimageEvent {
  final String placeText;

  PushOfflineImageMode({@required this.placeText});
}
