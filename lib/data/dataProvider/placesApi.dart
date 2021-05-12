import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:native_device_devices/data/Models/places.dart';
import 'package:native_device_devices/helper/db.dart';

abstract class PlacesFullLatestApi {
  Future<Places> insertPlace(String id, File imagePicker, String title);
  Future<List<Places>> getPlaces();
}

class PlacesApi extends PlacesFullLatestApi {
  @override
  Future<List<Places>> getPlaces() async {
    List<Places> places = [];
    try {
      final dataBase =
          await DBConnect.sqliteDB(); // connect uri database tables
      final response = await dataBase.query("place"); //query
      print(response);
      response.map((place) => places.add(Places.fromJson(place))).toList();
      // print('api work');
      // print("getter here fomr api : " + places[1].title);
      // print("getter here fomr api : " + places[1].image);
      // print("getter here fomr api : " + places[1].id);
      return places;
    } catch (error) {
      // throw (error);
      print(error);
    }
    //return empty places in case if failure
    return places;
  }

  @override
  Future<Places> insertPlace(String id, File imagePicker, String title) async {
    Places places;
    try {
      places = Places(id: id, image: imagePicker.path, title: title);
      final dataBase = await DBConnect.sqliteDB();
      await dataBase.insert("place", places.toJson());
      //if all ok without damn error
      return places;
    } catch (error) {
      print(error);
    }
    return Places(
        id: "NaN", image: "404 image", title: "error insertion level");
  }
}
