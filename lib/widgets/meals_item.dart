import 'package:flutter/material.dart';
import 'package:mealapps/model/meal.dart';
import 'package:mealapps/widgets/meal_items.dart';
import 'package:transparent_image/transparent_image.dart';

class MealsItems extends StatelessWidget {
  const MealsItems({super.key, required this.meals,
  required this.selectedmeal
  });
  final Meal meals;
  final void Function(Meal meal) selectedmeal;
  

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap:(){
          selectedmeal(meals);
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meals.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black54,
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                  child: Column(
                    children: [
                      Text(
                        meals.title,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          MealItems(
                              icon: Icons.schedule,
                              title: '${meals.duration} min '),
                          const SizedBox(
                            width: 12,
                          ),
                          MealItems(
                            icon: Icons.work,
                            title: meals.complexity.name[0].toUpperCase() +
                                meals.complexity.name.substring(1),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          MealItems(
                            icon: Icons.attach_money,
                            title: meals.affordability.name[0].toUpperCase() +
                                meals.affordability.name.substring(1),
                          )
                        ],
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
