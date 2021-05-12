import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';

import '../Models/places.dart';
import '../dataProvider/placesApi.dart';

class PlacesRepository {
  final PlacesFullLatestApi placesApi;

  PlacesRepository({@required this.placesApi});

  Future<List<Places>> placesDataRaw() async {
    List<Places> dataRaw = [];
    try {
      dataRaw = await placesApi.getPlaces();
      // if all are ok
      // print("repository calls data raw : " + dataRaw[1].title);
      return dataRaw;
    } catch (error) {
      print(error);
    }
    return dataRaw;
  }

  Future<Places> insertPlacesInSqliteDB(
      String id, File imgPath, String title) async {
    Places places;
    try {
      places = await placesApi.insertPlace(id, imgPath, title);
      //if all are ok
      return places;
    } catch (error) {
      print(error);
    }
    return Places(id: "NaN", image: "Nimage", title: "Error in insertion code");
  }

  //post

}
