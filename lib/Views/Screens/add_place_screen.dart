import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:native_device_devices/logic/PlacesBloc/places_bloc.dart';

import '../../logic/CameraBloc/camerimage_bloc.dart';

// ignore: must_be_immutable
class AddPlaceScreen extends StatefulWidget {
  static const String PageRoute = "/addPlaceScreen";
  AddPlaceScreen({Key key}) : super(key: key);

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  String placeTitle;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    Size getSize(Set<MaterialState> states) {
      if (states.any((state) => state == MaterialState.pressed)) {
        return Size(deviceSize.width, 50.00);
      }
      return Size(deviceSize.width, 50.00);
    }

    return BlocConsumer<CamerimageBloc, CameraImagePickerState>(
        builder: (context, state) {
      if ((state is ImageTaken)) {
        return Scaffold(
            appBar: AppBar(
              title: Text("add Place Screen"),
            ),
            body: BlocConsumer<PlacesBloc, PlacesState>(
              listener: (context, statee) {
                if (statee is LoadedPlacesFromPostRequest) {
                  BlocProvider.of<PlacesBloc>(context).add(GetPlaces());
                  Navigator.of(context).pop(context);
                }
              },
              builder: (context, statee) {
                return Container(
                  width: deviceSize.width,
                  height: deviceSize.height,
                  // color: Colors.yellow,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Form(
                                key: formKey,
                                child: Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    onSaved: (value) {
                                      placeTitle = value;
                                      print(value);
                                    },
                                  ),
                                ),
                              ),
                              //Row with image container and button to pic a picture from the device
                              imagePicker(
                                  context, deviceSize, state.imageTaken),
                            ],
                          ),
                        ),
                      ),
                      ElevatedButton.icon(
                          style: ButtonStyle(
                            // backgroundColor: MaterialStateProperty.all(Colors.red),
                            fixedSize: MaterialStateProperty.resolveWith(
                                (states) => getSize(states)),
                            tapTargetSize: (MaterialTapTargetSize.shrinkWrap),
                            elevation: MaterialStateProperty.all(0.00),
                          ),
                          onPressed: () {
                            formKey.currentState.save();
                            print(placeTitle);
                            BlocProvider.of<PlacesBloc>(context).add(
                              PlacesInsertPlace(
                                imageTaken: state.imageTaken,
                                title: placeTitle,
                                id: DateTime.now().toString(),
                              ),
                            );
                          },
                          icon: Icon(Icons.add),
                          label: Text("add place")),
                    ],
                  ),
                );
              },
            ));
      }
      return Scaffold(
        appBar: AppBar(
          title: Text("add Place Screen"),
        ),
        body: Container(
          width: deviceSize.width,
          height: deviceSize.height,
          // color: Colors.yellow,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Form(
                        key: formKey,
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(
                            onSaved: (value) {
                              placeTitle = value;
                            },
                          ),
                        ),
                      ),
                      //Row with image container and button to pic a picture from the device
                      imagePicker(context, deviceSize, null),
                    ],
                  ),
                ),
              ),
              ElevatedButton.icon(
                  style: ButtonStyle(
                    // backgroundColor: MaterialStateProperty.all(Colors.red),
                    fixedSize: MaterialStateProperty.resolveWith(
                        (states) => getSize(states)),
                    tapTargetSize: (MaterialTapTargetSize.shrinkWrap),
                    elevation: MaterialStateProperty.all(0.00),
                  ),
                  onPressed: () {
                    formKey.currentState.save();
                    print(placeTitle);
                    BlocProvider.of<CamerimageBloc>(context)
                        .add(PushOfflineImageMode(placeText: placeTitle));
                  },
                  icon: Icon(Icons.add),
                  label: Text("add place")),
            ],
          ),
        ),
      );
    }, listener: (context, state) {
      if (state is ImageGrouping) {
        Navigator.of(context).pop();
      }
    });
  }
}

Widget imagePicker(BuildContext context, Size deviceSize, File imageFile) {
  return Padding(
    padding: EdgeInsets.all(deviceSize.height * 0.025),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          color: Colors.grey,
          alignment: Alignment.center,
          height: deviceSize.height * 0.15,
          width: deviceSize.height * 0.15,
          child: imageFile != null
              ? Image.file(
                  imageFile,
                  fit: BoxFit.cover,
                )
              : Text("No image taken!"),
        ),
        ElevatedButton.icon(
          icon: Icon(Icons.camera),
          onPressed: () {
            BlocProvider.of<CamerimageBloc>(context).add(TakeImageSnapshoot());
          },
          label: Text("add pic"),
        )
      ],
    ),
  );
}
