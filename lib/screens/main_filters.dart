import 'package:flutter/material.dart';
import 'package:mealapps/provider/filters_provideer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class MainFilters extends ConsumerWidget {
  const MainFilters({super.key});
  
  


  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final activefilter=ref.watch(filterprovider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body:  Column(
          children: [
            SwitchListTile(
              value: activefilter[Filter.glutenfree]!,
              onChanged: (ischaked) {
                ref.read(filterprovider.notifier).onfilterprovider(Filter.glutenfree, ischaked);

                
              },
              title: Text(
                'Gluten-free',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'only include gluten-free meals',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34,right: 22),
            ),
            SwitchListTile(
              value: activefilter[Filter.lactosefree]!,
              onChanged: (ischaked) {
                ref.read(filterprovider.notifier).onfilterprovider(Filter.lactosefree, ischaked);
                
              },
              title: Text(
                'lactose-free',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'only include lactose-free meals',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34,right: 22),
            ),
            SwitchListTile(
              value: activefilter[Filter.vegetarian]!,
              onChanged: (ischaked) {
                ref.read(filterprovider.notifier).onfilterprovider(Filter.vegetarian, ischaked);
                
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'only include vegetarian meals',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34,right: 22),
            ),
            SwitchListTile(
              value: activefilter[Filter.vegan]!,
              onChanged: (ischaked) {
                ref.read(filterprovider.notifier).onfilterprovider(Filter.vegan, ischaked);
                
              },
              title: Text(
                'vegan',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'only include vegan meals',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34,right: 22),
            ),
          ],
        ),
      );
    
  }
}
