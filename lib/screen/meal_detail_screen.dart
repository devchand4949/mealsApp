import 'package:flutter/material.dart';
import 'package:meals/models/meals_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/favorites_provider.dart';

class MealDetailScreen extends ConsumerWidget {
  const MealDetailScreen({
    super.key,
    required this.meal,
    // required this.onSelectFavoriteItem
  });

  final Meal meal;
  // final void Function(Meal meal) onSelectFavoriteItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeals =  ref.watch(favoriteMealsProvider);

    final isfavorite = favoriteMeals.contains(meal);

    return Scaffold(
        appBar: AppBar(
          title: Text(meal.title),
          actions: [
            //this are use for the favorite.............
            IconButton(
                onPressed: () {
                  final wasAdded = ref
                      .read(favoriteMealsProvider.notifier)
                      .toggleMealFavoriteStatus(meal);
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(wasAdded
                          ? 'added meals your favorites'
                          : 'remove meals your favorites')));
                },
                icon: Icon(isfavorite ? Icons.star : Icons.star_border))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // 1. image can display......
              Image.network(
                meal.imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),

              Column(
                //meals details
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 2. ingredients can display.......
                  Text(
                    'Ingredients',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  for (final ingredient in meal.ingredients)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 6),
                      child: Text(
                        ingredient,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground),
                      ),
                    ),
                  const SizedBox(
                    height: 12,
                  ),

                  // 3.step for build cook.............,
                  Text(
                    'Step',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  for (final step in meal.steps)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 6),
                      child: Text(step,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground)),
                    ),
                ],
              )
            ],
          ),
        ));
  }
}
