import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/screen/tab_screen.dart';
import 'package:meals/widget/main_drawer.dart';
import 'package:meals/providers/filters_provider.dart';
import 'package:riverpod/riverpod.dart';

// enum Filter{
//   glutenFree,
//   lactoseFree,
//   vegetarian,
//   vegan
// }

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({
    super.key,
    // required this.currentFilter
  });
  // final Map<Filter,bool> currentFilter;
//   @override
//   ConsumerState<FiltersScreen> createState() => _FiltersScreenState();
// }
//
// class _FiltersScreenState extends ConsumerState<FiltersScreen> {
//   var _glutenFreeFilterSet = false;
//   var _lactoseFreeFilterSet = false;
//   var _vegetarianFilterSet = false;
//   var _vegenFilterSet = false;

  @override
  // void initState() {
  //   super.initState();
  //   final activeFilter = ref.read(filtersProvider);
  //   _glutenFreeFilterSet = activeFilter[Filter.glutenFree]!;
  //   _lactoseFreeFilterSet = activeFilter[Filter.lactoseFree]!;
  //   _vegetarianFilterSet = activeFilter[Filter.vegetarian]!;
  //   _vegenFilterSet = activeFilter[Filter.vegan]!;
  // }

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your filter'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: activeFilters[Filter.glutenFree]!,
            onChanged: (isChecked) {
              ref.read(filtersProvider.notifier).setFilter(Filter.glutenFree, isChecked);
            },
            title: Text(
              'Gluten-Free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'only include gluten-free meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filter.lactoseFree]!,
            onChanged: (isChecked) {
              ref.read(filtersProvider.notifier).setFilter(Filter.lactoseFree, isChecked);
            },
            title: Text(
              'lactose-Free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'only include lactose-free meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filter.vegetarian]!,
            onChanged: (isChecked) {
              ref.read(filtersProvider.notifier).setFilter(Filter.vegetarian, isChecked);
            },
            title: Text(
              'vegeterian-Free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'only include vegeterian-free meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filter.vegan]!,
            onChanged: (isChecked) {
              ref.read(filtersProvider.notifier).setFilter(Filter.vegan, isChecked);
            },
            title: Text(
              'vegen-Free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'only include vegan-free meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          )
        ],
      ),
    );
  }
}
