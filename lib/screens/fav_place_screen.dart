import 'package:favorite_places/models/place.dart';
import 'package:flutter/material.dart';

class FavPlaceScreen extends StatelessWidget {
  const FavPlaceScreen({super.key, required this.place});
  final Place place;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          place.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.onPrimaryFixed,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Center(
        child: Text(
          place.title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}
