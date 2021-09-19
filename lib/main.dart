import 'package:flutter/material.dart';
import 'package:greatplaces/screens/add_place_screen.dart';
import 'package:greatplaces/screens/places_list_screen.dart';
import 'package:provider/provider.dart';

import '/providers/great_places.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (c) => GreatPlaces(),
      child: MaterialApp(
        title: 'Great Places',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.indigo,
          ).copyWith(
            secondary: Colors.amber,
          ),
        ),
        home: const PlacesListScreen(),
        routes: {AddPlacesScreen.routeNamed: (ctx) => const AddPlacesScreen()},
      ),
    );
  }
}
