import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealapps/provider/meals_provider.dart';

enum Filter {
  glutenfree,
  lactosefree,
  vegetarian,
  vegan,
}

class Filtersprovider extends StateNotifier<Map<Filter, bool>> {
  Filtersprovider()
      : super({
          Filter.glutenfree: false,
          Filter.lactosefree: false,
          Filter.vegetarian: false,
          Filter.vegan: false,
        });
      
  void onfilterprovider(Filter filter, bool isavaliable) {
    state = {...state, filter: isavaliable};
  
}
void setfilters(Map<Filter,bool> setfilter){
  state=setfilter;
// 3shan y3ml save ll value 2le hna 
}

}

final filterprovider =
    StateNotifierProvider<Filtersprovider, Map<Filter, bool>>(
        (ref) => Filtersprovider());


        final filtermealsprovider=Provider((ref) {
          final mealslist=ref.watch(dummymealsprovider);
           final currentfilters=ref.watch(filterprovider);
          
          return mealslist.where((meal) {
     
      if(currentfilters[Filter.glutenfree]! && !meal.isGlutenFree){
        return false ;
      }
      if(currentfilters[Filter.lactosefree]! && !meal.isLactoseFree){
        return false ;
      }
      if(currentfilters[Filter.vegetarian]! && !meal.isVegetarian){
        return false ;
      }
      if(currentfilters[Filter.vegan]! && !meal.isVegan){
        return false ;
      }
      return true ;

    }).toList();
          

        }
        );
