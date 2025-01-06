import 'package:meals/providers/meals_provider.dart';
import 'package:riverpod/riverpod.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FilterNotifier extends StateNotifier<Map<Filter, bool>> {
  FilterNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegetarian: false,
          Filter.vegan: false
        });

  void setFilters(Map<Filter,bool> choosenFilter){
    state = choosenFilter;
  }

  void setFilter(Filter filter, bool isActive) {
    // state[filter] = isActive;
    state = {...state, filter: isActive};
  }
}

final filtersProvider =
    StateNotifierProvider<FilterNotifier, Map<Filter, bool>>(
        (ref) => FilterNotifier());

final filterMealsProvider = Provider((ref){
  final meals = ref.watch(mealsProvider);
  final activeFilter = ref.watch(filtersProvider);

  return meals.where((meal){
    if(activeFilter[Filter.glutenFree]! && !meal.isGlutenFree){
      return false;
    }
    if(activeFilter[Filter.lactoseFree]! && !meal.isLactoseFree){
      return false;
    }
    if(activeFilter[Filter.vegetarian]! && !meal.isVegetarian){
      return false;
    }
    if(activeFilter[Filter.vegan]! && !meal.isVegan){
      return false;
    }
    return true;
  }).toList();
});