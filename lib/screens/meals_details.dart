import 'package:flutter/material.dart';
import 'package:mealapps/model/meal.dart';

class MealsDetails extends StatelessWidget {
  const MealsDetails({super.key, required this.meal,required this.selectedfvorite});
  final Meal meal;
  final void Function(Meal meal) selectedfvorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(meal.title),
          actions: [
            IconButton(onPressed: (){
              selectedfvorite(meal);
            }, icon:const Icon(Icons.star))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                meal.imageUrl,
                height: 400,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'ingredients',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 14,
              ),
              for (final gradient in meal.ingredients)
                Text(
                  gradient,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
               const SizedBox(height: 24,),
                Text(
                'steps',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 24,
              ),
              for (final steps in meal.steps)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 16),
                  child: Text(
                    steps,textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                          
                        ),
                  ),
                ),
                
              
            ],
          ),
        ));
  }
}
