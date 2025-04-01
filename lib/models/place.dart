import 'dart:io';

import 'package:uuid/uuid.dart';

var uuid = Uuid();

class Place {
  Place({required this.title, required this.image, required this.about})
    : id = uuid.v4();

  final String id;
  final String title;
  final File image;
  final String about;
}
