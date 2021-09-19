import 'dart:io';

import 'package:flutter/material.dart';
import 'package:greatplaces/models/place.dart';

class GreatPlaces with ChangeNotifier {
  // ignore: prefer_final_fields
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(
    String title,
    File image,
  ) {
    final newPlace = Place(
      id: DateTime.now().toString(),
      title: title,
      location: null,
      image: image,
    );
    _items.add(newPlace);
    notifyListeners();
  }
}
