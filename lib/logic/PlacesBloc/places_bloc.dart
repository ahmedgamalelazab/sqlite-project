import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:native_device_devices/data/repository/placesRepository.dart';
import '../../data/Models/places.dart';

part 'places_event.dart';
part 'places_state.dart';

class PlacesBloc extends Bloc<PlacesEvent, PlacesState> {
  final PlacesRepository placesRepository;
  PlacesBloc({@required this.placesRepository}) : super(LoadingPlaces());

  @override
  Stream<PlacesState> mapEventToState(
    PlacesEvent event,
  ) async* {
    if (event is GetPlaces) {
      List<Places> places = [];
      try {
        places = await placesRepository.placesDataRaw();
        //if all are ok
        // print("calling from get : " + places[1].title);
        yield LoadedPlacesFromGetRequest(places: places);
      } catch (error) {
        print(error);
      }
    } else if (event is PlacesInsertPlace) {
      Places response;
      try {
        response = await placesRepository.insertPlacesInSqliteDB(
            event.id, event.imageTaken, event.title);
        //if all are ok
        print("calling from bloc : " + response.title);
        print("calling from bloc : " + response.image);
        print("calling from bloc : " + response.id);
        yield LoadedPlacesFromPostRequest();
      } catch (error) {
        print(error);
      }
    }
  }
}
