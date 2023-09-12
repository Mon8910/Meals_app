import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealapps/data/dummy_data.dart';

final dummymealsprovider=Provider((ref) {
  return dummyMeals;
});