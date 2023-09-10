import 'package:flutter/material.dart';
import 'package:mealapps/data/dummy_data.dart';
import 'package:mealapps/model/meal.dart';
import 'package:mealapps/screens/category_screen.dart';
import 'package:mealapps/screens/main_filters.dart';
import 'package:mealapps/screens/meals.dart';
import 'package:mealapps/widgets/main_drawer.dart';

const kintialvalue={
  Filter.glutenfree:false,
    Filter.lactosefree:false,
    Filter.vegetarian:false,
    Filter.vegan:false,

};

class Tapscreen extends StatefulWidget {
  const Tapscreen({super.key});
  @override
  State<Tapscreen> createState() {
    return _TapscreenState();
  }
}

class _TapscreenState extends State<Tapscreen> {
  int selectedpageindex = 0;
  var screentext = 'category';
  final List<Meal> _favoritemeals = [];
  Map<Filter,bool> selectedfilter=kintialvalue;

  
  void _showsnacbar(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void _selectedfavo(Meal meals) {
    final  _checkmeal = _favoritemeals.contains(meals);
    if (_checkmeal) {
      setState(() {
        _favoritemeals.remove(meals);
      });
      _showsnacbar('no favourite food is remove');
    } else {
      setState(() {
        _favoritemeals.add(meals);
      });
      _showsnacbar('favourite food is add');
    }
  }

  void _selecteddrawer(String indentify) async{
     Navigator.of(context).pop();
    if (indentify == 'filters') {
     
     final result=await Navigator.of(context).push<Map<Filter,bool>>(
        MaterialPageRoute(
          builder: (context) => MainFilters(currentstate: selectedfilter),
        ),
      );
      setState(() {
        selectedfilter=result ??kintialvalue;
              },
              );
    } 
  }

  void _selectedbottom(int index) {
    setState(() {
      selectedpageindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final availabemealss=dummyMeals.where((meal) {
      if(selectedfilter[Filter.glutenfree]! && !meal.isGlutenFree){
        return false ;
      }
      if(selectedfilter[Filter.lactosefree]! && !meal.isLactoseFree){
        return false ;
      }
      if(selectedfilter[Filter.vegetarian]! && !meal.isVegetarian){
        return false ;
      }
      if(selectedfilter[Filter.vegan]! && !meal.isVegan){
        return false ;
      }
      return true ;

    }).toList();

    Widget pageindex = CategoryScreen(
      selectedfvorite: _selectedfavo,
      availabemeals:availabemealss ,
    );
    // leh tb2a zero 3shan el bottom category we wa7d shan tb2a el tanya 3shan a7na bnsht8l list
    if (selectedpageindex == 1) {
      pageindex = MealsScreens(
        meals: _favoritemeals,
        selectedfvorite: _selectedfavo,
      );
      screentext = 'favourits';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(screentext),
      ),
      drawer: MainDrawer(
        onslecteddrawer: _selecteddrawer,
      ),
      body: pageindex,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedbottom,
        currentIndex: selectedpageindex
        //de ll tmez
        ,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'category'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'favorite')
        ],
      ),
    );
  }
}
