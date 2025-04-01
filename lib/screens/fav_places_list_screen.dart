import 'package:favorite_places/provider/user_places.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:favorite_places/screens/new_place_screen.dart';
import 'package:favorite_places/widgets/place_list.dart';
import 'package:flutter/material.dart';

class FavPlacesList extends ConsumerStatefulWidget {
  const FavPlacesList({super.key});

  @override
  ConsumerState<FavPlacesList> createState() {
    return _FavPlacesListState();
  }
}

class _FavPlacesListState extends ConsumerState<FavPlacesList> {
  late Future<void> _loadedPlace;
  @override
  void initState() {
    super.initState();
    _loadedPlace = ref.read(userPlacesProvider.notifier).loadPlaces();
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen;

    final userPlace = ref.watch(userPlacesProvider);

    if (userPlace.isEmpty) {
      activeScreen = Center(
        child: Text(
          'No places added yet.',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Theme.of(context).colorScheme.onSecondaryContainer,
          ),
        ),
      );
    } else {
      activeScreen = Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: _loadedPlace,
          builder:
              (context, snapshot) =>
                  snapshot.connectionState == ConnectionState.waiting
                      ? Center(child: CircularProgressIndicator())
                      : PlaceList(places: userPlace),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'My favorite Places',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.onPrimaryFixed,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => NewPlaceScreen()));
            },
            icon: Icon(
              Icons.add,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ],
      ),
      body: activeScreen,
    );
  }
}
