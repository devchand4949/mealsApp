import 'package:flutter/material.dart';
import 'package:meals/models/meals_model.dart';
import 'package:meals/widget/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal,required this.onSelectMeal});

  final Meal meal;
  final void Function(BuildContext context,Meal meal) onSelectMeal;


  String get  complexityText{
    //String first latter capital and other small ,
    return meal.complexity.name[0].toUpperCase() + meal.complexity.name.substring(1);
    //substring fun is start string when you are provide specific index ex= Simple->imple
  }

  String get affordabilityText{
    return meal.affordability.name[0].toUpperCase() + meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {
          onSelectMeal(context,meal);
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),//kTransparentImage is get by transparent_image package
              image: NetworkImage(meal.imageUrl),
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
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                  child: Column(
                    children: [
                      Text(
                        meal.title,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style:const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MealItemTrait(icon: Icons.schedule, label: '${meal.duration} min'),
                          SizedBox(width: 10,),
                          MealItemTrait(icon: Icons.work, label: complexityText),
                          SizedBox(width: 10,),
                          MealItemTrait(icon: Icons.attach_money, label: affordabilityText)

                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
