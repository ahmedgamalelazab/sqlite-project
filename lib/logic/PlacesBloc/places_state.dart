part of 'places_bloc.dart';

@immutable
abstract class PlacesState {}

class LoadingPlaces extends PlacesState {}

class LoadedPlacesFromGetRequest extends PlacesState {
  final List<Places> places;

  LoadedPlacesFromGetRequest({@required this.places});
}

class LoadedPlacesFromPostRequest extends PlacesState {}
