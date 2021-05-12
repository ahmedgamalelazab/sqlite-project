import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:native_device_devices/Views/Screens/add_place_screen.dart';
import 'package:native_device_devices/logic/PlacesBloc/places_bloc.dart';

// ignore: must_be_immutable
class PlacesListScreen extends StatelessWidget {
  static const String PageRoute = "/places_list_screen";
  PlacesListScreen({Key key}) : super(key: key);
  String result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("your places"),
        actions: [
          IconButton(
              onPressed: () async {
                Navigator.of(context).pushNamed(AddPlaceScreen.PageRoute);
              },
              icon: Icon(Icons.add)),
        ],
      ),
      body: BlocBuilder<PlacesBloc, PlacesState>(builder: (context, state) {
        if (state is LoadedPlacesFromGetRequest) {
          return Scaffold(
            body: ListView.builder(
              itemCount: state.places.length,
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  title: Text(state.places[index].title),
                  leading: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(40.0)),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(40.0)),
                      child: Image.file(
                        File(state.places[index].image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }

        return Scaffold(
            body: Center(
          child: CircularProgressIndicator(),
        ));
      }),
    );
  }
}
