import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealapps/model/meal.dart';

class Favoritemealsprovider extends StateNotifier<List<Meal>> {
  Favoritemealsprovider() : super([]);
  bool togglemealsfavorite(Meal meals) {
    final mealsfavorite = state.contains(meals);
    if (mealsfavorite) {
      state = state.where((m) => m.id != meals.id).toList();
      return false;
      // ano lw msh mowgoda httshal
    } else {
      state = [...state, meals];
      return true;
    }
  }
}

final favoritemealsprovider =
    StateNotifierProvider<Favoritemealsprovider, List<Meal>>((rref) {
  return Favoritemealsprovider();
});
