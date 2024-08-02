import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../models/food.dart';
import '../screens/recipe.screen.dart';

class FoodCard extends StatelessWidget {
  final Food food;
  const FoodCard({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RecipeScreen(food: food),
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage(food.image),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  food.name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    const Icon(
                      Iconsax.flash_1,
                      size: 18,
                      color: Colors.black,
                    ),
                    Text(
                      "${food.cal} Cal",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                    const Text(
                      " · ",
                      style: TextStyle(color: Colors.black),
                    ),
                    const Icon(
                      Iconsax.clock,
                      size: 18,
                      color: Colors.black,
                    ),
                    Text(
                      "${food.time} Min",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),

              ],
            ),
            Positioned(
              top: 1,
              right: 1,
              child: IconButton(
                onPressed: () {},
                style: IconButton.styleFrom(
                  backgroundColor: Colors.white,
                  fixedSize: const Size(30, 30),
                ),
                iconSize: 20,
                icon: food.isLiked!
                    ? const Icon(
                  Iconsax.heart5,
                  color: Colors.red,
                )
                    : const Icon(Iconsax.heart),
              ),
            )
          ],
        ),
      ),
    );
  }
}
