import 'package:flutter/cupertino.dart';

import 'package:comic_book_app/screens/details_screen.dart';
import 'package:comic_book_app/screens/home_screen.dart';

// ignore: non_constant_identifier_names
final Map<String, Widget Function(BuildContext )> app_routes={
  'home'       :  (_) => HomeScreen(),
  'details'    :  (_) => DetailsScreen()
};