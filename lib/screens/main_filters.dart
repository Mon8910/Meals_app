import 'package:flutter/material.dart';

enum Filter {
  glutenfree,
  lactosefree,
  vegetarian,
  vegan,

}

class MainFilters extends StatefulWidget {
  const MainFilters({super.key,required this.currentstate});
  final Map<Filter,bool> currentstate;
  @override
  State<MainFilters> createState() {
    return _MainFiltersState();
  }
}

class _MainFiltersState extends State<MainFilters> {
  var _glutenfilters=false ;
  var _lactosefilters=false;
  var _vegetarian=false;
  var _vegan=false;
  @override
  void initState() {
   
    super.initState();
    _glutenfilters=widget.currentstate[Filter.glutenfree]!;
    _lactosefilters=widget.currentstate[Filter.lactosefree]!;
    _vegetarian=widget.currentstate[Filter.vegetarian]!;
    _vegan=widget.currentstate[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: WillPopScope(
        onWillPop: ()async {
          Navigator.of(context).pop({
            Filter.glutenfree: _glutenfilters,
            Filter.lactosefree:_lactosefilters,
            Filter.vegetarian:_vegetarian,
            Filter.vegan:_vegan
          }
          

          );
          return false ;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenfilters,
              onChanged: (ischaked) {
                setState(() {
                  _glutenfilters=ischaked;
                });
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
              value: _lactosefilters,
              onChanged: (ischaked) {
                setState(() {
                  _lactosefilters=ischaked;
                });
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
              value: _vegetarian,
              onChanged: (ischaked) {
                setState(() {
                  _vegetarian=ischaked;
                });
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
              value: _vegan,
              onChanged: (ischaked) {
                setState(() {
                  _vegan=ischaked;
                });
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
      ),
    );
  }
}
