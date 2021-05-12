import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:native_device_devices/data/dataProvider/imageApi.dart';
import 'package:native_device_devices/data/dataProvider/placesApi.dart';
import 'package:native_device_devices/data/repository/imageRepository.dart';
import 'package:native_device_devices/logic/PlacesBloc/places_bloc.dart';

import 'data/repository/placesRepository.dart';
import 'logic/CameraBloc/camerimage_bloc.dart';
import 'routes/routers.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => ImageRepository(
            imageProcessApi: ImagePickerApi(),
          ),
        ),
        RepositoryProvider(
          create: (context) => PlacesRepository(
            placesApi: PlacesApi(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CamerimageBloc(
              imageRepository: RepositoryProvider.of<ImageRepository>(context),
            ),
          ),
          BlocProvider(
            create: (context) => PlacesBloc(
              placesRepository:
                  RepositoryProvider.of<PlacesRepository>(context),
            )..add(GetPlaces()),
          ),
        ],
        child: MaterialApp(
          routes: Routes.routes(),
          initialRoute: Routes.initialRoute(),
        ),
      ),
    );
  }
}
