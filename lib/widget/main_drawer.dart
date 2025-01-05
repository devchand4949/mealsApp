import 'package:flutter/material.dart';
import 'package:meals/screen/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key,required this.onSelectScreen});
  final void Function(String identifier) onSelectScreen;


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context)
                    .colorScheme
                    .onPrimaryContainer
                    .withOpacity(0.8)
              ], begin: Alignment.topLeft, end: Alignment.bottomLeft)),
              child: Row(
                children: [
                  Icon(
                    Icons.fastfood,
                    size: 48,
                  ),
                  SizedBox(
                    width: 18,
                  ),
                  Text(
                    'Cookinng Up!',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Theme.of(context).colorScheme.primary),
                  )
                ],
              )),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 26,
            ),
            title: Text(
              'meals',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 24),
            ),
            onTap: () => onSelectScreen('meals'),
          ),
          ListTile(
            leading: Icon(
              Icons.restore,
              size: 26,
            ),
            title: Text(
              'filters',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 24),
            ),
            onTap: () => onSelectScreen('filters'),
          )
        ],
      ),
    );
  }
}
