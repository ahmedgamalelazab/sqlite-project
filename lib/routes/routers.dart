import '../Views/Screens/Places_list_screen.dart';
import '../Views/Screens/add_place_screen.dart';
import '../Views/Screens/testScreen.dart';

class Routes {
  static routes() {
    return {
      TestScreen.pageRoute: (context) => TestScreen(),
      PlacesListScreen.PageRoute: (context) => PlacesListScreen(),
      AddPlaceScreen.PageRoute: (context) => AddPlaceScreen(),
    };
  }

  static initialRoute() {
    return PlacesListScreen.PageRoute;
  }
}
