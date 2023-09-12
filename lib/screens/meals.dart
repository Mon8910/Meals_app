import 'package:flutter/material.dart';
import 'package:mealapps/model/meal.dart';
import 'package:mealapps/screens/meals_details.dart';
import 'package:mealapps/widgets/meals_item.dart';

class MealsScreens extends StatelessWidget {
  const MealsScreens({super.key, this.title, required this.meals});
  final String? title;
  final List<Meal> meals;

  void _selectedmeal(context, Meal meals) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsDetails(
          meal: meals,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealsItems(
              meals: meals[index],
              selectedmeal: (meals) {
                _selectedmeal(context, meals);
              },
            ));
    if (meals.isEmpty) {
      content = Center(
        child: Column(
          children: [
            Text(
              'oh sorry nothing here ',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'please select the different category',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            )
          ],
        ),
      );
    }
    if (title == null) {
      return content;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: content);
  }
}
