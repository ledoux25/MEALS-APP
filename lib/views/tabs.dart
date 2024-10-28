import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/favorites_provider.dart';
import 'package:meals_app/providers/filters_provider.dart';
import 'package:meals_app/providers/meals_provider.dart';
import 'package:meals_app/views/categories.dart';
import 'package:meals_app/views/filters.dart';
import 'package:meals_app/views/meals.dart';
import 'package:meals_app/widgets/main_drawer.dart';


const kInitilFilters = {
    Filter.glutenFree : false,
    Filter.lactoseFree : false,
    Filter.vegan : false,
    Filter.vegeterian : false
  };

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;




  void _selectedPage(index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    final availableMeals = ref.watch(filteredMealsProvider);

    Widget activePage = CategoriesScreen(
      availableMeals: availableMeals,
    );
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
     final favoriteMeals = ref.watch(favoriteMealsProvider);
      activePage = MealsScreen(
        meals: favoriteMeals,
      );
      activePageTitle = 'Favorites';
    }

    void _setScreen(String identifier) async {
      Navigator.of(context).pop();

      if (identifier == 'filters') {
        final result = await Navigator.of(context)
            .push<Map<Filter, bool>>(MaterialPageRoute(builder: (ctx) => const FiltersScreen()));
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectedPage,
          currentIndex: _selectedPageIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.set_meal), label: 'Categories'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
          ]),
    );
  }
}
