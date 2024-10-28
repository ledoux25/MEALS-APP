import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});

  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(decoration:BoxDecoration(
            gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.primaryContainer,
              Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8)
            ],begin:Alignment.topLeft ,end:Alignment.bottomRight)
          ) ,padding: const EdgeInsets.all(20),
          child:  Row(
            children: [
              Icon(Icons.fastfood, size: 48,color:  Theme.of(context).colorScheme.primary),
            const Gap(18),
              Text('Cooking Up!', style:Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary
              ) ,)
            ],
          ),
          ),
          ListTile(
            onTap: (){
                onSelectScreen('meals');
            },
            leading: Icon(Icons.restaurant, color: Theme.of(context).colorScheme.onSurface,),
            title: Text('Meals', style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
              fontSize: 24
            ),),
          ),
          ListTile(
            onTap: (){
              onSelectScreen('filters');
            },
            leading: Icon(Icons.settings, color: Theme.of(context).colorScheme.onSurface,),
            title: Text('Filters', style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
              fontSize: 24
            ),),
          ),
        ],
      ),
    );
  }
}