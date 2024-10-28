import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/meals_provider.dart';

enum Filter  {
  glutenFree,
  lactoseFree,
  vegeterian,
  vegan

}

class FiltersProvider extends StateNotifier<Map<Filter, bool>>{
  FiltersProvider() : super({
    Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.vegeterian: false,
    Filter.vegan: false,
  });

  void setFilter(Filter filter, bool isActive){
    state = {...state, filter: isActive};
  }

  void setFilters(Map<Filter,bool> chosenFilters){
    state = chosenFilters;

  }

}



final filtersProvider = StateNotifierProvider<FiltersProvider, Map<Filter, bool>>((ref) {
  return FiltersProvider();
});

final filteredMealsProvider = Provider((ref){
  final meals = ref.watch(mealsProvider);
  final activeFilters = ref.watch(filtersProvider);
  return meals.where((meal) {
      if(activeFilters[Filter.glutenFree]! && !meal.isGlutenFree){
        return false;
      }
            if(activeFilters[Filter.lactoseFree]! && !meal.isGlutenFree){
        return false;
      }
            if(activeFilters[Filter.vegan]! && !meal.isVegan){
        return false;
      }
            if(activeFilters[Filter.vegeterian]! && !meal.isVegetarian){
        return false;
      }

      return true;
    }).toList();
});