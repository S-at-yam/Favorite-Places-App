import 'dart:io';

import 'package:favorite_places/provider/user_places.dart';
import 'package:favorite_places/widgets/input_picture.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class NewPlaceScreen extends ConsumerStatefulWidget {
  const NewPlaceScreen({super.key});

  @override
  ConsumerState<NewPlaceScreen> createState() {
    return _NewPlaceScreenState();
  }
}

class _NewPlaceScreenState extends ConsumerState<NewPlaceScreen> {
  final _placeNameController = TextEditingController();
  File? _selectedImage;
  final _about = TextEditingController();

  void _savePlace() {
    final enteredTitle = _placeNameController.text;
    if (enteredTitle == 'null' ||
        _selectedImage == null ||
        _about.text.isEmpty) {
      return;
    }
    ref
        .read(userPlacesProvider.notifier)
        .addPlace(enteredTitle, _selectedImage!, _about.text);
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    super.dispose();
    _placeNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add new Place',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.onPrimaryFixed,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,

          children: [
            TextField(
              decoration: InputDecoration(label: Text('New Place')),
              controller: _placeNameController,
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),
            InputPicture(
              onPickImage: (image) {
                _selectedImage = image;
              },
            ),
            const SizedBox(height: 20),
            Container(
              height: 250,
              width: double.infinity,
              child: TextField(
                controller: _about,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                style: GoogleFonts.roboto(color: Colors.white),

                decoration: InputDecoration(
                  label: Text(
                    'Why is it your favorite place?',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.amber,
                      fontSize: 20,
                    ),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: _savePlace,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add),
                  const SizedBox(width: 6),
                  Text('Add', style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
