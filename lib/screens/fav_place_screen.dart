import 'package:flutter/material.dart';

class FavPlaceScreen extends StatelessWidget {
  const FavPlaceScreen({super.key, required this.placeName});
  final String placeName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          placeName,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.onPrimaryFixed,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Center(child: Text('No details Found')),
    );
  }
}
