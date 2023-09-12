import 'package:flutter/material.dart';
import 'package:mealapps/data/dummy_data.dart';
import 'package:mealapps/model/category.dart';
import 'package:mealapps/model/meal.dart';
import 'package:mealapps/screens/meals.dart';
import 'package:mealapps/widgets/category_frid_item.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key, required this.availabemeals});

  final List<Meal> availabemeals;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationexplect;
  @override
  void initState() {
    super.initState();
    _animationexplect = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      upperBound: 1,
      lowerBound: 0,
    );
    _animationexplect.forward();
  }

  @override
  void dispose() {
    _animationexplect.dispose();
    super.dispose();
  }

  void _selectedpage(BuildContext context, Category category) {
    final filteredid = widget.availabemeals
        .where(
          (meal) => meal.categories.contains(category.id),
        )
        .toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreens(
          title: category.title,
          meals: filteredid,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationexplect,
        child: GridView(
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
        ),
        builder: (context, child) => SlideTransition(
              position: 
                Tween(
                  begin:const Offset(0, .3),
                  end: const Offset(0, 0)
                  

                ).animate(CurvedAnimation(parent: _animationexplect, curve: Curves.easeInOut))
              
              ,child: child,
            ));
  }
}
