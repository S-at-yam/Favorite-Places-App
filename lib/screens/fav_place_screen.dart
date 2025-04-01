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
      body: Stack(
        children: [
          Image.file(
            place.image,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color.fromARGB(131, 0, 0, 0),
                    const Color.fromARGB(110, 17, 17, 17),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              child: Text(
                place.about,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
