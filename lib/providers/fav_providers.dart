import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';


class FavouriteMealsNotifier extends StateNotifier <List<Meal>> {
  // setting up initial data by using constructor.
  // super is used to reach the parent class (StateNotifier)
  FavouriteMealsNotifier() : super([]);

  bool toggleMealFavStatus (Meal meal) {
    final isFavMeal = state.contains(meal);
    
    if(isFavMeal) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state,meal];
      return true;
    }

    state = []; // replacing the value bc adding or removing is not allowed
  }
}

final favouriteMealsProvider = StateNotifierProvider<FavouriteMealsNotifier, List<Meal>>((ref) {
  return FavouriteMealsNotifier();
});