import 'package:flutter/material.dart';
import 'package:greatplaces/models/place.dart';

class GreatPlaces with ChangeNotifier {
  // ignore: prefer_final_fields
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }
}
