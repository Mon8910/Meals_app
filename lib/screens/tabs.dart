import 'package:flutter/material.dart';

import 'package:mealapps/provider/favouritemeals_provider.dart';
import 'package:mealapps/screens/category_screen.dart';
import 'package:mealapps/screens/main_filters.dart';
import 'package:mealapps/screens/meals.dart';
import 'package:mealapps/widgets/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealapps/provider/filters_provideer.dart';



class Tapscreen extends ConsumerStatefulWidget {
  const Tapscreen({super.key});
  @override
  ConsumerState<Tapscreen> createState() {
    return _TapscreenState();
  }
}

class _TapscreenState extends ConsumerState<Tapscreen> {
  int selectedpageindex = 0;
  var screentext = 'category';

  

  
  

  

  void _selecteddrawer(String indentify) async{
     Navigator.of(context).pop();
    if (indentify == 'filters') {
     
     await Navigator.of(context).push<Map<Filter,bool>>(
        MaterialPageRoute(
          builder: (context) =>const MainFilters(),
        ),
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
    

    final availabemealss=ref.watch(filtermealsprovider);
    

    Widget pageindex = CategoryScreen(
      
      availabemeals:availabemealss ,
    );
    // leh tb2a zero 3shan el bottom category we wa7d shan tb2a el tanya 3shan a7na bnsht8l list
    if (selectedpageindex == 1) {
      final favoprovider=ref.watch(favoritemealsprovider);
      pageindex = MealsScreens(
        meals: favoprovider,
        
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
