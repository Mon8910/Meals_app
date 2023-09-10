import 'package:flutter/material.dart';

class MealItems extends StatelessWidget{
  const MealItems({super.key
  ,required this.icon,
  required this.title});
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
   return Row(
    children: [
      Icon(icon,color: Colors.white,size: 17,),
     const SizedBox(width: 8,),
      Text(title,style: const TextStyle(
        color: Colors.white
      ),)

    ],
   );
  }
}