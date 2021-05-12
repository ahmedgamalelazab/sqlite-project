part of 'places_bloc.dart';

@immutable
abstract class PlacesEvent {}

class GetPlaces extends PlacesEvent {}

class PlacesInsertPlace extends PlacesEvent {
  //payload
  final String title;
  final String id;
  final File imageTaken;

  PlacesInsertPlace(
      {@required this.title, @required this.id, @required this.imageTaken});
}
