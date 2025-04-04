import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/screens/fav_place_screen.dart';
import 'package:flutter/material.dart';

class PlaceList extends StatelessWidget {
  const PlaceList({super.key, required this.places});
  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return ListTile(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => FavPlaceScreen(place: places[index]),
              ),
            );
          },
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          leading: CircleAvatar(
            radius: 26,
            backgroundImage: FileImage(places[index].image),
          ),
          title: Text(
            places[index].title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        );
      },
      itemCount: places.length,
    );
  }
}
