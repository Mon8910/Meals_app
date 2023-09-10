import 'package:flutter/material.dart';
import 'package:mealapps/data/dummy_data.dart';
import 'package:mealapps/model/category.dart';
import 'package:mealapps/model/meal.dart';
import 'package:mealapps/screens/meals.dart';
import 'package:mealapps/widgets/category_frid_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen(
      {super.key, required this.selectedfvorite, required this.availabemeals});
  final void Function(Meal meal) selectedfvorite;
  final List<Meal> availabemeals;
  void _selectedpage(BuildContext context, Category category) {
    final filteredid = availabemeals
        .where(
          (meal) => meal.categories.contains(category.id),
        )
        .toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreens(
          title: category.title,
          meals: filteredid,
          selectedfvorite: selectedfvorite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
              category: category,
              selectedpage: () {
                _selectedpage(context, category);
              })

        // _selectedpage(context,category));
        //for(final category in availableCategories)
      ],
    );
  }
}
