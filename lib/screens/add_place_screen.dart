import 'dart:io';

import 'package:flutter/material.dart';
import 'package:greatplaces/providers/great_places.dart';
import 'package:provider/provider.dart';

import '/widgets/image_input.dart';

class AddPlacesScreen extends StatefulWidget {
  const AddPlacesScreen({Key? key}) : super(key: key);
  static const routeNamed = '/add-place';

  @override
  _AddPlacesScreenState createState() => _AddPlacesScreenState();
}

class _AddPlacesScreenState extends State<AddPlacesScreen> {
  File? _pickedImage;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _savePlace() {
    if (_titlecontroller!.text.isEmpty || _pickedImage == null) {
      return;
    }
    Provider.of<GreatPlaces>(context, listen: false)
        .addPlace(_titlecontroller!.text, _pickedImage!);
    Navigator.of(context).pop();
  }

  TextEditingController? _titlecontroller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Place'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      label: Text('Title'),
                    ),
                    controller: _titlecontroller!,
                  ),
                  const SizedBox(height: 10),
                  ImageInput(_selectImage)
                ],
              ),
            ),
          )),
          const SizedBox(height: 30),
          ElevatedButton.icon(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Theme.of(context).colorScheme.onSecondary)),
            onPressed: _savePlace,
            icon: const Icon(Icons.add),
            label: const Text('Add Place'),
          )
        ],
      ),
    );
  }
}
